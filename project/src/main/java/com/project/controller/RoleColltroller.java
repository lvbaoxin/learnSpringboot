package com.project.controller;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.QueryPageParam;
import com.project.common.Result;
import com.project.entity.Role;
import com.project.mapper.RoleMapper;
import com.project.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@RequestMapping("/role")
public class RoleColltroller {
    @Autowired
    private RoleService roleService;
    private RoleMapper roleMapper;
    @GetMapping("/addRole")
    public Result  addRole(@RequestParam String roleName ){
        if(StringUtils.isEmpty(roleName)){
            throw new RuntimeException("标题不能为空");
        }
        Role role=new Role();
        role.setRoleName(roleName);
        return Result.success(200,"添加成功",roleService.save(role));
    }


    @GetMapping("/roles")
    public Result List() {
        System.out.println(roleService.list() + "roleList");
        return Result.success(200, roleService.count(),"成功",roleService.list());
    }
    @GetMapping("/role/{id}")
    public Result getObj(@PathVariable String id){
        System.out.println(roleService.getById(id));
        return Result.success(200,"成功",roleService.getById(id));
    }
    @PostMapping("/list")
    public Result listPage(@RequestBody QueryPageParam query){
        System.out.println(query+"query");
        HashMap param = query.getParam();
        Page<Role> page = new Page(query.getPageNum(), query.getPageSize());
        LambdaQueryWrapper<Role> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.like(Role::getRoleName,query.getSearch());
        IPage result = roleService.page(page, queryWrapper);
        return Result.success(200, result.getTotal(),"成功",result.getRecords());
    }


}
