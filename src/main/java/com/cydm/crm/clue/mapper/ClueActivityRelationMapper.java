package com.cydm.crm.clue.mapper;

import com.cydm.crm.clue.model.ClueActivityRelation;
import org.apache.ibatis.annotations.Param;

public interface ClueActivityRelationMapper {
    int deleteByPrimaryKey(String id);
    void deleteById(String id);

    int insertBatch(@Param("activityId") String activityId,
                    @Param("uuid")String uuid,
                    @Param("clueId") String clueId);

    int insertSelective(ClueActivityRelation record);

    ClueActivityRelation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ClueActivityRelation record);

    int updateByPrimaryKey(ClueActivityRelation record);
}