package com.project.entity;

    import com.baomidou.mybatisplus.annotation.IdType;
    import com.baomidou.mybatisplus.annotation.TableField;
    import com.baomidou.mybatisplus.annotation.TableId;
    import com.baomidou.mybatisplus.annotation.TableName;
    import java.io.Serializable;
    import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
    import lombok.Data;

/**
* <p>
    * 
    * </p>
* @author Lyubaoxin
* @since 2024-01-16
*/
    @TableName("token")
    @Data()
    public class Token implements Serializable {

    //private static final long serialVersionUID = 1L;
            @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    @TableField(value = "user_id")
    private Integer userId;

    private String token;

    private LocalDateTime createdTime;

    private LocalDateTime indateTime;

        public Integer getId() {
        return id;
        }
            public void setId(Integer id) {

        this.id = id;
        }
        public Integer getUserId() {
        return userId;
        }
            public void setUserId(Integer userId) {

        this.userId = userId;
        }
        public String getToken() {
        return token;
        }
            public void setToken(String token) {

        this.token = token;
        }
        public LocalDateTime getCreatedTime() {
        return createdTime;
        }
            public void setCreatedTime(LocalDateTime createdTime) {

        this.createdTime = createdTime;
        }
        public LocalDateTime getIndateTime() {
        return indateTime;
        }
            public void setIndateTime(LocalDateTime indateTime) {

        this.indateTime = indateTime;
        }
    @Override
    public String toString() {
    return "Token{" +
         "id=" + id +
                 ", userId=" + userId +
         ", token=" + token +
         ", createdTime=" + createdTime +
         ", indateTime=" + indateTime +
    " } ";
    }
}
