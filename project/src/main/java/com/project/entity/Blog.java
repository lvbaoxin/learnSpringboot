package com.project.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashMap;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;

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


    private String description;

    private int sort;
    @TableField("blogCategory_id")
    private Long blogCategoryId;
//    private Blogcategory category;
//
//    public Blogcategory getCategory() {
//        return   @TableField("blogCategory_id")
//        private Long blogCategoryId;category;
//    }
//
//    public void setCategory(Blogcategory category) {
//        this.category = category;
//    }
}
