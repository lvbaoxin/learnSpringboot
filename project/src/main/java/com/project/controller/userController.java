package com.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.project.common.QueryPageParam;
import com.project.common.Result;
import com.project.entity.User;
import com.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/user")
public class userController {
 @Autowired
 private UserService userService;
 @GetMapping("/list")
 public List<User> list(){
  // return userService.list();
  return userService.listAll();
 }


 //新增
 @GetMapping("/add")
 public boolean add(@RequestBody User user){
   return userService.save(user);
 }
 //修改
 @PostMapping("/modify")
 public boolean modify(@RequestBody User user){
   return userService.updateById(user);
 }
 //新增或修改
 @PostMapping("/saveOrModify")
 public boolean saveOrModify(@RequestBody User user){
  return userService.saveOrUpdate(user);
 }
 //删除
 @GetMapping("/delete")
 public boolean delete(@RequestParam("id") Integer id){
  return userService.removeById(id);
 }
 //模糊查询
 @PostMapping("/listP")
 public List<User> listP(@RequestBody User user){
  LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper();
  queryWrapper.like(User::getName,user.getName());
  return userService.list(queryWrapper);
 }
 //分页查询
  @PostMapping("/listPage")
 public List<User> listPage(@RequestBody QueryPageParam query){

   HashMap param = query.getParam();
   Page<User> page = new Page(query.getPageNum(), query.getPageSize());
   LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper();
   queryWrapper.like(User::getName,param.get("name"));
   IPage result = userService.page(page, queryWrapper);
   System.out.println(result.getTotal() + "total");
   return result.getRecords();
  }
    @PostMapping("/listPage2")
    public Result listPage2(@RequestBody QueryPageParam query){

        HashMap param = query.getParam();
        Page<User> page = new Page(query.getPageNum(), query.getPageSize());
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.like(User::getName,param.get("name"));
        IPage result = userService.page(page, queryWrapper);
        System.out.println(result.getTotal() + "total");
        return Result.success(200,result.getTotal(),"成功",result.getRecords());
    }
}
