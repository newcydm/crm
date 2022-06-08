package com.cydm.crm.settings.web.controller;

import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.commons.utils.DateUtil;
import com.cydm.crm.settings.model.User;
import com.cydm.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/settings/qx/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public String login(){
        return "settings/qx/user/login";
    }
    @RequestMapping("/notLogin")
    public @ResponseBody ResponseResult notLogin(HttpServletRequest req){
        String loginAct=null;
        String loginPwd=null;
        for (Cookie cookie : req.getCookies()) {
            if(cookie.getName().equals("loginAct")){
                loginAct=cookie.getValue();
            }
            if(cookie.getName().equals("loginPwd")){
                loginPwd=cookie.getValue();
            }
        }
        User user = userService.queryByLoginActAndByLoginPwd(loginAct, loginPwd);
        if(user!=null){
            return  new ResponseResult(Constants.STATUS_OK,"自动登录",user);
        }
        return new ResponseResult(Constants.STATUS_ERROR,"执行失败",null);
    }

    @RequestMapping("/updateUser")
    public @ResponseBody ResponseResult updateUser(){
        return new ResponseResult();
    }

    @RequestMapping("/doLogin")
    public @ResponseBody ResponseResult doLogin(String loginAct, String loginPwd, boolean notLogin, HttpServletRequest req, HttpServletResponse resp){

        User user = userService.queryByLoginActAndByLoginPwd(loginAct, loginPwd);
        if(user==null)
            return new ResponseResult(Constants.STATUS_LOGINERROR,"账号或密码错误",null);

        if(user.getLockState().equals("0"))
            return new ResponseResult(Constants.STATUS_LOCKED,"用户状态被锁定",null);

        String newDate= DateUtil.formatDateTime(new Date());
        if(user.getExpireTime().compareTo(newDate)<0)
            return new ResponseResult(Constants.STATUS_EXPIRED,"账号已过期",null);


        if(!user.getAllowIps().contains(req.getRemoteAddr()))
            return new ResponseResult(Constants.STATUS_IP,"IP受限",null);


        if(notLogin){
            Cookie cookAct=new Cookie("loginAct",loginAct);
            cookAct.setMaxAge(10*24*60*60);
            Cookie cookPwd=new Cookie("loginPwd",loginPwd);
            cookPwd.setMaxAge(10*24*60*60);
            resp.addCookie(cookAct);
            resp.addCookie(cookPwd);
        }
        req.getSession().setAttribute(Constants.SESSION_USER,user);
        return new ResponseResult(Constants.STATUS_OK,"登录成功",user);
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session,HttpServletResponse resp){
        //清除用户session和cookie
        session.invalidate();
        Cookie loginAct=new Cookie("loginAct","");
        Cookie loginPwd=new Cookie("loginPwd","");
        loginAct.setMaxAge(0);
        loginPwd.setMaxAge(0);
        resp.addCookie(loginAct);
        resp.addCookie(loginPwd);
        return "redirect:/";
    }

    @RequestMapping("/updatePwd")
    public @ResponseBody ResponseResult updatePwd(String ypassword,String password,HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        if(!user.getLoginPwd().equals(ypassword)){
            return new ResponseResult();
        }
        user.setLoginPwd(password);
        userService.update(user);

        return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
    }
}
