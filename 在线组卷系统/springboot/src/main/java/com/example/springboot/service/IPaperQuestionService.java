package com.example.springboot.service;

import com.example.springboot.entity.PaperQuestion;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springboot.entity.Question;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author
 */
public interface IPaperQuestionService extends IService<PaperQuestion> {

    List<Question> selectQuestions(Integer paperId);

}
