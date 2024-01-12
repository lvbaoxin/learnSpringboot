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
    private String roleName;
    private String roleSign;
    private String describe;
    private Integer sort;
    private Integer status;
    @TableField("create_time")
    private Date createdTime;
}
