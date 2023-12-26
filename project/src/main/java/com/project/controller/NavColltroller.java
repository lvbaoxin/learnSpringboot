package com.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.project.common.QueryPageParam;
import com.project.common.Result;
import com.project.entity.Nav;
import com.project.entity.User;
import com.project.mapper.NavMapper;
import com.project.service.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/nav")
public class NavColltroller {
    @Autowired
    private NavService navService;
    private NavMapper navMapper;
    @GetMapping("/list")
    public List<Nav> list(){
        return navService.list();
    }
    @GetMapping("/list2")
    public Result list2( @RequestParam int id){
       // HashMap param = query.getParam();

//        LambdaQueryWrapper queryWrapper = new LambdaQueryWrapper();
//       queryWrapper.eq("typeId",id);


        return Result.success(200,navService.count(),"成功",navService.list());
    }
}
