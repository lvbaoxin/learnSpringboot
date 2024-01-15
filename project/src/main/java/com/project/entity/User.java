package com.project.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

@Data
public class User {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String no;
     private String name;
    @TableField("userName")
    private String userName;
    private String password;
    private int sex;
    private String avatar;
    private String phone;
    @TableField("isvalid")
    private String isValid;
    @TableField("createdTime")
    private Date createdTime;
}
