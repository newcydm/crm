package com.cydm.crm.activity.service.impl;

import com.cydm.crm.activity.model.Activity;
import com.cydm.crm.activity.service.ActivityService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ActivityServiceImplTest {
    @Autowired
    private ActivityService activityService;
    @Test
    public void queryAll() {
        for (Activity activity : activityService.queryAll("百度", null, null, null, null, null)) {
            System.out.println(activity);
        }
    }


    @Test
    public void selectSize() {

    }

    @Test
    public void queryByIds() {
        for (Activity queryById : activityService.queryByIds("06f5fc056eac41558a964f96daa7f27b", "06f5fc056eac41558a964f96daa7f27c")) {
            System.out.println(queryById);
        }
    }
}