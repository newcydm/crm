package com.cydm.crm.activity.web.controller;

import com.cydm.crm.activity.model.Activity;
import com.cydm.crm.activity.model.ActivityRemark;
import com.cydm.crm.activity.service.ActivityRemarkService;
import com.cydm.crm.activity.service.ActivityService;
import com.cydm.crm.commons.model.Constants;
import com.cydm.crm.commons.model.ResponseResult;
import com.cydm.crm.commons.utils.DateUtil;
import com.cydm.crm.commons.utils.UUIDUtil;
import com.cydm.crm.settings.model.User;
import com.cydm.crm.settings.service.UserService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.*;

@Controller
@RequestMapping("/workbench/activity")
public class ActivityController {
    @Autowired
    private ActivityService activityService;
    @Autowired
    private UserService userService;
    @Autowired
    private ActivityRemarkService activityRemarkService;

    @RequestMapping("/index")
    public String ActivityIndex(Model model){
        model.addAttribute("users",userService.selectAll());
        return "/workbench/activity/index";
    }

    @RequestMapping("/detail")
    public String ActivityDetail(){
        return "/workbench/activity/detail";
    }

    @RequestMapping("/api/detailQuery")
    public @ResponseBody ResponseResult detailQuery(String id){
        Map<String,Object> map=new HashMap<>();
        map.put("activity",activityService.queryById(id));
        map.put("remark",activityRemarkService.queryById(id));
        return new ResponseResult(Constants.STATUS_OK,"操作成功",map);
    }

    @RequestMapping("/api/remarkAdd")
    public @ResponseBody ResponseResult delete(ActivityRemark remark,HttpSession session){
        User user = (User) session.getAttribute("user");
        remark.setCreateBy(user.getId());
        remark.setCreateTime(DateUtil.formatDateTime(new Date()));
        remark.setEditFlag("0");
        remark.setId(UUIDUtil.getUUID());
        activityRemarkService.add(remark);
        return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
    }


    @RequestMapping("/activity-list")
    public @ResponseBody ResponseResult ActivityList(String name,String owner,
                                                     String startDate,String endDate,
                                                     Integer page,Integer pages
                                                     ){
        Map<String,Object> map=new HashMap<>();
        int size=activityService.querySize(name,owner,startDate,endDate);
        map.put("activitys",activityService.queryAll(name,owner,startDate,endDate,page,pages));
        map.put("size",size);
        map.put("pageSize",size%pages==0?size/pages:size/pages+1);
        return new ResponseResult(Constants.STATUS_OK,"操作成功",map);
    }

    @RequestMapping(value = "/api/activityAdd",method = RequestMethod.POST)
    public @ResponseBody ResponseResult ActivityAdd(Activity activity, HttpSession session){
        activity.setCreateTime(DateUtil.formatDateTime(new Date()));
        User user = (User) session.getAttribute("user");
        activity.setCreateBy(user.getId());
        activity.setId(UUIDUtil.getUUID());
        try {
            return new ResponseResult(Constants.STATUS_OK, "操作成功", activityService.ActivityAdd(activity));
        }catch (Exception e){
            return new ResponseResult(Constants.STATUS_ERROR,"操作失败",null);
        }
    }

    @RequestMapping("/api/activityDelete")
    public @ResponseBody ResponseResult activityDelete(String[] ids){
        try {
            activityService.deleteBatch(ids);
            return new ResponseResult(Constants.STATUS_OK,"删除成功",null);
        }catch (Exception e){
            return new ResponseResult(Constants.STATUS_ERROR,"删除失败",null);
        }
    }

    @RequestMapping("/api/activityEcho")
    public @ResponseBody ResponseResult activityEcho(String id){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",activityService.queryById(id));
    }

    @RequestMapping("/api/activityUpdate")
    public @ResponseBody ResponseResult activityUpdate(Activity activity,HttpSession session){
        try{
            User user = (User) session.getAttribute("user");
            activity.setEditBy(user.getId());
            activity.setEditTime(DateUtil.formatDateTime(new Date()));
            activityService.update(activity);
            return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
        }catch (Exception e){
            return new ResponseResult(Constants.STATUS_ERROR,"操作失败",null);
        }
    }

    @RequestMapping(value = "/api/deleteDetail",method = RequestMethod.POST)
    public @ResponseBody ResponseResult deleteDetail(String id){
           return new ResponseResult(Constants.STATUS_OK,"删除成功",activityRemarkService.deleteById(id));
    }

