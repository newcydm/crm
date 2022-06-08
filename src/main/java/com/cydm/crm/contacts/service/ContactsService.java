package com.cydm.crm.contacts.service;

import com.cydm.crm.contacts.model.Contacts;

import java.util.List;

public interface ContactsService {
    List<Contacts> queryByName(String name);
}
