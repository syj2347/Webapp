package com.example.springboot.mapper;

import com.example.springboot.entity.PaperQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.springboot.entity.Question;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 
 * @since 2022-05-04
 */
public interface PaperQuestionMapper extends BaseMapper<PaperQuestion> {

    List<Question> selectQuestions(Integer paperId);

}
