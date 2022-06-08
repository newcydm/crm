package com.cydm.crm.transaction.service;

import com.cydm.crm.transaction.model.Tran;

import java.util.List;

public interface TranService {

    List<Tran> queryPage(Integer page, Integer pages);

    void Add(Tran tran);

    Object queryById(String id);
}
