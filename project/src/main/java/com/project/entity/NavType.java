package com.project.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data()
public class NavType {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String title;
}
