package com.cms4j.plant.character.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/plant/character")
public class CharacterPageController extends PageBaseController {


    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        modelAndView.setViewName("/plant/ymplant/character/index");

        return modelAndView;
    }

    @RequestMapping(value = "/simple")
    public ModelAndView simple() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        Integer nextNumber = SessionUtil.getNextCharacterNumber();
        DataMap
        modelAndView.addObject("flag", "simple");
        modelAndView.setViewName("/plant/ymplant/character/subject");
        return modelAndView;
    }

    @RequestMapping(value = "/pro")
    public ModelAndView pro() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        modelAndView.addObject("flag", "pro");
        modelAndView.setViewName("/plant/ymplant/character/subject");
        return modelAndView;
    }
}
