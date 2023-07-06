package com.example.springboot.service.impl;

import com.example.springboot.entity.PaperQuestion;
import com.example.springboot.entity.Question;
import com.example.springboot.mapper.PaperQuestionMapper;
import com.example.springboot.service.IPaperQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 */
@Service
public class PaperQuestionServiceImpl extends ServiceImpl<PaperQuestionMapper, PaperQuestion> implements IPaperQuestionService {

    @Resource
    private PaperQuestionMapper paperQuestionMapper;


    @Override
    public List<Question> selectQuestions(Integer paperId) {
        return paperQuestionMapper.selectQuestions(paperId);
    }
}
