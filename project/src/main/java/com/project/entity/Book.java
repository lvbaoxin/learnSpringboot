package com.project.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

@Data
public class Book {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String title;
    @TableField("isDelete")
    private Integer isDelete;
    @TableField("create_time")
    private Date createdTime;
}
