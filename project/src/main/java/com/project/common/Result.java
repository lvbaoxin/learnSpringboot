package com.project.common;

import lombok.Data;

@Data
public class Result {
    public  static final int SUCCESS = 200;//成功
    public static  final int ERROR = 500;//失败

    private int code;
    private Long total;
    private String msg;
    private Object data;

    public static Result fail( int code, String msg){
        return result(code,msg);
    }
    public static Result success(int code, Long total, String msg, Object data){
        return result(200,total,"成功",data);
    }
    public static Result success(int code,  String msg, Object data){
        return result(200,"成功",data);
    }
    private static Result result(int code, Long total, String msg, Object data) {
      Result result = new Result();
      result.setCode(code);
      result.setTotal(total);
      result.setMsg(msg);
      result.setData(data);
      return result;
    }

    private static Result result(int code, String msg, Object data) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }
    private static Result result(int code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }



}
