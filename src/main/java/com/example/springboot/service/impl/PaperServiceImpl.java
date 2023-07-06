package com.example.springboot.service.impl;

import com.example.springboot.entity.Paper;
import com.example.springboot.mapper.PaperMapper;
import com.example.springboot.service.IPaperService;
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
public class PaperServiceImpl extends ServiceImpl<PaperMapper, Paper> implements IPaperService {

}
