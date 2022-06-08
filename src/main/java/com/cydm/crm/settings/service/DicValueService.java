package com.cydm.crm.settings.service;

import com.cydm.crm.settings.model.DicValue;

import java.util.List;

public interface DicValueService {
    List<DicValue> queryByType(String typeCode);

    List<DicValue> queryAll();
}
