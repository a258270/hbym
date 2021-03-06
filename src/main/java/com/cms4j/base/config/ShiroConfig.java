package com.cms4j.base.config;

import com.cms4j.base.interceptor.ShiroRealm;
import com.cms4j.base.util.Const;
import org.apache.shiro.session.mgt.eis.MemorySessionDAO;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/3
 */
@Configuration
public class ShiroConfig {

    @Bean
    public ShiroFilterFactoryBean shirFilter(){
        ShiroFilterFactoryBean shiroFilterFactoryBean  = new ShiroFilterFactoryBean();

        // 必须设置 SecurityManager
        shiroFilterFactoryBean.setSecurityManager(getSecurityManager());
        // 如果不设置默认会自动寻找Web工程根目录下的"/user.jsp"页面
        shiroFilterFactoryBean.setLoginUrl(Const.LOGIN);
        // 登录成功后要跳转的链接
        shiroFilterFactoryBean.setSuccessUrl("/admin/index");
        //未授权界面;
        shiroFilterFactoryBean.setUnauthorizedUrl("/401");

        /*Map<String, Filter> filters = new HashMap<String, Filter>();
        filters.put("authc", new AuthcFilter());
        shiroFilterFactoryBean.setFilters(filters);*/

        //拦截器.
        Map<String,String> filterChainDefinitionMap = new LinkedHashMap<String,String>();

        //配置退出 过滤器,其中的具体的退出代码Shiro已经替我们实现了
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/plant/api/toexit", "logout");
        filterChainDefinitionMap.put("/admin/login", "anon");
        filterChainDefinitionMap.put("/static/**","anon");
        filterChainDefinitionMap.put("/admin/getcode*","anon");
        filterChainDefinitionMap.put("/admin/tologin*","anon");
        filterChainDefinitionMap.put("/401*","anon");
        filterChainDefinitionMap.put("/404*","anon");
        filterChainDefinitionMap.put("/500*","anon");
        filterChainDefinitionMap.put("/plant/**","anon");
        filterChainDefinitionMap.put("/admin/kindfile/down/**","anon");
        filterChainDefinitionMap.put("/admin/**","authc");
        filterChainDefinitionMap.put("/wechat/**", "anon");
        filterChainDefinitionMap.put("/**/**","anon");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public DefaultWebSecurityManager getSecurityManager(){
        DefaultWebSecurityManager securityManager =  new DefaultWebSecurityManager();
        //设置realm.
        securityManager.setRealm(getShiroRealm());
        securityManager.setSessionManager(defaultWebSessionManager());
        return securityManager;
    }

    @Bean
    public ShiroRealm getShiroRealm(){
        ShiroRealm shiroRealm = new ShiroRealm();
        return shiroRealm;
    }

    @Bean
    public MemorySessionDAO memorySessionDAO() {
        return new MemorySessionDAO();
    }

    @Bean
    public DefaultWebSessionManager defaultWebSessionManager() {
        DefaultWebSessionManager defaultWebSessionManager = new DefaultWebSessionManager();
        defaultWebSessionManager.setSessionDAO(memorySessionDAO());
        defaultWebSessionManager.setGlobalSessionTimeout(43200000);
        defaultWebSessionManager.setSessionIdCookieEnabled(true);
        defaultWebSessionManager.setSessionIdCookie(simpleCookie());
        return defaultWebSessionManager;
    }

    @Bean
    public SimpleCookie simpleCookie() {
        return new SimpleCookie("new.cookie.id");
    }
}
