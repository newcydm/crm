package com.cydm.crm.transaction.service.impl;

import com.cydm.crm.transaction.mapper.TranMapper;
import com.cydm.crm.transaction.model.Tran;
import com.cydm.crm.transaction.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class TranServiceImpl implements TranService {
    @Autowired
    private TranMapper tranMapper;
    @Transactional(timeout = 60,readOnly = true)
    public List<Tran> queryPage(Integer page, Integer pages) {
        return tranMapper.selectPage(page,pages);
    }

    @Override
    public void Add(Tran tran) {
        tranMapper.insertSelective(tran);
    }

    @Override
    public Object queryById(String id) {
        return tranMapper.selectById(id);
    }
}
