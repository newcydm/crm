package com.cydm.crm.transaction.web.controller;


import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.settings.service.DicValueService;
import com.cydm.crm.transaction.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/workbench/transaction")
public class TranRemarkController {
    @Autowired
    private TranService tranService;
    @Autowired
    private DicValueService dicValueService;

    @RequestMapping("/detail")
    public String detailIndex(Model model,String id){
        model.addAttribute("tran",tranService.queryById(id));
        return "workbench/transaction/detail";
    }

    @RequestMapping("/api/queryDicValueByType")
    public @ResponseBody ResponseResult queryDicValueByType(){

        return new ResponseResult(Constants.STATUS_OK,"操作成功",dicValueService.queryByType("stage"));
    }



}
