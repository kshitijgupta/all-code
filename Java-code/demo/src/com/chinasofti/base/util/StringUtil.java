package com.chinasofti.base.util;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>Title: </p>
 * <p>Description: Meeting  Management Project</p>
 * <p>Created on 2008-7-28</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: ChinaSoft International Corp.</p>
 * @author
 * @version 1.0
 */
public class StringUtil {
    /**
     * 加密 解密
     * @param toBeProcessed String
     * @param mode int 0 加密 1 解密
     * @return String
     */
    public static String encrypt(String toBeProcessed, int mode) {
        String ret = new String();
        // 如果是空直接返回
        if (toBeProcessed == null || toBeProcessed.length() <= 0) {
            return ret;
        }
        // 处理
        int len = toBeProcessed.length();
        int i, j, k, l;
        if (mode == 0) { // 加密
            j = (int)(16 * Math.random() - 16);
            for (i = 1; i <= len; i++) {
                k = j + i % 4;
                ret = String.valueOf((char)(toBeProcessed.charAt(i - 1) + k)) + ret;
            }
            ret += String.valueOf((char)(j + 70));
        } else { // 解密
            l = len - 1;
            j = toBeProcessed.charAt(len - 1) - 70;
            for (i = 1; i <= l; i++) {
                k = j + i % 4;
                ret += String.valueOf((char)(toBeProcessed.charAt(l - i) - k));
            }
        }
        return ret;
    }

    /**
     * 从页面条件中读取参数和值，写入到hash表中
     * @param condition String
     * 
     * @return Map
     */
    public static Map readCondition(String condition) {
    	Map<String, String> ret = new HashMap<String, String>();
    	if((condition!=null)&&(!(condition.equals(""))) ){
    		String[] condArray  = condition.split("&");
    		for(int i=0;i<condArray.length;i++){
    			String[] pairstr  = condArray[i].split("=");
    			ret.put(pairstr[0], pairstr[1]);
    		}
    	}
        return ret;
    }
    
}
