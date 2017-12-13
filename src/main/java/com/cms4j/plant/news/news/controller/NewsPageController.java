package com.cms4j.plant.news.news.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.user.service.UserService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.plant.news.news.service.NewsService;
import com.cms4j.plant.school.service.ScArticleService;
import com.cms4j.plant.user.service.PlantUserService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/plant/news")
public class NewsPageController extends PageBaseController {

    @Autowired
    private NewsService newsService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/core")
    public ModelAndView news() throws Exception {

        ModelAndView modelAndView = this.getModelAndView();
        Page page = new Page();
        Map params = new HashMap();
        page.setPageNumber(0);
        page.setPageSize(12);
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_GG);
        page.setParams(params);
        List<DataMap> news_gg = newsService.getNewss(page);
        DataMap firstNews_gg = new DataMap();
        DataMap secondNews_gg = new DataMap();
        List<DataMap> firstNewses_gg = new ArrayList<>();
        List<DataMap> secondNewses_gg = new ArrayList<>();

        if(news_gg != null && news_gg.size() > 0){
            if(news_gg.size() > 1){
                //两条及以上
                firstNews_gg = news_gg.get(0);
                secondNews_gg = news_gg.get(1);
                news_gg.remove(0);
                news_gg.remove(0);
            }
            else{
                //就一条
                firstNews_gg = news_gg.get(0);
                news_gg.remove(0);
                secondNews_gg = null;
            }

            if(news_gg.size() > 5) {
                for(int i = 0; i < 5; i++){
                    firstNewses_gg.add(news_gg.get(i));
                }
                for(int i = 0; i < 5; i++){
                    news_gg.remove(0);
                }

                for(DataMap newsTmp : news_gg) {
                    secondNewses_gg.add(newsTmp);
                }
            }
            else{
                for(DataMap newsTmp : news_gg) {
                    firstNewses_gg.add(newsTmp);
                }
            }
        }
        else{
            firstNews_gg = null;
            secondNews_gg = null;
        }

        modelAndView.addObject("firstNews_gg", firstNews_gg);
        modelAndView.addObject("secondNews_gg", secondNews_gg);
        modelAndView.addObject("firstNewses_gg", firstNewses_gg);
        modelAndView.addObject("secondNewses_gg", secondNewses_gg);

        DataMap firstNews_gkdt = null;
        DataMap secondNews_gkdt = null;
        List<DataMap> firstNewses_gkdt = new ArrayList<>();
        List<DataMap> secondNewses_gkdt = new ArrayList<>();

        page.setPageSize(14);
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_GKDT);
        page.setParams(params);
        List<DataMap> news_gkdt = newsService.getNewss(page);
        if(news_gkdt != null && news_gkdt.size() > 5){
            for(int i = 0; i < 5; i++){
                firstNewses_gkdt.add(news_gkdt.get(i));
            }
            for(int i = 0; i < 5; i++){
                news_gkdt.remove(0);
            }
            if(news_gkdt.size() > 0) secondNewses_gkdt = news_gkdt;
            else secondNewses_gkdt = null;
        }
        else if(news_gkdt != null && news_gkdt.size() <= 5) {
            if(news_gkdt.size() == 0){
                firstNewses_gkdt = null;
                secondNewses_gkdt = null;
            }
            else{
                firstNewses_gkdt = news_gkdt;
                secondNewses_gkdt = null;
            }
        }

        if(firstNewses_gkdt != null){
            firstNews_gkdt = firstNewses_gkdt.get(0);
            firstNewses_gkdt.remove(0);
            if(firstNewses_gkdt.size() == 0) firstNewses_gkdt = null;
        }
        if(secondNewses_gkdt != null){
            secondNews_gkdt = secondNewses_gkdt.get(0);
            secondNewses_gkdt.remove(0);
            if(secondNewses_gkdt.size() == 0) secondNewses_gkdt = null;
        }
        modelAndView.addObject("firstNews_gkdt", firstNews_gkdt);
        modelAndView.addObject("secondNews_gkdt", secondNews_gkdt);
        modelAndView.addObject("firstNewses_gkdt", firstNewses_gkdt);
        modelAndView.addObject("secondNewses_gkdt", secondNewses_gkdt);

        DataMap firstNews_wjhd = null;
        List<DataMap> firstNewses_wjhd = new ArrayList<>();
        page.setPageSize(7);
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_WJHD);
        page.setParams(params);
        List<DataMap> news_wjhd = newsService.getNewss(page);
        if(news_wjhd != null && news_wjhd.size() > 0){
            if(news_wjhd.size() > 1){
                firstNews_wjhd = news_wjhd.get(0);
                news_wjhd.remove(0);
                firstNewses_wjhd = news_wjhd;
            }
            else{
                firstNews_wjhd = news_wjhd.get(0);
                news_wjhd.remove(0);
                firstNewses_wjhd = null;
            }
        }
        else{
            firstNews_wjhd = null;
            firstNewses_wjhd = null;
        }
        modelAndView.addObject("firstNews_wjhd", firstNews_wjhd);
        modelAndView.addObject("firstNewses_wjhd", firstNewses_wjhd);

        modelAndView.setViewName("/plant/ymplant/news/news");

        modelAndView.addObject("curPage", "news");
        return modelAndView;
    }

    @RequestMapping(value = "/details/{id}")
    public ModelAndView acticle(@PathVariable String id) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/news/news_details");

        DataMap article = new DataMap();
        article.put("NEWS_ID", id);
        article = newsService.getNewsById(article);

        modelAndView.addObject("article", article);

        if(article != null) {
            newsService.addViewCount(article);//增加浏览量

            DataMap user = new DataMap();
            user.put("USERNAME", article.getString("AUTHOR"));
            user = userService.getUserByUsername(user);
            modelAndView.addObject("author", user);
        }

        Page page = new Page();
        page.setPageNumber(0);
        page.setPageSize(3);
        Map<String, Object> params = new HashMap<>();
        //公告
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_GG);
        page.setParams(params);
        List<DataMap> news_gg = newsService.getNewss(page);
        modelAndView.addObject("news_gg", news_gg);

        //热点新闻
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_RDXW);
        page.setParams(params);
        List<DataMap> news_rdxw = newsService.getNewss(page);
        modelAndView.addObject("news_rdxw", news_rdxw);

        //往届活动
        page.setPageSize(8);
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_WJHD);
        List<DataMap> news_wjhd = newsService.getNewss(page);
        modelAndView.addObject("news_wjhd", news_wjhd);

        return modelAndView;
    }

    @RequestMapping(value = "/more/{flag}/{type}")
    public ModelAndView more(@PathVariable String flag, @PathVariable String type) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/news/notice/inside");

        modelAndView.addObject("flag", flag);
        modelAndView.addObject("type", type);
        return modelAndView;
    }

    @RequestMapping(value = "/search")
    public ModelAndView search() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/search/search");

        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("CONTENT")))
            dataMap.put("CONTENT", "");

        modelAndView.addObject("CONTENT", dataMap.getString("CONTENT"));
        return modelAndView;
    }
}
