package com.cms4j.plant.controller;

import com.cms4j.base.controller.PageBaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/29
 */
@Controller
public class PlantLoginController extends PageBaseController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "redirect:/plant/index";
    }
}
