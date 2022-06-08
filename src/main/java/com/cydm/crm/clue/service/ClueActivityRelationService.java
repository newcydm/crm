package com.cydm.crm.clue.service;

public interface ClueActivityRelationService {
    void insertBatch(String[] activityId,String clueId);

    void deleteById(String id);
}
