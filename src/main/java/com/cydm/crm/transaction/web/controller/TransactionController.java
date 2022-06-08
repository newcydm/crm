package com.cydm.crm.transaction.web.controller;

import com.cydm.crm.activity.service.ActivityService;
import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.commons.utils.DateUtil;
import com.cydm.crm.commons.utils.UUIDUtil;
import com.cydm.crm.contacts.service.ContactsService;
import com.cydm.crm.customer.service.CustomerService;
import com.cydm.crm.settings.model.DicValue;
import com.cydm.crm.settings.model.User;
import com.cydm.crm.settings.service.DicValueService;
import com.cydm.crm.settings.service.UserService;
import com.cydm.crm.transaction.model.Tran;
import com.cydm.crm.transaction.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/workbench/transaction")
public class TransactionController {
    @Autowired
    private TranService tranService;

    @Autowired
    private UserService userService;

    @Autowired
    private DicValueService dicValueService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ContactsService contactsService;

    @RequestMapping("/index")
    public String transactionIndex(){
        return "workbench/transaction/index";
    }

    @RequestMapping("/save")
    public String saveEcho(Model model){
        model.addAttribute("users",userService.selectAll());
        model.addAttribute("dicValues",dicValueService.queryByType("stage"));
        model.addAttribute("transactionTypes",dicValueService.queryByType("transactionType"));
        model.addAttribute("sources",dicValueService.queryByType("source"));
        return "workbench/transaction/save";
    }


    @RequestMapping("/select/ByName")
    public @ResponseBody ResponseResult selectByName(String name){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",customerService.queryByName(name));
    }

    @RequestMapping("/select/ActivityList")
    public @ResponseBody ResponseResult ActivityList(String name){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",activityService.queryAll(name,null,null,null,null,null));

    }

    @RequestMapping("/select/ContactsList")
    public @ResponseBody ResponseResult ContactsList(String name){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",contactsService.queryByName(name));
    }
    @RequestMapping("/api/transactionList")
    public @ResponseBody ResponseResult transactionList(Integer page, Integer pages){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",tranService.queryPage(page,pages));
    }

    @RequestMapping("/api/tranAdd")
    public @ResponseBody ResponseResult tranAdd(Tran tran, HttpSession session){
        try {
            User user = (User) session.getAttribute(Constants.SESSION_USER);
            tran.setCreateBy(user.getId());
            tran.setCreateTime(DateUtil.formatDateTime(new Date()));
            tran.setId(UUIDUtil.getUUID());
            tranService.Add(tran);
            return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
        }catch (Exception e){
            return new ResponseResult(Constants.STATUS_ERROR,"操作失败:"+e,null);
        }
    }


}
