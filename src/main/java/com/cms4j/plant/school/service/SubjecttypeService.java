package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SubjecttypeService {
    @Autowired
    private DaoSupport daoSupport;
    /**
     * 根据SCHOOL_ID获取数据
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getSubjecttypeByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("SubjecttypeMapper.getSubjecttypeByScId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addSubjecttype(DataMap dataMap) throws Exception {
        daoSupport.save("SubjecttypeMapper.addSubjecttype", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeSubjecttypesByScId(DataMap dataMap) throws Exception {
        daoSupport.delete("SubjecttypeMapper.removeSubjecttypesByScId", dataMap);
    }
}
