package com.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.QueryPageParam;
import com.project.common.Result;
import com.project.entity.Blog;
import com.project.entity.Blogcategory;
import com.project.service.IBlogcategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-17
 */
@RestController
@RequestMapping("/blogcategory")
public class BlogcategoryController {
    //列表
    @Autowired
    private IBlogcategoryService iBlogcategoryService;
    @GetMapping("list")
    public Result list(){
        QueryWrapper<Blogcategory> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("sort");
        List<Blogcategory> list = iBlogcategoryService.list(wrapper);
        return Result.success(200,iBlogcategoryService.count(), "成功", list);
    }
    @PostMapping("add")
    public  Result add(@RequestBody Blogcategory blogcategory){
        try {

            System.out.println(blogcategory+"blog");
            if(blogcategory.getTitle()== null || blogcategory.getTitle().equals("")){
                return Result.success(200, "标题不能为空",null);
            }
            else{
                blogcategory.setCreateAt(LocalDateTime.now());
                blogcategory.setUpdateAt(LocalDateTime.now());

                iBlogcategoryService.save(blogcategory);
            }

            return Result.success(200, "成功", null);
        }
        catch (RuntimeException e){
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
    }
    //修改
    @PostMapping("/update")
    public Result update(@RequestBody Blogcategory blogcategory) {
        try {
            if (blogcategory.getTitle() == null || blogcategory.getTitle().equals("")) {
                return Result.success(200, "标题不能为空", null);
            }
            iBlogcategoryService.update(blogcategory, new QueryWrapper<Blogcategory>().eq("id", blogcategory.getId()));
            return Result.success(200, "成功", null);
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
    }
    //删除
    @GetMapping("/delete")
    public Result delete(@RequestParam Long id){
     try{
         Blogcategory category = iBlogcategoryService.getById(id);
         if(category == null){
             return Result.success(200, "删除失败", null);
         }
         iBlogcategoryService.removeById(id);
         return Result.success(200, "成功", null);
     }
     catch (RuntimeException e){
         e.printStackTrace();
         return Result.fail(500, e.getMessage());
     }
    }
    //列表
    @PostMapping("/listPage")
    public Result list(@RequestBody HashMap query) {

        try {
            //分页查询
            Page<Blogcategory> page = new Page<>( (Integer) query.get("pageNum"), (Integer) query.get("pageSize"));
            LambdaQueryWrapper<Blogcategory> queryWrapper = new LambdaQueryWrapper();
            queryWrapper.like(query.get("search") != null, Blogcategory::getTitle, query.get("search").toString());
            queryWrapper.orderByAsc(Blogcategory::getSort); // 添加排序规则
            IPage result = iBlogcategoryService.page(page, queryWrapper);
            return Result.success(200, result.getTotal(), "成功", result.getRecords());
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
    }

}
