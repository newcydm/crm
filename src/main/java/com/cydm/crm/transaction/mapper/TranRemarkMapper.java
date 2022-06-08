package com.cydm.crm.transaction.mapper;

import com.cydm.crm.transaction.model.TranRemark;

public interface TranRemarkMapper {
    int deleteByPrimaryKey(String id);

    int insert(TranRemark record);

    int insertSelective(TranRemark record);

    TranRemark selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TranRemark record);

    int updateByPrimaryKey(TranRemark record);

}