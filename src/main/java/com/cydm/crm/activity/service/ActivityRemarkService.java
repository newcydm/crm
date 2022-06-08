package com.cydm.crm.activity.service;

import com.cydm.crm.activity.model.ActivityRemark;

import java.util.List;

public interface ActivityRemarkService {
    List<ActivityRemark> queryById(String id);

    void add(ActivityRemark remark);

    Object deleteById(String id);

    Object queryByYId(String id);

    void update(ActivityRemark remark);
}
