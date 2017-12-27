package com.cms4j.base.config;

import com.cms4j.base.interceptor.LoginInterceptor;
import com.cms4j.base.interceptor.VersionInterceptor;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.helper.WechatAppProxy;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.account.WechatAppAccount;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * description: Springmvc配置
 *
 * @author: zmj
 * @create: 2017/5/7
 */
@Configuration
public class MvcConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private BaseSetting baseSetting;
    @Value("${spring.profiles.active}")
    private String active;
    @Value("${spring.profiles.version}")
    private String version;
    @Value("${wechat.applet.appId}")
    private String appId;
    @Value("${wechat.applet.secret}")
    private String secret;
    @Value("${wechat.applet.mch_id}")
    private String mch_id;
    @Value("${wechat.applet.mch_password}")
    private String mch_password;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        super.addResourceHandlers(registry);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**/**");
        registry.addWebRequestInterceptor(new VersionInterceptor(baseSetting, active, version));
        super.addInterceptors(registry);
    }

    @Bean
    public WechatAppProxy getWechatAppProxy() {
        WechatAppAccount wechatAppAccount = null;
        if(StringUtils.isBlank(mch_id) || StringUtils.isBlank(mch_password)) {
            wechatAppAccount = new WechatAppAccount(appId, secret);
        }
        else{
            wechatAppAccount = new PayAccount(appId, secret, mch_id, mch_password);
        }

        return new WechatAppProxy(wechatAppAccount);
    }
}