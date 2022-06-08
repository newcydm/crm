package com.cydm.crm.web;

import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.settings.model.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 */
public class SecurityInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //查看用户是否有登录
        User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
        if(user==null) {
            //重定向登录界面
            response.sendRedirect(request.getContextPath()+"/");
            return false;
        }
        return true;
    }
}