    @RequestMapping(value = "/api/echoDetail",method = RequestMethod.POST)
    public @ResponseBody ResponseResult echoDetail(String id){
        return new ResponseResult(Constants.STATUS_OK,"操作成功",activityRemarkService.queryByYId(id));
    }
    @RequestMapping(value="/api/updateDetail",method = RequestMethod.POST)
    public @ResponseBody ResponseResult updateDetail(ActivityRemark remark,HttpSession session){
        User user = (User) session.getAttribute("user");
        remark.setEditBy(user.getId());
        remark.setEditTime(DateUtil.formatDateTime(new Date()));
        activityRemarkService.update(remark);
        return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
    }
    @RequestMapping("/api/exportActivityBatch")
    public void exportActivityBatch(String[] ids, HttpServletResponse resp) throws IOException {
        //指定响应头作为附件下载
        resp.setHeader("content-type","application/octet-stream");
        //指定文件名
        String filename=System.currentTimeMillis()+".xls";
        resp.setHeader("content-disposition", "attachment; filename="+ URLEncoder.encode(filename, "UTF-8"));

        //创建ex文件
        HSSFWorkbook workbook=new HSSFWorkbook();
        //创建工作单
        HSSFSheet sheet = workbook.createSheet("activity");
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER);

        sheet.setColumnWidth(0,256*5);
        sheet.setColumnWidth(1,256*8);
        sheet.setColumnWidth(2,256*15);
        sheet.setColumnWidth(3,256*15);
        sheet.setColumnWidth(4,256*5);
        sheet.setColumnWidth(5,256*5);
        sheet.setColumnWidth(6,256*5);
        sheet.setColumnWidth(7,256*38);
        //创建首行
        HSSFRow row = sheet.createRow(0);
        //首行第0个单元格
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("所有者");
        cell = row.createCell(1);
        cell.setCellValue("名称");
        cell = row.createCell(2);
        cell.setCellValue("开始日期");
        cell = row.createCell(3);
        cell.setCellValue("结束日期");
        cell = row.createCell(4);
        cell.setCellValue("成本");
        cell = row.createCell(5);
        cell.setCellValue("创建者");
        cell = row.createCell(6);
        cell.setCellValue("修改者");
        cell = row.createCell(7);
        cell.setCellValue("描述");


        List<Activity> activities = null;
        if(ids==null || ids.length==0){
            activities=activityService.queryAll(null, null, null, null, null, null);
        }else{
            activities=activityService.queryByIds(ids);
        }
        for(int i=0;i<activities.size();i++){
            Activity activity = activities.get(i);
            HSSFRow row1 = sheet.createRow(i + 1);
            HSSFCell cell1 = row1.createCell(0);
            cell1.setCellValue(activity.getOwner());

            cell1 = row1.createCell(1);
            cell1.setCellValue(activity.getName());

            cell1 = row1.createCell(2);
            cell1.setCellValue(activity.getStartDate());
            cell1 = row1.createCell(3);
            cell1.setCellValue(activity.getEndDate());
            cell1 = row1.createCell(4);
            cell1.setCellValue(activity.getCost());
            cell1 = row1.createCell(5);
            cell1.setCellValue(activity.getCreateBy());
            cell1 = row1.createCell(6);
            cell1.setCellValue(activity.getEditBy());
            cell1 = row1.createCell(7);
            cell1.setCellValue(activity.getDescription());

        }
        ServletOutputStream os = resp.getOutputStream();
        workbook.write(os);
        os.flush();
    }

    @RequestMapping(value = "/api/importActivityExcel",method = RequestMethod.POST)
    public @ResponseBody ResponseResult importActivityExcel(MultipartFile activityFile,HttpServletRequest req) throws IOException {
        User user=(User)req.getSession().getAttribute(Constants.SESSION_USER);
        try {
            InputStream is = activityFile.getInputStream();
            HSSFWorkbook workbook = new HSSFWorkbook(is);
            //拿出工作单
            HSSFSheet sheetAt = workbook.getSheetAt(0);
            List<Activity> list = new ArrayList<>();
            for (int i = 0; i < sheetAt.getLastRowNum(); i++) {
                HSSFRow row = sheetAt.getRow(i+1);

                Activity a = new Activity();
                a.setId(UUIDUtil.getUUID());
                a.setCreateBy(user.getId());
                a.setCreateTime(DateUtil.formatDateTime(new Date()));
                a.setOwner(row.getCell(0).getStringCellValue());
                a.setName(row.getCell(1).getStringCellValue());
                a.setStartDate(row.getCell(2).getStringCellValue());
                a.setEndDate(row.getCell(3).getStringCellValue());
                a.setCost(row.getCell(4).getStringCellValue() + "");
                a.setDescription(row.getCell(7).getStringCellValue());
                list.add(a);
            }
            activityService.AddBatch(list);
            return new ResponseResult(Constants.STATUS_OK,"操作成功",null);
        }catch (Exception e){
            return new ResponseResult(Constants.STATUS_ERROR,"增加失败:"+e.getMessage(),null);
        }

    }
}
