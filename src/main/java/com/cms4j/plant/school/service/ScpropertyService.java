package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/7/31
 */
@Service
public class ScpropertyService {
    @Autowired
    private DaoSupport daoSupport;
    /**
     * 根据SCHOOL_ID获取数据
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getScpropertyByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScpropertyMapper.getScpropertyByScId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addScproperty(DataMap dataMap) throws Exception {
        daoSupport.save("ScpropertyMapper.addScproperty", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeScpropertysByScId(DataMap dataMap) throws Exception {
        daoSupport.delete("ScpropertyMapper.removeScpropertysByScId", dataMap);
    }
}
