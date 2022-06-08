package com.cydm.crm.clue.mapper;

import com.cydm.crm.clue.model.Clue;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClueMapper {
    int deleteByPrimaryKey(String id);

    int insert(Clue record);

    int insertSelective(Clue record);

    Clue selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Clue record);

    int updateByPrimaryKey(Clue record);
    List<Clue> selectAll(@Param("fullName")String fullName,
                         @Param("company")String company,
                         @Param("phone")String phone,
                         @Param("source")String source,
                         @Param("owner")String owner,
                         @Param("mphone")String mphone,
                         @Param("state")String state,
                         @Param("page") Integer page,
                         @Param("pages") Integer pages);
    int selectPage(@Param("fullName")String fullName,
                   @Param("company")String company,
                   @Param("phone")String phone,
                   @Param("source")String source,
                   @Param("owner")String owner,
                   @Param("mphone")String mphone,
                   @Param("state")String state);

    void deleteBatch(String[] ids);

    Clue selectByIdQ(String id);

    Clue selectClue(String id);
}