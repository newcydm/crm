package com.cydm.crm.customer.service.impl;

import com.cydm.crm.customer.model.Customer;
import com.cydm.crm.customer.service.CustomerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class CustomerServiceImplTest {
    @Autowired
    private CustomerService customerService;
    @Test
    public void queryByName() {
        for (Customer 广 : customerService.queryByName("广")) {
            System.out.println(广);
        }
    }
}