package com.cydm.crm.contacts.service.impl;

import com.cydm.crm.contacts.mapper.ContactsMapper;
import com.cydm.crm.contacts.model.Contacts;
import com.cydm.crm.contacts.service.ContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ContactsServiceImpl implements ContactsService {
    @Autowired
    private ContactsMapper contactsMapper;

    @Transactional(timeout = 60,readOnly = true)
    public List<Contacts> queryByName(String name) {
        return contactsMapper.selectByName(name);
    }
}
