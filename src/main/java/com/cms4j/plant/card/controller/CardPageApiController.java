package com.cms4j.plant.card.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.plant.card.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CardPageApiController extends ApiBaseController {

    @Autowired
    private CardService cardService;
}
