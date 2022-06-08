package com.cydm.crm.settings.web.controller;

import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.settings.model.DicValue;
import com.cydm.crm.settings.service.DicValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/settings")
public class DictionaryController {
    @Autowired
    private DicValueService dicValueService;
    //系统设置
    @RequestMapping("/index")
    public String index(){
        return "settings/index";
    }
    //设置数据字典表
    @RequestMapping("/dictionary/index")
    public String dictionaryIndex(){
        return "settings/dictionary/index";
    }
    @RequestMapping("/dictionary/type/index")
    public String dictionaryType(){
        return "settings/dictionary/type/index";
    }

    @RequestMapping("/dictionary/value/index")
    public String dictionaryValue(){
        return "settings/dictionary/value/index";
    }

    @RequestMapping("dictionary/value/valueList")
    public @ResponseBody ResponseResult valueList(){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",dicValueService.queryAll());
    }

}
