package com.project;

import com.project.entity.Nav;
import com.project.mapper.NavMapper;
import com.project.service.NavService;
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


}
