package com.cydm.crm.settings.service.impl;

import com.cydm.crm.settings.mapper.DicValueMapper;
import com.cydm.crm.settings.model.DicValue;
import com.cydm.crm.settings.service.DicValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class DicValueServiceImpl implements DicValueService {
    @Autowired
    private DicValueMapper dicValueMapper;
    @Transactional(timeout = 60,readOnly = true)
    public List<DicValue> queryByType(String typeCode) {
        return dicValueMapper.selectByType(typeCode);
    }

    @Transactional(timeout = 60,readOnly = true)
    public List<DicValue> queryAll() {
        return dicValueMapper.selectAll();
    }
}
