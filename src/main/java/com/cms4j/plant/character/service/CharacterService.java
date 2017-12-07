package com.cms4j.plant.character.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CharacterService {

    @Autowired
    private DaoSupport daoSupport;

    public DataMap getMbtiByIdAndType(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CharacterMapper.getMbtiByIdAndType", dataMap);
    }

    public Integer getCountByMbtiType(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("CharacterMapper.getCountByMbtiType", dataMap);
    }

    public DataMap getMbtiResultById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CharacterMapper.getMbtiResultById", dataMap);
    }

    public List<DataMap> getMajorsByResultId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("CharacterMapper.getMajorsByResultId", dataMap);
    }
}
