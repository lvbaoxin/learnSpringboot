package com.project.controller;

import com.project.common.MyDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class TestController {

    @Autowired
    private MyDataSource MyDataSource;

    @GetMapping("/test")
    public String test() {
        System.out.println(MyDataSource);
        return MyDataSource.getUsername();
    }
}
