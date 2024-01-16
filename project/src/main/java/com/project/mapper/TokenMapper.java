package com.project.mapper;

import com.project.entity.Token;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-16
 */
@Mapper
public interface TokenMapper extends BaseMapper<Token> {
    @Insert("INSERT INTO token (token, user_id) VALUES (#{token}, #{userId})")
    Token saveToken(Token token);
}
