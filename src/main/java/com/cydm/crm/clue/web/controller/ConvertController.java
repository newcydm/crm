package com.cydm.crm.clue.web.controller;

import com.cydm.crm.clue.service.ClueService;
import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.commons.utils.DateUtil;
import com.cydm.crm.commons.utils.UUIDUtil;
import com.cydm.crm.settings.model.DicValue;
import com.cydm.crm.settings.model.User;
import com.cydm.crm.settings.service.DicValueService;
import com.cydm.crm.transaction.model.Tran;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@RequestMapping("/workbench/clue")
@Controller
public class ConvertController {
    @Autowired
    private ClueService clueService;
    @Autowired
    private DicValueService dicValueService;


    @RequestMapping("/convert")
    public String convertIndex(Model model,String id){
        model.addAttribute("clue",clueService.queryByIdQ(id));
        model.addAttribute("stages",dicValueService.queryByType("stage"));
        return "workbench/clue/convert";
    }
    @RequestMapping("/transition")
    public @ResponseBody ResponseResult transition(Tran tran, HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        tran.setEditBy(user.getId());
        tran.setEditBy(DateUtil.formatDateTime(new Date()));
        clueService.transition(tran);
        return new ResponseResult();
    }
}
