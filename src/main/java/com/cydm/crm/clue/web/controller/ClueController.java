package com.cydm.crm.clue.web.controller;

import com.cydm.crm.clue.model.Clue;
import com.cydm.crm.clue.service.ClueService;
import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.commons.utils.DateUtil;
import com.cydm.crm.commons.utils.UUIDUtil;
import com.cydm.crm.settings.model.User;
import com.cydm.crm.settings.service.DicValueService;
import com.cydm.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/workbench/clue")
public class ClueController {
    @Autowired
    private UserService userService;
    @Autowired
    private DicValueService dicValueService;
    @Autowired
    private ClueService clueService;

    @RequestMapping("/index")
    public String clueIndex(Model model){
        model.addAttribute("users",userService.selectAll());
        model.addAttribute("appellation",dicValueService.queryByType("appellation"));
        model.addAttribute("clueState",dicValueService.queryByType("clueState"));
        model.addAttribute("source",dicValueService.queryByType("source"));
        return "/workbench/clue/index";
    }

    @RequestMapping(value = "/api/clueAdd",method = RequestMethod.POST)
    public @ResponseBody ResponseResult clueAdd(Clue clue, HttpSession session){
        try {
            User attribute = (User) session.getAttribute(Constants.SESSION_USER);
            clue.setId(UUIDUtil.getUUID());
            clue.setCreateBy(attribute.getId());
            clue.setCreateTime(DateUtil.formatDateTime(new Date()));
            return new ResponseResult(Constants.STATUS_OK, "操作成功", clueService.insertSelective(clue));
        }catch (Exception e){
            return new ResponseResult(Constants.STATUS_ERROR ,"操作失败", null);
        }
    }
    @RequestMapping(value = "/api/clueList",method = RequestMethod.GET)
    public @ResponseBody ResponseResult clueList(Integer page,Integer pages,String fullName,String company,
                                                 String phone,String source,String owner,String mphone,String state){
        Map map=new HashMap();
        map.put("clues",clueService.queryAll(fullName,company,phone,source,owner,mphone,state,page,pages));
        Integer size=clueService.selectPage(fullName,company,phone,source,owner,mphone,state);

        //总页数
        Integer pageNumber=size%pages==0?size/pages:size/pages+1;
        //总行数（总数据）
        map.put("size",size);
        map.put("pageNumber",pageNumber);
        return new ResponseResult(Constants.STATUS_OK,"操作成功",map);
    }

    @RequestMapping("/api/deleteBatch")
    public @ResponseBody ResponseResult deleteBatch(String[] ids){
        clueService.deleteBatch(ids);
        return new ResponseResult();
    }

    @RequestMapping("/api/clueEcho")
    public @ResponseBody ResponseResult clueEcho(String id){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",clueService.selectById(id));
    }

    @RequestMapping("/api/updateClue")
    public @ResponseBody ResponseResult updateClue(Clue clue,HttpSession session){
        User attribute = (User) session.getAttribute(Constants.SESSION_USER);
        clue.setEditBy(attribute.getId());
        clue.setEditTime(DateUtil.formatDateTime(new Date()));
        try {
            clueService.update(clue);
            return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
        }catch (Exception e) {
            return new ResponseResult();
        }
    }



}
