package com.project.mapper;

import com.project.entity.Blogcategory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-17
 */
@Mapper
public interface BlogcategoryMapper extends BaseMapper<Blogcategory> {


//    @Select("select * from myweb_blogcategory where id = #{id}")
//    static List<Blogcategory> selectBlogCategories(int id);
}
