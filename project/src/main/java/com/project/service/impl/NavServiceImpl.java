package com.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.project.entity.Nav;
import com.project.mapper.NavMapper;

import com.project.service.NavService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NavServiceImpl extends ServiceImpl<NavMapper, Nav> implements NavService {
    @Resource
    private NavMapper navMapper;

    @Override
    public boolean save(Nav nav) {
        return navMapper.insert(nav) > 0;
    }

    @Override
    public boolean update(Nav nav) {
        return navMapper.updateById(nav) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return navMapper.deleteById(id) > 0;
    }

    @Override
    public Nav getById(Integer id) {
        return navMapper.selectById(id);
    }

    @Override
    public List<Nav> getAll() {
        return navMapper.selectList(null);
    }
}
