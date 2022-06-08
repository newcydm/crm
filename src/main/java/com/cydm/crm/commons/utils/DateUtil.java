package com.cydm.crm.commons.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String formatDateTime(Date date){
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    }
}
