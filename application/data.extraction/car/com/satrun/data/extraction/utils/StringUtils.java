package com.satrun.data.extraction.utils;

public class StringUtils {

	/** *//**
     * ȥ�����ҿո���ַ����Ƿ�Ϊ��
     */
    public static boolean isTrimEmpty(String astr) {
        if ((null == astr) || (astr.length() == 0)) {
                return true;
        }
        if (isBlank(astr.trim())) {
                return true;
        }
        return false;
    }

    public static boolean isBlank(String astr) {
        if ((null == astr) || (astr.length() == 0)) {
                return true;
        } else {
                return false;
        }
    }

}
