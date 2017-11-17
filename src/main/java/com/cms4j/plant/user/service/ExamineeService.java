package com.cms4j.plant.user.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ExamineeService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addExaminee(DataMap dataMap) throws Exception {
        daoSupport.save("ExamineeMapper.addExaminee", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editExaminee(DataMap dataMap) throws Exception {
        daoSupport.update("ExamineeMapper.editExaminee", dataMap);
    }

    public DataMap getExamineeByUserId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ExamineeMapper.getExamineeByUserId", dataMap);
    }

    public DataMap getExamineeById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ExamineeMapper.getExamineeById", dataMap);
    }
}
