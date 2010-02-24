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
     * ���� ����
     * @param toBeProcessed String
     * @param mode int 0 ���� 1 ����
     * @return String
     */
    public static String encrypt(String toBeProcessed, int mode) {
        String ret = new String();
        // ����ǿ�ֱ�ӷ���
        if (toBeProcessed == null || toBeProcessed.length() <= 0) {
            return ret;
        }
        // ����
        int len = toBeProcessed.length();
        int i, j, k, l;
        if (mode == 0) { // ����
            j = (int)(16 * Math.random() - 16);
            for (i = 1; i <= len; i++) {
                k = j + i % 4;
                ret = String.valueOf((char)(toBeProcessed.charAt(i - 1) + k)) + ret;
            }
            ret += String.valueOf((char)(j + 70));
        } else { // ����
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
     * ��ҳ�������ж�ȡ������ֵ��д�뵽hash����
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
