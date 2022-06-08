package com.cydm.crm.poi;

import com.cydm.crm.activity.model.Activity;
import com.cydm.crm.activity.service.ActivityService;
import com.cydm.crm.commons.utils.DateUtil;
import com.cydm.crm.commons.utils.UUIDUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class Test{
    @Autowired
    private ActivityService activityService;
    @org.junit.Test
    public void test() throws IOException {
        InputStream is = new FileInputStream("C:\\Users\\He'l'loW\\Downloads\\1653294197029.xls");
        HSSFWorkbook workbook = new HSSFWorkbook(is);
        //拿出工作单
        HSSFSheet sheetAt = workbook.getSheetAt(0);

        for (int i = 0; i < sheetAt.getLastRowNum(); i++) {
            HSSFRow row = sheetAt.getRow(i+1);
            Activity a = new Activity();
            a.setId(UUIDUtil.getUUID());
            a.setCreateTime(DateUtil.formatDateTime(new Date()));
            a.setOwner(row.getCell(0).getStringCellValue());
            a.setName(row.getCell(1).getStringCellValue());
            a.setStartDate(row.getCell(2).getStringCellValue());
            a.setEndDate(row.getCell(3).getStringCellValue());
            a.setCost(row.getCell(4).getStringCellValue() + "");
            a.setDescription(row.getCell(7).getStringCellValue());
            System.out.println(a);
        }

    }

}
