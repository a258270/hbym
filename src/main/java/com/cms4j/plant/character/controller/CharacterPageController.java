package com.cms4j.plant.character.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.util.Const;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.character.service.CharacterService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/plant/character")
public class CharacterPageController extends PageBaseController {

    @Autowired
    private CharacterService characterService;
    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        SessionUtil.removeCharacterInfo();
        modelAndView.setViewName("/plant/ymplant/character/index");

        return modelAndView;
    }

    @RequestMapping(value = "/simple")
    public ModelAndView simple() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        Integer nextNumber = SessionUtil.getNextCharacterNumber();
        DataMap param = new DataMap();
        param.put("MBTI_ID", nextNumber);
        param.put("MBTI_TYPE", PlantConst.MBTI_TYPE_SIMPLE);
        DataMap nextSubject = characterService.getMbtiByIdAndType(param);
        if(nextSubject == null) {
            //答题结束，出结果
            modelAndView.setViewName("redirect:/plant/character/result/" + PlantConst.MBTI_TYPE_SIMPLE);
            return modelAndView;
        }

        modelAndView.addObject("subject", nextSubject);

        Integer mbtiCount = characterService.getCountByMbtiType(param);
        modelAndView.addObject("mbtiCount", mbtiCount);

        modelAndView.addObject("flag", "simple");
        modelAndView.setViewName("/plant/ymplant/character/subject");
        return modelAndView;
    }

    @RequestMapping(value = "/pro")
    public ModelAndView pro() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        Integer nextNumber = SessionUtil.getNextCharacterNumber();
        DataMap param = new DataMap();
        param.put("MBTI_ID", nextNumber);
        param.put("MBTI_TYPE", PlantConst.MBTI_TYPE_PRO);
        DataMap nextSubject = characterService.getMbtiByIdAndType(param);
        if(nextSubject == null) {
            //答题结束，出结果
            modelAndView.setViewName("redirect:/plant/character/result/" + PlantConst.MBTI_TYPE_PRO);
            return modelAndView;
        }

        modelAndView.addObject("subject", nextSubject);

        Integer mbtiCount = characterService.getCountByMbtiType(param);
        modelAndView.addObject("mbtiCount", mbtiCount);

        modelAndView.addObject("flag", "pro");
        modelAndView.setViewName("/plant/ymplant/character/subject");
        return modelAndView;
    }

    @RequestMapping(value = "/result/{flag}")
    public ModelAndView result(@PathVariable String flag) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap param = new DataMap();
        param.put("MBTI_TYPE", flag);
        Integer count = characterService.getCountByMbtiType(param);
        if(count == 0) {
            modelAndView.setViewName("redirect:/plant/character/index");
            return modelAndView;
        }

        if(count >= SessionUtil.getNextCharacterNumber()) {
            if(flag.equals(PlantConst.MBTI_TYPE_SIMPLE)){
                modelAndView.setViewName("redirect:/plant/character/simple");
                return modelAndView;
            }
            else{
                modelAndView.setViewName("redirect:/plant/character/pro");
                return modelAndView;
            }

        }
        else{
            String result = SessionUtil.getCharacterResult();
            param.put("RESULT_ID", result);

            DataMap resultDataMap = characterService.getMbtiResultById(param);
            modelAndView.addObject("result", resultDataMap);

            if(flag.equals(PlantConst.MBTI_TYPE_SIMPLE)){
                modelAndView.addObject("flag", "simple");
            }
            else{
                modelAndView.addObject("flag", "pro");
            }

            param.put("ARRANGMENT", "BMAJOR");
            List<DataMap> bmajors = characterService.getMajorsByResultId(param);

            List bmajorsOut = new ArrayList();
            List bmajorsTmp = new ArrayList();
            for(int i = 0; i < bmajors.size(); i++) {
                if(i % 4 == 0){
                    if(bmajorsTmp.size() > 0){
                        bmajorsOut.add(bmajorsTmp);
                        bmajorsTmp = new ArrayList();
                    }
                }

                bmajorsTmp.add(bmajors.get(i));
                if(i == bmajors.size() - 1)
                    bmajorsOut.add(bmajorsTmp);
            }
            modelAndView.addObject("bmajors", bmajorsOut);

            param.put("ARRANGMENT", "ZMAJOR");
            List<DataMap> zmajors = characterService.getMajorsByResultId(param);

            List zmajorsOut = new ArrayList();
            List zmajorsTmp = new ArrayList();
            for(int i = 0; i < zmajors.size(); i++) {
                if(i % 4 == 0){
                    if(zmajorsTmp.size() > 0){
                        zmajorsOut.add(zmajorsTmp);
                        zmajorsTmp = new ArrayList();
                    }
                }

                zmajorsTmp.add(zmajors.get(i));
                if(i == zmajors.size() - 1)
                    zmajorsOut.add(zmajorsTmp);
            }
            modelAndView.addObject("zmajors", zmajorsOut);

            String resultObj = resultDataMap.getString("RESULT_ID");
            modelAndView.addObject("RESULT_1", resultObj.substring(0, 1).toLowerCase());
            modelAndView.addObject("RESULT_2", resultObj.substring(1, 2).toLowerCase());
            modelAndView.addObject("RESULT_3", resultObj.substring(2, 3).toLowerCase());
            modelAndView.addObject("RESULT_4", resultObj.substring(3, 4).toLowerCase());

            modelAndView.setViewName("/plant/ymplant/character/result");
            return modelAndView;
        }
    }
}
