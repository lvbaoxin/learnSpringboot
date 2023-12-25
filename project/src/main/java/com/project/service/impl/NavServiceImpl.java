package com.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.project.entity.Nav;
import com.project.mapper.NavMapper;

import com.project.service.NavService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class NavServiceImpl extends ServiceImpl<NavMapper, Nav> implements NavService {
    @Resource
    private NavMapper NavMapper;

}
