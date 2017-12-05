package com.cms4j.base.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/**
 * description: Session工具类
 *
 * @author: zmj
 * @create: 2017/5/7
 */
public class SessionUtil {

    /**
     * session中管理员user信息存放的key值
     */
    public static final String SESSION_ADMIN_USER_KEY = "session_admin_user_key";
    /**
     * session中user信息存放的key值
     */
    public static final String SESSION_USER_KEY = "session_user_key";
    /**
     * session中验证码信息存放的key值
     */
    public static final String SESSION_VERIFYCODE_KEY = "CODE";
    /**
     * session中角色信息存放的key值
     */
    public static final String SESSION_ROLE_KEY = "session_role_key";
    /**
     * session中个人信息存放的key值
     */
    public static final String SESSION_COMPLETE_KEY = "session_complete_key";
    /**
     * session中微信信息存放的key值
     */
    public static final String SESSION_WECHAT_USER_KEY = "session_wechat_user_key";

    /**
     * session中短信验证码信息存放的key值
     */
    public static final String SESSION_SMSVERIFYCODE_KEY = "SMSCODE";

    /**
     * session中性格测试信息存放的key值
     */
    public static final String SESSION_CHARACTER_E = "session_character_E";

    public static final String SESSION_CHARACTER_I = "session_character_I";

    public static final String SESSION_CHARACTER_S = "session_character_S";

    public static final String SESSION_CHARACTER_N = "session_character_N";

    public static final String SESSION_CHARACTER_T = "session_character_T";

    public static final String SESSION_CHARACTER_F = "session_character_F";

    public static final String SESSION_CHARACTER_J = "session_character_J";

    public static final String SESSION_CHARACTER_P = "session_character_P";

    /**
     * session中邮箱验证码信息存放的key值
     */
    public static final String SESSION_EMAILVERIFYCODE_KEY = "EMAILCODE";
    public static Session getSession() {
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();

        return session;
    }

    /**
     * 获取session中的user信息
     * @return
     */
    public static DataMap getCurUser() {
        return (DataMap) SessionUtil.getSession().getAttribute(SessionUtil.SESSION_USER_KEY);
    }

