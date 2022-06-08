package com.cydm.crm.clue.service.impl;

import com.cydm.crm.clue.model.Clue;
import com.cydm.crm.clue.service.ClueService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ClueServiceImplTest {
    @Autowired
    private ClueService clueService;
    @Test
    public void queryAll() {

    }

    @Test
    public void selectPage() {
        System.out.println(clueService.selectPage("马",null,null,null,null,null,null));
    }
}