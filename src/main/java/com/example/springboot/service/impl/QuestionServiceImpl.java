package com.example.springboot.service.impl;

import com.example.springboot.entity.Question;
import com.example.springboot.mapper.QuestionMapper;
import com.example.springboot.service.IQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 */
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements IQuestionService {

}
