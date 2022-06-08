package com.cydm.crm.clue.mapper;

import com.cydm.crm.clue.model.ClueRemark;

import java.util.List;

public interface ClueRemarkMapper {

    int insertSelective(ClueRemark record);

    int updateByPrimaryKeySelective(ClueRemark record);
    List<ClueRemark> selectById(String id);

    void deleteBatchByClueId(String id);
}