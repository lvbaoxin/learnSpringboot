package com.project.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.project.entity.Nav;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NavMapper extends BaseMapper<Nav> {
    @Select("select * from nav where type_id = #{id}")
    List<Nav> getNavByType(Integer id);
}
