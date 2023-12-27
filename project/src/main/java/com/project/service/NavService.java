package com.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.project.entity.Nav;

import java.util.List;


public interface NavService extends IService<Nav> {
    boolean save(Nav nav);
    boolean update(Nav nav);
    boolean delete(Integer id);
    Nav getById(Integer id);
    List<Nav> getAll();
}
