package com.cydm.crm.settings.mapper;

import com.cydm.crm.settings.model.DicValue;

import java.util.List;

public interface DicValueMapper {

    List<DicValue> selectByType(String typeCode);

    List<DicValue> selectAll();
}