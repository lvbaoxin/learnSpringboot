package com.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.QueryPageParam;
import com.project.common.Result;
import com.project.entity.Blog;
import com.project.entity.Blogcategory;
import com.project.entity.User;
import com.project.mapper.BlogMapper;
import com.project.mapper.BlogcategoryMapper;
import com.project.service.IBlogService;
import com.project.service.IBlogcategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import javax.xml.ws.soap.Addressing;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
    private IBlogcategoryService iBlogcategoryService;
    //列表
    @PostMapping("/listPage")
    public Result list(@RequestBody HashMap query) {
        try {
            //分页查询

            Page<Blog> page = new Page<>((Integer) query.get("pageNum"), (Integer) query.get("pageSize"));
            LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper();
            queryWrapper.like(query.get("search") != null, Blog::getTitle, query.get("search").toString());
            queryWrapper.orderByAsc(Blog::getSort); // 添加排序规则
            IPage result = iBlogService.page(page, queryWrapper);
            //BlogcategoryMapper.selectBlogCategories(1);

            // 查询所有分类
//            List<Blog> records  = result.getRecords();
//
//            // 查询每篇文章对应的分类
//            for (Blog blog : records ) {
//              //  if(iBlogcategoryService.getById(blog.getBlogcategoryId())!=null){
//                    System.out.println(iBlogcategoryService.getById(1)+"blog.getBlogcategoryId()");
//              //  }
//
//
//
//              //  List<Blogcategory> blogCategories = BlogcategoryMapper.selectBlogCategories(blog.getBlogcategoryId());
//             //   blog.setCategories(blogCategories);
//            }



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