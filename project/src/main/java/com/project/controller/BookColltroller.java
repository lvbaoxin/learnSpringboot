package com.project.controller;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.QueryPageParam;
import com.project.common.Result;
import com.project.entity.Book;
import com.project.entity.User;
import com.project.mapper.BookMapper;
import com.project.service.BookService;
import com.project.service.impl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RestController
public class BookColltroller {
    @Autowired
    private BookService bookService;
    private BookMapper bookMapper;
    @GetMapping("/addBook")
    public Result  addBook(@RequestParam String title,@RequestParam Integer isDelete){
        System.out.println("title:"+title+"isDelete:"+isDelete);
        if(StringUtils.isEmpty(title)){
            throw new RuntimeException("标题不能为空");
        }
        Book book=new Book();
        book.setTitle(title);
        book.setIsDelete(isDelete);
//        if(bookService.findByTitle(title)!=null){
//            throw new RuntimeException("标题已存在");
//        }
        return Result.success(200,"添加成功",bookService.save(book));
    }


    @GetMapping("/books")
    public Result List() throws Exception {
//        if(true) {
//            throw new Exception();
//        }

        return Result.success(200, bookService.count(),"成功",bookService.list());
    }
    @GetMapping("/book/{id}")
    public Result getObj(@PathVariable String id){
        System.out.println(bookService.getById(id));
        return Result.success(200,"成功",bookService.getById(id));
    }
    @PostMapping("/bookListPage")
    public Result listPage(@RequestBody QueryPageParam query){
        HashMap param = query.getParam();
        Page<Book> page = new Page(query.getPageNum(), query.getPageSize());
        LambdaQueryWrapper<Book> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.like(Book::getTitle,param.get("title"));
        IPage result = bookService.page(page, queryWrapper);
        return Result.success(200, result.getTotal(),"成功",result.getRecords());
    }


}
