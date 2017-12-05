package com.cms4j.plant.character.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CharacterService {

    @Autowired
    private DaoSupport daoSupport;

    public DataMap getMbtiByIdAndType(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ChatacterMapper.getMbtiByIdAndType", dataMap);
    }
}
