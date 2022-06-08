package com.cydm.crm.customer.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("//workbench/customer")
public class CustomerController {
    @RequestMapping("/index")
    public String customerIndex(){
        return "workbench/customer/index";
    }
}
