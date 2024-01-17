package com.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.QueryPageParam;
import com.project.common.Result;
import com.project.entity.Blog;
import com.project.entity.User;
import com.project.mapper.BlogMapper;
import com.project.service.IBlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import javax.xml.ws.soap.Addressing;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-17
 */
@RestController
@RequestMapping("/blog")
public class BlogController {
    @Autowired
    private IBlogService iBlogService;

    //列表
    @RequestMapping("/listPage")
    public Result list(@RequestBody QueryPageParam query) {
        try {
            //分页查询
            HashMap param = query.getParam();
            Page<Blog> page = new Page<>(query.getPageNum(), query.getPageSize());
            LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper();
            queryWrapper.like(param.get("title") != null, Blog::getTitle, param.get("title").toString());
            IPage result = iBlogService.page(page, queryWrapper);
            return Result.success(200, result.getTotal(), "成功", result.getRecords());
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
    }

    //新增
    @PostMapping("/add")
    public Result add(@RequestBody Blog blog) {
        try {

            System.out.println(blog + "blog");
            if (blog.getTitle() == null || blog.getTitle().equals("")) {
                return Result.success(200, "标题不能为空", null);
            } else {
                blog.setCreateAt(LocalDateTime.now());
                blog.setUpdateAt(LocalDateTime.now());
                blog.setBlogcategoryId(1L);
                iBlogService.save(blog);
            }

            return Result.success(200, "成功", null);
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }

    }


}