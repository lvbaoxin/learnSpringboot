package com.project.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

@Data
public class Role {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    @TableField("roleName")
    private String roleName;
    @TableField("roleSign")
    private String roleSign;
    @TableField("description")
    private String description;
    private Integer sort;
    private Integer status;
    @TableField("createTime")
    private Date createTime;
}
