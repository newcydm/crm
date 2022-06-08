package com.cydm.crm.activity.service.impl;

import com.cydm.crm.activity.mapper.ActivityRemarkMapper;
import com.cydm.crm.activity.model.ActivityRemark;
import com.cydm.crm.activity.service.ActivityRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class ActivityRemarkServiceImpl implements ActivityRemarkService {
    @Autowired
    private ActivityRemarkMapper remarkMapper;
    @Transactional(timeout = 60,readOnly = true)
    public List<ActivityRemark> queryById(String id) {
        return remarkMapper.selectById(id);
    }

    @Override
    public void add(ActivityRemark remark) {
        remarkMapper.insertSelective(remark);
    }

    @Override
    public Object deleteById(String id) {
        return remarkMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Object queryByYId(String id) {
        return remarkMapper.selectByYId(id);
    }

    @Override
    public void update(ActivityRemark remark) {
        remarkMapper.updateByPrimaryKeySelective(remark);
    }
}
