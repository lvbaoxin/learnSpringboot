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

    public static Result fail(){
        return result(400,0L,"失败",null);
    }
    public static Result success(int code, Long total, String msg, Object data){
        return result(200,total,"成功",data);
    }

    private static Result result(int code, Long total, String msg, Object data) {
      Result result = new Result();
      result.setCode(code);
      result.setTotal(total);
      result.setMsg(msg);
      result.setData(data);
      return result;
    }


}
