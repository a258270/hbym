package com.cms4j.base.interceptor;

import com.cms4j.base.util.Const;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.util.PlantConst;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 登陆Interceptor
 * 由于考虑到系统不只是会有后台管理界面，可能会有提供给用户使用的界面
 * 特把登陆检测拆分开，后台管理的url会统一格式，当url匹配Const.REG_MANAGE_URL时
 * 则为后台管理页面的url
 * @see Const
 *
 * @author: zmj
 * @create: 2017/5/7
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        //System.out.println();
        request.getSession().getId();
        //request.getHeader("user-agent");
        String path = request.getServletPath();
        //过滤无需拦截的url
        if(path.matches(Const.REG_NOTERCEPTOR_URL))
            return true;

        if(path.matches(Const.REG_PLANT_URL)){
            if(path.matches(Const.REG_PLANT_TERCEPTOR_URL)){
                DataMap user = SessionUtil.getCurUser();
                if(user == null){
                    interceptor(request, response);
                    return false;
                }
            }
            return true;
        }

        if(path.matches(Const.REG_WECHAT_URL)) {
            if(path.matches(Const.REG_WECHAT_NOTERCEPTOR_URL)) {
                return true;
            }

            DataMap wxUser = SessionUtil.getWechatFromSession();
            if(wxUser == null) {
                interceptorWechat(request, response, Const.NOLOGIN_CODE);
                return false;
            }

            DataMap user = SessionUtil.getCurUser();
            if(user == null) {
                interceptorWechat(request, response, Const.NOPLANTUSER_CODE);
                return false;
            }

            return true;
        }



        if(path.matches(Const.REG_MANAGE_URL)){//url匹配Const.REG_MANAGE_URL
            DataMap user = SessionUtil.getCurAdminUser();
            if(user == null){
                interceptor(request, response);
                return false;
            }
            return true;
        }

        interceptor(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    public void interceptor(HttpServletRequest request, HttpServletResponse response) {
        //跳转至登录界面
        PrintWriter out = null;
        try {
            if (request.getParameter("ajax") != null) {
                out = response.getWriter();
                out.append(new InvokeResult().failure(Const.NOLOGIN_CODE, "please relogin").toString());
            } else {
                //就算管理员没登陆也最好不要直接redirect至后台登陆页面，所以这里redirect至另外的url
                response.sendRedirect(request.getContextPath() + Const.LOGIN);
            }
        }catch (IOException e){
            e.printStackTrace();
        }
        finally {
            if(out != null)
                out.close();
        }
    }

    public void interceptorWechat(HttpServletRequest request, HttpServletResponse response, String code) {
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.append(new InvokeResult().failure(code, "relogin").toString());
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            if(out != null)
                out.close();
        }
    }
}
