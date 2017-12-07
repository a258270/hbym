package com.cms4j.plant.character.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.character.service.CharacterService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/plant/character/api")
public class CharacterApiController extends ApiBaseController {
    @Autowired
    private CharacterService characterService;

    @RequestMapping(value = "/answer/{flag}")
    public InvokeResult answer(@PathVariable String flag) throws Exception {
        DataMap dataMap = this.getDataMap();

        if(StringUtils.isBlank(dataMap.getString("answer")))
            return InvokeResult.failure("请选择答案");

        Integer nextNumber = SessionUtil.getNextCharacterNumber();
        DataMap param = new DataMap();
        param.put("MBTI_ID", nextNumber);
        param.put("MBTI_TYPE", flag);
        DataMap nextSubject = characterService.getMbtiByIdAndType(param);
        if(nextSubject == null){
            return InvokeResult.failure("请求数据非法");
        }

        if("A".equals(dataMap.getString("answer"))){
            String result_A = nextSubject.getString("RESULT_A");
            SessionUtil.addInfo2Session("session_character_" + result_A, SessionUtil.getCharacterInfo("session_character_" + result_A) + 1);
        }
        else if("B".equals(dataMap.getString("answer"))){
            String result_B = nextSubject.getString("RESULT_B");
            SessionUtil.addInfo2Session("session_character_" + result_B, SessionUtil.getCharacterInfo("session_character_" + result_B) + 1);
        }
        else{
            return InvokeResult.failure("答案选择不正确");
        }

        return InvokeResult.success();
    }
}
