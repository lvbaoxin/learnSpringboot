package com.project.service.impl;

import com.project.entity.Blog;
import com.project.mapper.BlogMapper;
import com.project.service.IBlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-17
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {
    @Autowired
    private BlogMapper blogMapper;

  //  @Override
  //  public List<Blog> listBlogs() {
     //   return blogMapper.listBlogsWithCategory();
   // }

}
