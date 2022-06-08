package com.cydm.crm.clue.service;

import com.cydm.crm.clue.model.Clue;
import com.cydm.crm.transaction.model.Tran;

import java.util.List;

public interface ClueService {
    int insertSelective(Clue record);
    List<Clue> queryAll(String fullName,String company,String phone,String source,String owner,
                        String mphone,String state,Integer page,Integer pages);
    int selectPage(String fullName,String company,String phone,String source,String owner,String mphone,String state);


    void deleteBatch(String[] ids);

    Clue selectById(String id);

    void update(Clue clue);

    Clue queryByIdQ(String id);

    void transition(Tran tran);
}
