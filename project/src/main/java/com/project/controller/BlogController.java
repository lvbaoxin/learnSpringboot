package com.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.Result;
import com.project.entity.Blog;
import com.project.entity.Blogcategory;
import com.project.entity.Token;
import com.project.entity.User;
import com.project.mapper.BlogMapper;
import com.project.mapper.BlogcategoryMapper;
import com.project.service.IBlogService;
import com.project.service.IBlogcategoryService;
import com.project.utils.RandomUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-17
 */
@Slf4j
@RestController
@Component
@RequestMapping("/blog")
public class BlogController {
    @Autowired
    private IBlogService iBlogService;
    private IBlogcategoryService iBlogcategoryService;
    private BlogMapper blogMapper;
    @Value(value = "${upload.path}")
    private String uploadPath;

    //列表
    @PostMapping("/listPage")
    public Result list(@RequestBody HashMap query) {

        try {

            Page<Blog> page = new Page<>((Integer) query.get("pageNum"), (Integer) query.get("pageSize"));
            LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper();
            queryWrapper.like(query.get("search") != null, Blog::getTitle, query.get("search").toString());
            queryWrapper.orderByAsc(Blog::getSort); // 添加排序规则
            IPage result = iBlogService.page(page, queryWrapper);

            return Result.success(200, result.getTotal(), "成功",result.getRecords());

//            Page<Blog> page = new Page<>((Integer) query.get("pageNum"), (Integer) query.get("pageSize"));
//            LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper();
//            queryWrapper.like(query.get("search") != null, Blog::getTitle, query.get("search").toString());
//            queryWrapper.orderByAsc(Blog::getSort); // 添加排序规则
//            IPage<Blog> result = iBlogService.listBlogs();
             // return Result.success(200, result.getTotal(), "成功",result.getRecords());

         //return Result.success(200, (long) iBlogService.listBlogs().size(), "成功",iBlogService.listBlogs());
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
    }

    //新增
    @PostMapping("/add")
    public Result add(@RequestBody Blog blog) {
        try {
            if (blog.getTitle() == null || blog.getTitle().equals("")) {
                return Result.success(200, "标题不能为空", null);
            } else {
                blog.setCreateAt(LocalDateTime.now());
                blog.setUpdateAt(LocalDateTime.now());
                iBlogService.save(blog);
            }
            return Result.success(200, "成功", null);
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
    }

    @PostMapping("/upload_handle1/")
    public Result upload(MultipartFile file){
        String basePath = "E:/learnJava/learnSpringboot/project/src/main/java/com/project/upload/";
        System.out.println(file.getOriginalFilename()+"file");
        // 当前年份,用于拼接文件上传路径
        Calendar calendar = Calendar.getInstance();
        String year = String.valueOf(calendar.get(Calendar.YEAR));
        // 当前月份,注意加1,用于拼接文件上传路径
        String month = String.valueOf(calendar.get(Calendar.MONTH) + 1);
        String day = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
        String newFileName = year + "_" + month + "_" + day + "_" + RandomUtil.randomNumbers(6) + "_" + file.getOriginalFilename();
        String filePath = basePath + newFileName;
        //创建一个目录对象
        File dir = new File(filePath);
        //判断当前目录是否存在
        if (!dir.exists()) {
            //目录不存在，需要创建
            dir.mkdirs();
        }  //将临时文件转存到指定位置
        try {
            file.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
        return Result.success(200,"上传成功", newFileName);
    }

    /**
     * 上传图片并预览
     */
    @PostMapping(value = "/upload_handle")
    public Result uploadImage(@RequestParam(value = "file") MultipartFile multipartFile) {
        try {
            if (multipartFile.isEmpty()) {

                return Result.fail(500, "文件为空,请重新选择!");
            }

            // 上传的图片全部保存在 "E://upload//avatar//" 目录下
            File file = new File(uploadPath);
            if (!file.exists()) {
                // 创建完整的目录
                file.mkdirs();
            }

            // 获取文件原始名(包含后缀名)
            String orgName = multipartFile.getOriginalFilename();
            // 获取文件名（不包括后缀）
            String prefixName = orgName.substring(0, orgName.lastIndexOf("."));
            // 获取文件后缀名
            String suffixName = orgName.substring(orgName.lastIndexOf("."));
            // 这是处理后的新文件名
            String fileName;

            if(orgName.contains(".")) {
                // 示例：avatar.123.png，经过处理后得到：avatar.123_1661136943533.png
                fileName = prefixName + "_" + System.currentTimeMillis() + suffixName;
            } else {
                // 上传的图片没有后缀（这压根就不算是一个正常的图片吧？）
                return Result.fail(500, "上传图片格式错误,请重新选择！");
            }

            String savePath = file.getPath() + File.separator + fileName;
            File saveFile = new File(savePath);
            // 将上传的文件复制到指定目录
            FileCopyUtils.copy(multipartFile.getBytes(), saveFile);

            // 返回给前端的图片保存路径；前台可以根据返回的路径拼接完整地址，即可在浏览器上预览该图片
            String path = "upload" + File.separator + fileName;
            if (path.contains("\\")) {
                path = path.replace("\\", "/");
            }
            return Result.success(200,"上传成功", path);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }

    }

    //修改
    @PostMapping("/update")
    public Result update(@RequestBody Blog blog) {
        try {
            if (blog.getTitle() == null || blog.getTitle().equals("")) {
                return Result.success(200, "标题不能为空", null);
            }
            blog.setUpdateAt(LocalDateTime.now());
            iBlogService.update(blog, new QueryWrapper<Blog>().eq("id", blog.getId()));

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
            Blog blog = iBlogService.getById(id);
            if(blog == null){
                return Result.success(200, "删除失败", null);
            }
            iBlogService.removeById(id);
            return Result.success(200, "成功", null);
        }
        catch (RuntimeException e){
            e.printStackTrace();
            return Result.fail(500, e.getMessage());
        }
    }







}