    /**
     * 将用户信息存入session
     * @param user
     */
    public static void addUser2Session(DataMap user) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_USER_KEY, user);
    }

    /**
     * 将用户信息从session中移除
     */
    public static void removeUserFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_USER_KEY);
    }

    /**
     * 获取session中的管理员user信息
     * @return
     */
    public static DataMap getCurAdminUser() {
        return (DataMap) SessionUtil.getSession().getAttribute(SessionUtil.SESSION_ADMIN_USER_KEY);
    }

    /**
     * 将管理员用户信息存入session
     * @param user
     */
    public static void addAdminUser2Session(DataMap user) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_ADMIN_USER_KEY, user);
    }

    /**
     * 将管理员用户信息从session中移除
     */
    public static void removeAdminUserFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_ADMIN_USER_KEY);
    }

    /**
     * 获取session中的角色信息
     * @return
     */
    public static DataMap getRoleFromSession() {
        return (DataMap) SessionUtil.getInfoFromSession(SessionUtil.SESSION_ROLE_KEY);
    }

    /**
     * 将角色信息存入session
     * @param role
     */
    public static void addRole2Session(DataMap role) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_ROLE_KEY, role);
    }

    /**
     * 移除session中的角色信息
     */
    public static void removeRoleFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_ROLE_KEY);
    }

    /**
     * 获取session中的个人信息
     * @return
     */
    public static DataMap getCompleteFromSession() {
        return (DataMap) SessionUtil.getInfoFromSession(SessionUtil.SESSION_COMPLETE_KEY);
    }

    /**
     * 将个人信息存入session
     * @param complete
     */
    public static void addComplete2Session(DataMap complete) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_COMPLETE_KEY, complete);
    }

    /**
     * 移除session中的个人信息
     */
    public static void removeCompleteFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_COMPLETE_KEY);
    }

    /**
     * 获取session中的微信信息
     * @return
     */
    public static DataMap getWechatFromSession() {
        return (DataMap) SessionUtil.getInfoFromSession(SessionUtil.SESSION_WECHAT_USER_KEY);
    }

    /**
     * 将微信信息存入session
     * @param wechat
     */
    public static void addWechat2Session(DataMap wechat) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_WECHAT_USER_KEY, wechat);
    }

    /**
     * 移除session中的微信信息
     */
    public static void removeWechatFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_WECHAT_USER_KEY);
    }

    /**
     * 获取session中的验证码信息
     * @return
     */
    public static String getCodeFromSession() {
        return (String) SessionUtil.getInfoFromSession(SessionUtil.SESSION_VERIFYCODE_KEY);
    }

    /**
     * 将验证码信息存入session
     * @param code
     */
    public static void addCode2Session(String code) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_VERIFYCODE_KEY, code);
    }

    /**
     * 移除session中的验证码信息
     */
    public static void removeCodeFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_VERIFYCODE_KEY);
    }

    /**
     * 获取session中的短信验证码信息
     * @return
     */
    public static String getSMSCodeFromSession() {
        return (String) SessionUtil.getInfoFromSession(SessionUtil.SESSION_SMSVERIFYCODE_KEY);
    }

    /**
     * 将短信验证码信息存入session
     * @param code
     */
    public static void addSMSCode2Session(String code) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_SMSVERIFYCODE_KEY, code);
    }

    /**
     * 移除session中的短信验证码信息
     */
    public static void removeSMSCodeFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_SMSVERIFYCODE_KEY);
    }

    /**
     * 获取session中的邮箱验证码信息
     * @return
     */
    public static String getEMAILCodeFromSession() {
        return (String) SessionUtil.getInfoFromSession(SessionUtil.SESSION_EMAILVERIFYCODE_KEY);
    }

    /**
     * 将邮箱验证码信息存入session
     * @param code
     */
    public static void addEMAILCode2Session(String code) {
        SessionUtil.addInfo2Session(SessionUtil.SESSION_EMAILVERIFYCODE_KEY, code);
    }

    /**
     * 移除session中的邮箱验证码信息
     */
    public static void removeEMAILCodeFromSession() {
        SessionUtil.removeInfoFromSession(SessionUtil.SESSION_EMAILVERIFYCODE_KEY);
    }

    /**
     * 获取session中的信息
     * @param key
     * @return
     */
    public static Object getInfoFromSession(Object key) {
        return SessionUtil.getSession().getAttribute(key);
    }

    /**
     * 将信息存入session
     * @param key
     * @param value
     */
    public static void addInfo2Session(Object key, Object value){
        SessionUtil.getSession().setAttribute(key, value);
    }

    /**
     * 将session中的信息移除
     * @param key
     */
    public static void removeInfoFromSession(Object key) {
        SessionUtil.getSession().removeAttribute(key);
    }

    public static Integer getNextCharacterNumber() {
        Integer iE = getInfoFromSession(SESSION_CHARACTER_E) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_E);
        Integer iI = getInfoFromSession(SESSION_CHARACTER_I) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_I);

        Integer iS = getInfoFromSession(SESSION_CHARACTER_S) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_S);
        Integer iN = getInfoFromSession(SESSION_CHARACTER_N) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_N);

        Integer iT = getInfoFromSession(SESSION_CHARACTER_T) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_T);
        Integer iF = getInfoFromSession(SESSION_CHARACTER_F) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_F);

        Integer iJ = getInfoFromSession(SESSION_CHARACTER_J) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_J);
        Integer iP = getInfoFromSession(SESSION_CHARACTER_P) == null ? 0 : (Integer) getInfoFromSession(SESSION_CHARACTER_P);

        return iE + iI + iS + iN + iT + iF + iJ + iP + 1;
    }
}
