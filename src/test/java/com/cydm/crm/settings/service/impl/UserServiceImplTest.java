package com.cydm.crm.settings.service.impl;

import com.cydm.crm.settings.model.User;
import com.cydm.crm.settings.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceImplTest {
    @Autowired
    private UserService userService;
    @Test
    public void queryByLoginActAndByLoginPwd() {
        System.out.println(userService.queryByLoginActAndByLoginPwd("","123456"));
    }

    @Test
    public void selectAll() {
        for (User user : userService.selectAll()) {
            System.out.println(user);
        }
    }
}