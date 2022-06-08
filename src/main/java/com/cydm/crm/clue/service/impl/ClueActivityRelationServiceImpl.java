package com.cydm.crm.clue.service.impl;

import com.cydm.crm.clue.mapper.ClueActivityRelationMapper;
import com.cydm.crm.clue.service.ClueActivityRelationService;
import com.cydm.crm.commons.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(timeout = 60)
public class ClueActivityRelationServiceImpl implements ClueActivityRelationService {
    @Autowired
    private ClueActivityRelationMapper clueActivityRelationMapper;

    public void insertBatch(String[] activityId, String clueId) {
        for (String s : activityId) {
            clueActivityRelationMapper.insertBatch(s, UUIDUtil.getUUID(),clueId);
        }
    }


    public void deleteById(String id) {
        clueActivityRelationMapper.deleteById(id);
    }
}
