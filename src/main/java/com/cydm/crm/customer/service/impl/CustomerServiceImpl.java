package com.cydm.crm.customer.service.impl;

import com.cydm.crm.customer.mapper.CustomerMapper;
import com.cydm.crm.customer.model.Customer;
import com.cydm.crm.customer.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;

    @Transactional(timeout = 60,readOnly = true)
    public List<Customer> queryByName(String name) {
        return customerMapper.selectByName(name);
    }
}
