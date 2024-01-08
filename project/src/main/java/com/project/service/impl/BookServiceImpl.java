package com.project.service.impl;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.project.entity.Book;
import com.project.mapper.BookMapper;
import com.project.service.BookService;
import org.springframework.stereotype.Service;
@Service

public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {
}