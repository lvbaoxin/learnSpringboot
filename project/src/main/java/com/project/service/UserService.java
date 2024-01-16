package com.project.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.project.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserService extends IService<User>{
    List<User> listAll();

    User getUserInfo(User user);
}
