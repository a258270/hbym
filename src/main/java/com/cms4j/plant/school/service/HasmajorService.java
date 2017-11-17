package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.plant.user.service.ExamineeService;
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
public class HasmajorService {
    @Autowired
    private DaoSupport daoSupport;
    /**
     * 根据SCHOOL_ID获取数据
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getHasmajorByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("HasmajorMapper.getHasmajorByScId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addHasmajor(DataMap dataMap) throws Exception {
        daoSupport.save("HasmajorMapper.addHasmajor", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeHasmajorsByScId(DataMap dataMap) throws Exception {
        daoSupport.delete("HasmajorMapper.removeHasmajorsByScId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeHasmajor(DataMap dataMap) throws Exception {
        daoSupport.delete("HasmajorMapper.removeHasmajor", dataMap);
    }

    public List<DataMap> getHasmajorByYear(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("HasmajorMapper.getHasmajorByYear", dataMap);
    }
}
