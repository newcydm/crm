package com.cydm.crm.clue.service.impl;

import com.cydm.crm.clue.mapper.ClueMapper;
import com.cydm.crm.clue.mapper.ClueRemarkMapper;
import com.cydm.crm.clue.model.Clue;
import com.cydm.crm.clue.service.ClueService;
import com.cydm.crm.commons.utils.UUIDUtil;
import com.cydm.crm.transaction.mapper.TranMapper;
import com.cydm.crm.transaction.model.Tran;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class ClueServiceImpl implements ClueService {
    @Autowired
    private ClueMapper clueMapper;
    @Autowired
    private ClueRemarkMapper clueRemarkMapper;
    @Autowired
    TranMapper tranMapper;
    @Override
    public int insertSelective(Clue record) {
        return clueMapper.insertSelective(record);
    }

    @Transactional(timeout = 60,readOnly = true)
    public List<Clue> queryAll(String fullName,String company,String phone,String source,
                               String owner,String mphone,String state,Integer page,Integer pages) {
        return clueMapper.selectAll(fullName,company,phone,source,owner,mphone,state,page,pages);
    }

    @Transactional(timeout = 60,readOnly = true)
    public int selectPage(String fullName, String company, String phone, String source, String owner, String mphone, String state) {
        return clueMapper.selectPage(fullName,company,phone,source,owner,mphone,state);
    }

    @Override
    public void deleteBatch(String[] ids) {
        clueMapper.deleteBatch(ids);
    }

    @Transactional(timeout = 60,readOnly = true)
    public Clue selectById(String id) {
        return clueMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Clue clue) {
        clueMapper.updateByPrimaryKeySelective(clue);
    }

    @Override
    public Clue queryByIdQ(String id) {
        return clueMapper.selectByIdQ(id);
    }

    @Override
    public void transition(Tran tran) {
        //去除线索id
        String id = tran.getId();
        //查出线索
        Clue clue = clueMapper.selectClue(id);
        tran.setNextContactTime(clue.getNextContactTime());
        tran.setDescription(clue.getDescription());
        tran.setContactSummary(clue.getContactSummary());
        tran.setCreateBy(clue.getCreateBy());
        tran.setCreateTime(clue.getCreateTime());
        //增加交易
        tranMapper.insertSelective(tran);
        //删除线索所有内容
        clueMapper.deleteByPrimaryKey(id);
        //删除线索备注
        clueRemarkMapper.deleteBatchByClueId(id);



    }


}
