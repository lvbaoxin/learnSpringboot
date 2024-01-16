package com.project.common;

import lombok.Data;

@Data
public class Result {
    public  static final int SUCCESS = 200;//成功
    public static  final int ERROR = 500;//失败

    private int code;
    private Long total;
    private String message;
    private Object data;

    public static Result fail( int code, String message){
        return result(code,message);
    }
    public static Result success(int code,  String message, Object data){
        return result(code,message,data);
    }
    public static Result success(int code, Long total, String message, Object data){
        return result(code,total,message,data);
    }

    private static Result result(int code, Long total, String message, Object data) {
      Result result = new Result();
      result.setCode(code);
      result.setTotal(total);
      result.setMessage(message);
      result.setData(data);
      return result;
    }

    private static Result result(int code, String message, Object data) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        result.setData(data);
        return result;
    }
    private static Result result(int code, String message) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }



}
