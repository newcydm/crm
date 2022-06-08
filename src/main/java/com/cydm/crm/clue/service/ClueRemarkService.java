package com.cydm.crm.clue.service;

import com.cydm.crm.clue.model.ClueRemark;

import java.util.List;

public interface ClueRemarkService {
    List<ClueRemark> queryById(String id);

    void Add(ClueRemark remark);
}
