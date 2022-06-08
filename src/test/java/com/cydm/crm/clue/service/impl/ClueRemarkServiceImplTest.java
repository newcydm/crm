package com.cydm.crm.clue.service.impl;

import com.cydm.crm.clue.model.ClueRemark;
import com.cydm.crm.clue.service.ClueRemarkService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-beans.xml")
public class ClueRemarkServiceImplTest {
    @Autowired
    private ClueRemarkService clueRemarkService;
    @Test
    public void queryById() {
        for (ClueRemark clueRemark : clueRemarkService.queryById("5ee8db8d080241b2934ac4507865b9d6")) {
            System.out.println(clueRemark);
        }
    }
}