package com.cydm.crm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    //登录首页
    @RequestMapping("/")
    public String index(){
        return "index";
    }
    //工作区首页
    @RequestMapping("/workbench/index")
    public String workbenchIndex(){
        return "workbench/index";
    }

    //工作区首页默认框架子页
    @RequestMapping("/workbench/main/index")
    public String workbenchMainIndex(){
        return "workbench/main/index";
    }
}
