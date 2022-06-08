package com.cydm.crm.transaction.mapper;

import com.cydm.crm.transaction.model.TranHistory;

public interface TranHistoryMapper {
    int deleteByPrimaryKey(String id);

    int insert(TranHistory record);

    int insertSelective(TranHistory record);

    TranHistory selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TranHistory record);

    int updateByPrimaryKey(TranHistory record);
}