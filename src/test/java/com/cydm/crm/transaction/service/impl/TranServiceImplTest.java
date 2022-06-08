package com.cydm.crm.transaction.service.impl;

import com.cydm.crm.transaction.model.Tran;
import com.cydm.crm.transaction.service.TranService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TranServiceImplTest {
    @Autowired
    private TranService tranService;
    @Test
    public void queryPage() {
        for (Tran tran : tranService.queryPage(null, null)) {
            System.out.println(tran);
        }
    }
}