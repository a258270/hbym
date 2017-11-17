package com.cms4j.plant.util;

import org.apache.commons.lang3.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PlantValidUtil {

    public static String REG_USERNAME = "^[a-zA-Z0-9][a-zA-Z0-9_]{5,15}$";
    public static String ERROR_MSG_USERNAME = "用户名格式不正确！以字母或数字开头，长度在6-16之间，只能包含字符、数字和下划线";

    public static String REG_PWD = "^[a-zA-Z0-9][a-zA-Z0-9_]{5,15}$";
    public static String ERROR_MSG_PWD = "密码格式不正确！以字母或数字开头，长度在6-16之间，只能包含字符、数字和下划线";

    public static String REG_IDCARD = "^(\\d{6})()?(\\d{4})(\\d{2})(\\d{2})(\\d{3})(\\w)$";
    public static String ERROR_MSG_IDCARD = "身份证号格式不正确！";

    public static String REG_PHONE = "^1[0-9]{10}$";
    public static String ERROR_MSG_PHONE = "请使用11位手机号码！";

    public static String REG_MAIL = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
    public static String ERROR_MSG_MAIL = "邮箱格式不正确！";

    public static String[] IMG_SUFFIX_VALID = {".png", ".bmp", ".jpg", ".jpeg"};
    public static String ERROR_MSG_IMGSUFFIX = "图片格式仅支持：png、bmp、jpg、jpeg";

    public static String[] VIDEO_SUFFIX_VALID = {".swf",".flv",".mp3",".wav",".wma",".wmv",".mid",".avi",".mpg",".asf",".rm",".rmvb",".mp4"};
    public static String ERROR_MSG_VIDEOSUFFIX = "视频格式仅支持：swf、flv、mp3、wav、wma、wmv、mid、avi、mpg、asf、rm、rmvb、mp4";

    public static String REG_NICKNAME = "^.{0,7}$";
    public static String ERROR_MSG_NICKNAME = "昵称长度不能超过7位！";

    public static boolean isUsername(String username) {
        return regInfo(REG_USERNAME, username);
    }

    public static boolean isPwd(String pwd) {
        return regInfo(REG_PWD, pwd);
    }

    public static boolean isIdCard(String idcard) {
        return regInfo(REG_IDCARD, idcard);
    }

    public static boolean isPhone(String phone) {
        return regInfo(REG_PHONE, phone);
    }

    public static boolean isMail(String mail) {
        return regInfo(REG_MAIL, mail);
    }

    public static boolean isNickname(String nickname) {
        return regInfo(REG_NICKNAME, nickname);
    }

    public static boolean regInfo(String reg, String info) {
        if(StringUtils.isBlank(info)) return false;

        Pattern pattern = Pattern.compile(reg);
        Matcher matcher = pattern.matcher(info);
        return matcher.matches();
    }

    public static boolean isImgSuffix(String suffix) {
        for(int i = 0; i < IMG_SUFFIX_VALID.length; i++) {
            if(IMG_SUFFIX_VALID[i].equals(suffix)) return true;
        }

        return false;
    }

    public static boolean isVideoSuffix(String suffix) {
        for(int i = 0; i < VIDEO_SUFFIX_VALID.length; i++) {
            if(VIDEO_SUFFIX_VALID[i].equals(suffix)) return true;
        }

        return false;
    }
}
