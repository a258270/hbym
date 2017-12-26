package com.cms4j.plant.school.article.article.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.plant.school.article.article.service.ArticleService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.school.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
 * Description: ArticleController
 * Created by zmj on 2017/12/25.
 */
@Controller
@RequestMapping(value = "/admin/article")
public class ArticleController extends PageBaseController {
    public ArticleController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "25";
    }

    @Autowired
    private ArticleService articleService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private SchoolService schoolService;

    /**
     * 加载院校资料页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        logger.begin("加载院校资料页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/article/article/index");

        List<DataMap> schools = schoolService.getAllSchools();
        modelAndView.addObject("schools", schools);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    /**
     * 加载新增院校资料页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() throws Exception {
        logger.begin("加载新增院校资料页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/article/article/add");

        List<DataMap> schools = schoolService.getAllSchools();
        modelAndView.addObject("schools", schools);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    /**
     * 加载编辑院校资料页面
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载编辑院校资料页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/article/article/edit");
        DataMap dataMap = new DataMap();
        dataMap.put("ARTICLE_ID", id);
        dataMap = articleService.getArticleById(dataMap);
        modelAndView.addObject("article", dataMap);

        List<DataMap> schools = schoolService.getAllSchools();
        modelAndView.addObject("schools", schools);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }
}
