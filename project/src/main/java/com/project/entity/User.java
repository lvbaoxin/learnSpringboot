package com.project.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class User {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String no;
     private String name;
    private String password;
    private int sex;
    private int roleId;
    private String phone;
    @TableField("isvalid")
    private String isValid;
}
