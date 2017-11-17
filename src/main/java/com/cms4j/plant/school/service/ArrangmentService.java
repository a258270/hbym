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
 * @create: 2017/7/28
 */
@Service
public class ArrangmentService {

    @Autowired
    private DaoSupport daoSupport;

    /**
     * 根据SCHOOL_ID获取数据
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getArrangmentByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ArrangmentMapper.getArrangmentByScId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addArrangment(DataMap dataMap) throws Exception {
        daoSupport.save("ArrangmentMapper.addArrangment", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeArrangmentsByScId(DataMap dataMap) throws Exception {
        daoSupport.delete("ArrangmentMapper.removeArrangmentsByScId", dataMap);
    }
}
