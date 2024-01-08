package com.project.controller;

import com.alibaba.druid.util.StringUtils;
import com.project.common.Result;
import com.project.entity.Book;
import com.project.mapper.BookMapper;
import com.project.service.BookService;
import com.project.service.impl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
        return Result.success(200,1L,"添加成功",bookService.save(book));
    }


    @GetMapping("/books")
    public List<Book> List(){
        System.out.println(bookService.list());
        return bookService.list();
        //bookService.list().forEach(System.out::println);
    }
    @GetMapping("/book/{id}")
    public Result getObj(@PathVariable String id){
        System.out.println(bookService.getById(id));
        return Result.success(200,1L,"成功",bookService.getById(id));
    }


}
