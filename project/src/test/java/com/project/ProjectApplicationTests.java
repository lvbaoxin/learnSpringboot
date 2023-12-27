package com.project;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.entity.Nav;
import com.project.mapper.NavMapper;
import com.project.service.NavService;
import org.apache.logging.log4j.util.Strings;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ProjectApplicationTests {
    @Autowired
    private NavMapper navMapper;
    @Test
    void contextLoads() {
        System.out.println(navMapper.selectList(null));
    }
    @Test
    void getNavByType(){
        System.out.println(navMapper.getNavByType(1));
    }

    @Test
    void getPage(){
        IPage page = new Page(1,2);
        navMapper.selectPage(page,null);
        System.out.println(page.getPages()+"一共");
        System.out.println(page.getRecords()+"当前");
    }
    @Test
    void searchName(){

        QueryWrapper<Nav> qw = new QueryWrapper<>();
        qw.like(true,"title","o");
        navMapper.selectList(qw);

    }
}
