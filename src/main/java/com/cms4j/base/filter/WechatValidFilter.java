/*
package com.cms4j.base.filter;

import com.cms4j.base.util.LoggerUtil;
import com.zone.weixin4j.util.MessageUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

public class WechatValidFilter implements Filter {
    private LoggerUtil logger = LoggerUtil.getLogger(this.getClass());

    @Value("${wechat.token}")
    private String token;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.info("wechatValidFitler加载成功！");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
            throws IOException, ServletException {
        String signature = request.getParameter("signature");// 微信加密签名
        String timestamp = request.getParameter("timestamp");// 时间戳
        String nonce = request.getParameter("nonce");// 随机数
        String echostr = request.getParameter("echostr");//
        //确认此次GET请求来自微信服务器，原样返回echostr参数内容，则接入生效，成为开发者成功，否则接入失败
        */
/*if (TokenUtil.checkSignature(_token, signature, timestamp, nonce)) {

        }*//*


        if(signature != null && signature.equals(MessageUtil.signature(token, timestamp, nonce))){
            response.getWriter().write(echostr);
        }
    }

    @Override
    public void destroy() {

    }


}
*/
