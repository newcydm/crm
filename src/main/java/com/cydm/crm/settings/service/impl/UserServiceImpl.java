package com.cydm.crm.settings.service.impl;

import com.cydm.crm.settings.mapper.UserMapper;
import com.cydm.crm.settings.model.User;
import com.cydm.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(timeout = 60)
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Transactional(timeout = 60,readOnly = true)
    public User queryByLoginActAndByLoginPwd(String loginAct, String loginPwd) {
        return userMapper.selectByLoginActAndByLoginPwd(loginAct,loginPwd);
    }

    @Transactional(timeout = 60,readOnly = true)
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }
}
