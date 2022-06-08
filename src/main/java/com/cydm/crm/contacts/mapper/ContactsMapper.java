package com.cydm.crm.contacts.mapper;

import com.cydm.crm.contacts.model.Contacts;
import com.cydm.crm.contacts.model.ContactsKey;

import java.util.List;

public interface ContactsMapper {
    int deleteByPrimaryKey(ContactsKey key);

    int insert(Contacts record);

    int insertSelective(Contacts record);

    Contacts selectByPrimaryKey(ContactsKey key);

    int updateByPrimaryKeySelective(Contacts record);

    int updateByPrimaryKey(Contacts record);

    List<Contacts> selectByName(String name);
}