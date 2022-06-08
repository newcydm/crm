package com.cydm.crm.activity.mapper;

import com.cydm.crm.activity.model.Activity;
import com.cydm.crm.commons.model.VoActivityChart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ActivityMapper {
    int deleteByPrimaryKey(String id);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);

    List<Activity> selectAll(@Param("name") String name,
                             @Param("owner") String owner,
                             @Param("startDate") String startDate,
                             @Param("endDate") String endDate,
                             @Param("page")Integer page,
                             @Param("pages")Integer pages);
    int selectSize(@Param("name") String name,
                   @Param("owner") String owner,
                   @Param("startDate") String startDate,
                   @Param("endDate") String endDate);
    Activity selectById(String id);

    void deleteBatch(String[] ids);

    List<Activity> selectByIds(String[] ids);

    void insertBatch(List<Activity> list);
    List<Activity> selectByClueId(String id);

    List<VoActivityChart> selectChart();
}