package com.project.common;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ProjectExceptionAdvice {
    @ExceptionHandler
    public  Result doException(Exception ex){


       return   Result.fail(500,"服务器错误，请联系管理员。");
    }
}
