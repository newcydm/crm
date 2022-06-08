package com.cydm.crm.activity.mapper;

import com.cydm.crm.activity.model.ActivityRemark;

import java.util.List;

public interface ActivityRemarkMapper {
    int deleteByPrimaryKey(String id);

    int insert(ActivityRemark record);

    int insertSelective(ActivityRemark record);

    ActivityRemark selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ActivityRemark record);

    int updateByPrimaryKey(ActivityRemark record);
    List<ActivityRemark> selectById(String id);

    ActivityRemark selectByYId(String id);

}