package com.cydm.crm.commons.utils;

import java.io.File;

/**
 * 修改文件名
 */
public class FileNameUtil {
    //要修改的文件目录
    static String s="D:\\素材\\静态资源";

    //要修改的后缀
    static String suffix="txt";

    //修改后的后缀
    static String replace="jsp";

    public static void main(String[] args) {
        util(s);
    }
    public static void util(String str){
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

            File filePath=file1.getParentFile();//父路径
            String fileName=file1.getName();//旧文件名
            String newName=null;//新文件名
            File fileNew=null;//新文件名加父路径

            //判断文件是否有需要被替换的字符串
            if(fileName.contains(suffix)){
                //把html后缀替换成jsp并返回新文件名
                newName=fileName.replaceAll(suffix,replace);

                //原文件父路径加新文件名的文件流
                fileNew=new File(filePath+"/"+newName);

                //修改文件名
                file1.renameTo(fileNew);
            }

        }

    }
}
