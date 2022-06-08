package com.cydm.crm.transaction.mapper;

import com.cydm.crm.transaction.model.Tran;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TranMapper {

    int insertSelective(Tran record);

    int updateByPrimaryKeySelective(Tran record);

    List<Tran> selectPage(@Param("page") Integer page,
                          @Param("pages") Integer pages);

    Object selectById(String id);
}