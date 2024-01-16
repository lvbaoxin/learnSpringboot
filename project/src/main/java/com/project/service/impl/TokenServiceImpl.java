package com.project.service.impl;

import com.project.entity.Token;
import com.project.mapper.TokenMapper;
import com.project.service.ITokenService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-16
 */
@Service
public class TokenServiceImpl extends ServiceImpl<TokenMapper, Token> implements ITokenService {

}
