package com.cydm.crm.customer.service;

import com.cydm.crm.customer.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> queryByName(String name);
}
