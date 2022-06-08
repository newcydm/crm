package com.cydm.crm.settings.service;

import com.cydm.crm.settings.model.User;

import java.util.List;

public interface UserService {
    User queryByLoginActAndByLoginPwd(String loginAct, String loginPwd);
    List<User> selectAll();

    void update(User user);
}
