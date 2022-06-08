package com.cydm.crm.settings.service.impl;

import com.cydm.crm.settings.model.DicValue;
import com.cydm.crm.settings.service.DicValueService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class DicValueServiceImplTest {
    @Autowired
    private DicValueService dicValueService;
    @Test
    public void queryByType() {
        for (DicValue appellation : dicValueService.queryByType("clueState")) {
            System.out.println(appellation);
        }
    }
}