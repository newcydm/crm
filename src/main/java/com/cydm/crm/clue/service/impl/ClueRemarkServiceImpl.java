package com.cydm.crm.clue.service.impl;

import com.cydm.crm.clue.mapper.ClueRemarkMapper;
import com.cydm.crm.clue.model.ClueRemark;
import com.cydm.crm.clue.service.ClueRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class ClueRemarkServiceImpl implements ClueRemarkService {
    @Autowired
    private ClueRemarkMapper clueRemarkMapper;
    @Transactional(timeout = 60,readOnly = true)
    public List<ClueRemark> queryById(String id) {
        return clueRemarkMapper.selectById(id);
    }

    @Override
    public void Add(ClueRemark remark) {
        clueRemarkMapper.insertSelective(remark);
    }
}
