package com.cydm.crm.activity.service;

import com.cydm.crm.activity.model.Activity;
import com.cydm.crm.commons.model.VoActivityChart;

import java.util.List;

public interface ActivityService {
    List<Activity> queryAll(String name,String owner, String startDate,String endDate,Integer page,Integer pages);
    int querySize(String name,String owner,String startDate,String endDate);
    Activity queryById(String id);
    int ActivityAdd(Activity activity);


    void deleteBatch(String[] ids);

    void update(Activity activity);

    List<Activity> queryByIds(String... ids);

    void AddBatch(List<Activity> list);

    List<Activity> queryByClueId(String id);

    List<VoActivityChart> queryChart();
}
