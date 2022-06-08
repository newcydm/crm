package com.cydm.crm.commons.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 追加文件内容（需要转成txt）
 */
public class FileContentUtil {
    //要修改的文件目录
    static String mulu="D:\\ketang\\crm\\src\\main\\webapp\\WEB-INF";
    //要追加的内容
    static String neirong="<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>";
    public static void main(String[] args) throws IOException {
            util(mulu);
    }

    public static void util(String str) throws IOException {
        //创建文件流
        File file=new File(str);

        if(!file.exists())return;//文件不存在则终止方法

        //存在则返回文件夹多个列表对象
        File[] files = file.listFiles();
        if(files==null&&files.length==0)return;

        for (File file1 : files) {
            if(file1.isDirectory()){//是文件夹，继续递归
                util(file1.getAbsolutePath());
                continue;
            }
            //不是文件夹则执行以下代码
            String fileName=file1.getName();//旧文件名
            if(fileName.contains("txt")){//判断文件是否有jsp为后缀的
                try(FileWriter fw = new FileWriter(file1, true);PrintWriter pw=new PrintWriter(fw)){
                    pw.write(neirong);
                    pw.flush();
                    fw.flush();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }

        }

    }
}
