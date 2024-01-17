package com.project.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author Lyubaoxin
 * @since 2024-01-17
 */
@Getter
@Setter
@TableName("myweb_blog")
public class Blog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String title;

    private String pic;

    private String abstracts;

    private LocalDateTime createAt;

    private LocalDateTime updateAt;

    private Long blogcategoryId;

    private String description;

    private int sort;


}
