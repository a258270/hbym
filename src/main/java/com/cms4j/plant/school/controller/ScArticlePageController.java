package com.cms4j.plant.school.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.user.service.UserService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.plant.news.news.service.NewsService;
import com.cms4j.plant.school.service.ScArticleService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/plant/article")
public class ScArticlePageController extends PageBaseController {

    @Autowired
    private ScArticleService scArticleService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/details/{id}")
    public ModelAndView details(@PathVariable String id) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/news/news_details");

        DataMap article = new DataMap();
        article.put("ARTICLE_ID", id);
        article = scArticleService.getArticleById(article);

        modelAndView.addObject("article", article);

        if(article != null) {
            scArticleService.addViewCount(article);//增加浏览量

            DataMap user = new DataMap();
            user.put("USER_ID", article.getString("AUTHOR"));
            user = completeTeacherService.getCompleteTeacherByUserId(user);
            if(StringUtils.isBlank(user.getString("NAME")))
                user.put("NAME", user.getString("NICKNAME"));
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

        //热点新闻
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_RDXW);
        page.setParams(params);
        List<DataMap> news_rdxw = newsService.getNewss(page);

        //往届活动
        page.setPageSize(8);
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_WJHD);
        List<DataMap> news_wjhd = newsService.getNewss(page);

        return modelAndView;
    }

}
