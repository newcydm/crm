package com.cydm.crm.settings.mapper;

import com.cydm.crm.settings.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByLoginActAndByLoginPwd(@Param("loginAct") String loginAct,
                                       @Param("loginPwd") String loginPwd);
    List<User> selectAll();
}