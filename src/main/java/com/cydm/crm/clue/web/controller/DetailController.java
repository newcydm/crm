package com.cydm.crm.clue.web.controller;

import com.cydm.crm.activity.service.ActivityService;
import com.cydm.crm.clue.model.ClueRemark;
import com.cydm.crm.clue.service.ClueActivityRelationService;
import com.cydm.crm.clue.service.ClueRemarkService;
import com.cydm.crm.clue.service.ClueService;
import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.commons.utils.DateUtil;
import com.cydm.crm.commons.utils.UUIDUtil;
import com.cydm.crm.settings.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/workbench/clue")
public class DetailController {
    @Autowired
    private ClueService clueService;

    @Autowired
    private ClueRemarkService remarkService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ClueActivityRelationService clueActivityRelationService;

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String dectailIndex(String id, Model model){
        model.addAttribute("clue",clueService.queryByIdQ(id));
        return "workbench/clue/detail";
    }
    @RequestMapping("/remarkList")
    public @ResponseBody ResponseResult remarkList(String clueId){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",remarkService.queryById(clueId));
    }
    @RequestMapping("/select/activityList")
    public @ResponseBody ResponseResult ActivityList(String name){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",activityService.queryAll(name,null,null,null,null,null));

    }
    @RequestMapping(value = "/api/activity_clue",method = RequestMethod.POST)
    public @ResponseBody ResponseResult activityClue(String[] activityIds,String clueId){
        clueActivityRelationService.insertBatch(activityIds,clueId);
        return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
    }

    @RequestMapping(value = "/api/clueRemarkAdd",method = RequestMethod.POST)
    public @ResponseBody ResponseResult clueRemarkAdd(ClueRemark remark, HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        remark.setId(UUIDUtil.getUUID());
        remark.setCreateBy(user.getId());
        remark.setCreateTime(DateUtil.formatDateTime(new Date()));
        remarkService.Add(remark);
        return new ResponseResult();
    }


    @RequestMapping("/activityList")
    public @ResponseBody ResponseResult activityList(String id){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",activityService.queryByClueId(id));
    }
    @RequestMapping("/api/deleteclueActivityId")
    public @ResponseBody ResponseResult deleteclueActivityId(String id){
        clueActivityRelationService.deleteById(id);
        return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
    }



}
