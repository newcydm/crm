package com.cydm.crm.commons.model;

public class Constants {
    public static final int STATUS_OK=2000;
    public static final int STATUS_ERROR=2001;          //执行失败
    public static final int STATUS_LOGINERROR=2002;     //用户名或者密码错误
    public static final int STATUS_EXPIRED=2003;        //账户过期
    public static final int STATUS_LOCKED=2004;         //账户锁定
    public static final int STATUS_IP=2005;             //IP受限
    public static final int STATUS_ACCESSERROR=2006;    //权限不足
    public static final String SESSION_USER="user";     //登录用户在Session中的key
    public static final String MESSAGE="message";
}
