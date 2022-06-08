package com.cydm.crm.activity.web.controller;


import com.cydm.crm.activity.service.ActivityService;
import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/workbench/chart/activity")
public class ChartController {
    @Autowired
    private ActivityService activityService;
    @RequestMapping("/index")
    public String activityChart(){
        return "workbench/chart/activity/index";
    }

    @RequestMapping("/activityData")
    public @ResponseBody ResponseResult activityData(){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",activityService.queryChart());
    }

}
