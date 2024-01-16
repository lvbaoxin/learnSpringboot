package com.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.project.entity.Token;
import com.project.entity.User;
import com.project.mapper.TokenMapper;
import com.project.mapper.UserMapper;
import com.project.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private UserMapper userMapper;
    private TokenMapper tokenMapper;
    @Override
    public List<User> listAll() {
        return userMapper.listAll();
    }

    @Override
    public User getUserInfo(User user) {
        User queriedUser = userMapper.getUserByName(user.getUserName());
        if (queriedUser == null || !queriedUser.getPassword().equals(user.getPassword())) {
            throw new RuntimeException("账号或密码错误");
        }
        // 登录成功后生成一个唯一的token
        String token = UUID.randomUUID().toString();
        // 新增一条token记录到数据库中
        Token tokenObj = new Token();
        tokenObj.setUserId(queriedUser.getId());
        tokenObj.setToken(token);
        System.out.println("生成的token为：" + token);
        System.out.println("tokenObj：" + tokenObj);
//        if(tokenObj.getToken()!=null){
//            tokenMapper.saveToken(tokenObj);
//        }
        return queriedUser;
    }

}
