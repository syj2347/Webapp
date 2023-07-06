package com.example.springboot.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.controller.dto.HandPaperDTO;
import com.example.springboot.controller.dto.PaperDTO;
import com.example.springboot.entity.PaperQuestion;
import com.example.springboot.entity.Question;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.service.IPaperQuestionService;
import com.example.springboot.service.IQuestionService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.entity.User;
import com.example.springboot.utils.TokenUtils;

import com.example.springboot.service.IPaperService;
import com.example.springboot.entity.Paper;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author
 */
@RestController
@RequestMapping("/paper")
public class PaperController {

    @Resource
    private IPaperService paperService;

    @Resource
    private IQuestionService questionService;

    @Resource
    private IPaperQuestionService paperQuestionService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Paper paper) {
        if (paper.getId() == null) {
            //paper.setTime(DateUtil.now());
            //paper.setUser(TokenUtils.getCurrentUser().getUsername());
        }
        paperService.saveOrUpdate(paper);
        return Result.success();
    }

    @PostMapping("/handPaper")
    public Result handPaper(@RequestBody HandPaperDTO paperDTO) {
        // 删除老的试卷
        UpdateWrapper<PaperQuestion> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("paper_id", paperDTO.getPaperId());
        paperQuestionService.remove(updateWrapper);

        if (CollUtil.isEmpty(paperDTO.getHandleQuestionIds())) {
            throw new ServiceException("-1", "题目数量不足");
        }
        List<Integer> handleQuestionIds = paperDTO.getHandleQuestionIds();
        List<PaperQuestion> list = new ArrayList<>();
        for (Integer handleQuestionId : handleQuestionIds) {
            PaperQuestion paperQuestion = new PaperQuestion();
            paperQuestion.setPaperId(paperDTO.getPaperId());
            paperQuestion.setQuestionId(handleQuestionId);
            list.add(paperQuestion);
        }
        paperQuestionService.saveBatch(list);
        return Result.success();
    }

    @PostMapping("/takePaper")
    public Result takePaper(@RequestBody PaperDTO paperDTO) {
        // 删除老的试卷
        UpdateWrapper<PaperQuestion> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("paper_id", paperDTO.getPaperId());
        paperQuestionService.remove(updateWrapper);


        QueryWrapper<Question> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", paperDTO.getCourseId());
        // 根据课程id查出所有该课程的题目，然后再根据type去分
        List<Question> questionList = questionService.list(queryWrapper);
        List<Question> type1List = questionList.stream().filter(question -> question.getType() == 1).collect(Collectors.toList());  // 选择
        List<Question> type2List = questionList.stream().filter(question -> question.getType() == 2).collect(Collectors.toList());  // 判断
        List<Question> type3List = questionList.stream().filter(question -> question.getType() == 3).collect(Collectors.toList());  // 问答
        if (type1List.size() < paperDTO.getType1()) {
            throw new ServiceException("-1", "选择题数量不足");
        }
        if (type2List.size() < paperDTO.getType2()) {
            throw new ServiceException("-1", "判断题数量不足");
        }
        if (type3List.size() < paperDTO.getType3()) {
            throw new ServiceException("-1", "问答题数量不足");
        }
        // 开始随机组卷
        List<PaperQuestion> paperQuestion = getPaperQuestion(type1List.size(), paperDTO.getType1(), type1List, paperDTO.getPaperId());
        paperQuestion.addAll(getPaperQuestion(type2List.size(), paperDTO.getType2(), type2List, paperDTO.getPaperId()));
        paperQuestion.addAll(getPaperQuestion(type3List.size(), paperDTO.getType3(), type3List, paperDTO.getPaperId()));
        paperQuestionService.saveBatch(paperQuestion);  // 批量插入关联关系表
        return Result.success();
    }

    // 封装一个获取试卷和题目关联关系list的方法
    private List<PaperQuestion> getPaperQuestion(int questionSize, int paperQuestionSize, List<Question> source, Integer paperId) {
        List<Integer> typeRandomList = getEleList(questionSize, paperQuestionSize);
        List<PaperQuestion> list = new ArrayList<>();
        for (Integer index : typeRandomList) {
            Question question = source.get(index);
            PaperQuestion paperQuestion = new PaperQuestion();
            paperQuestion.setPaperId(paperId);
            paperQuestion.setQuestionId(question.getId());
            list.add(paperQuestion);
        }
        return list;
    }
    // 封装一个获取随机数的方法
    private List<Integer> getEleList(int sourceSize, int resultSize) {
        List<Integer> list = CollUtil.newArrayList();
        for (int i = 0; i < sourceSize; i++) {
            list.add(i);
        }
        return RandomUtil.randomEleList(list, resultSize);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        paperService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        paperService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/view/{paperId}")
    public Result view(@PathVariable Integer paperId) {
        List<Question> list = paperQuestionService.selectQuestions(paperId);
        return Result.success(list);
    }

    @GetMapping
    public Result findAll() {
        return Result.success(paperService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(paperService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam(required = false) Integer courseId,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Paper> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        if (courseId != null) {
            queryWrapper.eq("course_id", courseId);
        }
//        User currentUser = TokenUtils.getCurrentUser();
//        if (currentUser.getRole().equals("ROLE_USER")) {
//            queryWrapper.eq("user", currentUser.getUsername());
//        }
        return Result.success(paperService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Paper> list = paperService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Paper信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

        }

    /**
     * excel 导入
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Paper> list = reader.readAll(Paper.class);

        paperService.saveBatch(list);
        return Result.success();
    }

    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

