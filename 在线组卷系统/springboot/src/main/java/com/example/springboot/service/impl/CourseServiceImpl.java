package com.example.springboot.service.impl;

import com.example.springboot.entity.Course;
import com.example.springboot.mapper.CourseMapper;
import com.example.springboot.service.ICourseService;
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
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements ICourseService {

}
