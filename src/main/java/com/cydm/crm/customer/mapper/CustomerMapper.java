package com.cydm.crm.customer.mapper;

import com.cydm.crm.customer.model.Customer;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(String id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    List<Customer> selectByName(String name);
}