package com.project.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.Result;
import com.project.entity.Blog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.project.entity.Nav;
import com.project.service.IBlogService;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-17
 */
@Mapper
public interface BlogMapper extends BaseMapper<Blog> {




  //  List<Blog> listBlogsWithCategory();
}
