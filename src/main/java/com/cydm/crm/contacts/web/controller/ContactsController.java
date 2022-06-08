package com.cydm.crm.contacts.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/workbench/contacts")
public class ContactsController {
    @RequestMapping("/index")
    public String contactsIndex(){
        return "/workbench/contacts/index";
    }
}
