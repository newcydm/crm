package com.cydm.crm.activity.service.impl;

import com.cydm.crm.activity.mapper.ActivityMapper;
import com.cydm.crm.activity.model.Activity;
import com.cydm.crm.activity.service.ActivityService;
import com.cydm.crm.commons.model.VoActivityChart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityMapper activityMapper;

    @Transactional(timeout = 60,readOnly = true)
    public List<Activity> queryAll(String name, String owner, String startDate, String endDate,Integer page,Integer pages) {
        return activityMapper.selectAll(name,owner,startDate,endDate,page,pages);
    }

    @Transactional(timeout = 60,readOnly = true)
    public int querySize(String name, String owner, String startDate, String endDate) {
        return activityMapper.selectSize(name,owner,startDate,endDate);
    }

    @Transactional(timeout = 60,readOnly = true)
    public Activity queryById(String id) {
        return activityMapper.selectById(id);
    }

    @Override
    public int ActivityAdd(Activity activity){
        return activityMapper.insert(activity);
    }

    @Override
    public void deleteBatch(String[] ids) {
        activityMapper.deleteBatch(ids);
    }

    @Override
    public void update(Activity activity) {
        activityMapper.updateByPrimaryKeySelective(activity);
    }

    @Transactional(timeout = 60,readOnly = true)
    public List<Activity> queryByIds(String... ids) {
        return activityMapper.selectByIds(ids);
    }

    @Override
    public void AddBatch(List<Activity> list) {
        activityMapper.insertBatch(list);
    }

    @Override
    public List<Activity> queryByClueId(String id) {
        return activityMapper.selectByClueId(id);
    }

    @Transactional(timeout = 60,readOnly = true)
    public List<VoActivityChart> queryChart() {
        return activityMapper.selectChart();
    }
}
