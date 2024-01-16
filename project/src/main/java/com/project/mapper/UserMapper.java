package com.project.mapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.project.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {

    List<User> listAll();
    @Select("SELECT * FROM user WHERE userName = #{userName}")
    User getUserByName(String userName);

}
