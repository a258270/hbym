package com.cms4j.plant.user.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.plant.user.service.CompleteProService;
import com.cms4j.plant.user.service.PlantUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/plant/expert")
public class PlantExpertController extends PageBaseController {

    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private CompleteProService completeProService;

    @RequestMapping(value = "/index")
    public ModelAndView idnex() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/pertde/pertde");
        Page page = new Page();
        page.setPageSize(8);
        page.setPageNumber(0);
        List<DataMap> experts = plantUserService.getExperts(page);
        if(experts != null) {
            for(DataMap expert : experts) {
                DataMap compelete = completeProService.getCompleteProByUserId(expert);
                expert.put("complete", compelete);
            }
        }
        modelAndView.addObject("experts", experts);

        return modelAndView;
    }
}
