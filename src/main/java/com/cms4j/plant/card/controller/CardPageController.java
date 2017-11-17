package com.cms4j.plant.card.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.plant.card.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CardPageController extends PageBaseController {
    @Autowired
    private CardService cardService;


}
