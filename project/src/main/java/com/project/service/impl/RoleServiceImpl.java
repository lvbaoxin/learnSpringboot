package com.project.service.impl;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.project.entity.Role;
import com.project.mapper.RoleMapper;
import com.project.service.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
