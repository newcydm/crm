package com.cydm.crm.activity.service.impl;

import com.cydm.crm.activity.model.ActivityRemark;
import com.cydm.crm.activity.service.ActivityRemarkService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ActivityRemarkServiceImplTest {
    @Autowired
    private ActivityRemarkService activityRemarkService;
    @Test
    public void queryById() {
        for (ActivityRemark a71dcbfab87111eb947254e1ad709133 : activityRemarkService.queryById("a71dcbfab87111eb947254e1ad709133")) {
            System.out.println(a71dcbfab87111eb947254e1ad709133);
        }
    }
}