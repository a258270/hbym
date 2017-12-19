package com.cms4j.plant.user.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.system.user.online.service.SessionService;
import com.cms4j.base.util.*;
import com.cms4j.plant.user.pocket.service.PocketService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/28
 */
@Service
public class PlantUserService {

    @Autowired
    private DaoSupport daoSupport;
    @Autowired
    private PocketService pocketService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private SessionService sessionService;
    @Autowired
    private CompleteProService completeProService;
    @Autowired
    private CompleteStudentService completeStudentService;
    @Autowired
    private ExamineeService examineeService;

    public DataMap validUser(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("PlantUserMapper.validUser", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void regUser(DataMap dataMap) throws Exception {
        dataMap.put("USER_ID", ShortUUID.randomUUID());
        dataMap.put("PASSWORD", MD5Util.getMD5(dataMap.getString("PASSWORD")));
        dataMap.put("ROLE_ID", PlantConst.ROLE_STUDENT);
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("IP", "");
        dataMap.put("LAST_LOGIN", "");
        daoSupport.save("PlantUserMapper.regUser", dataMap);
        DataMap pocket = new DataMap();
        pocket.put("POCKET_ID", ShortUUID.randomUUID());
        pocket.put("USER_ID", dataMap.getString("USER_ID"));
        pocket.put("CREATETIME", DateUtil.getCurrentTime());
        pocket.put("UPDATETIME", DateUtil.getCurrentTime());
        pocketService.addPocket(pocket);

        //dataMap.put("PHONE", dataMap.getString("USERNAME"));
        dataMap.put("HEADURL", PlantConst.STATIC_IMG_NOHEAD);
        completeStudentService.addCompleteStudent(dataMap);
        dataMap.put("EXAMINEE_ID", ShortUUID.randomUUID());
        dataMap.put("CREATEDATE", DateUtil.getCurrentDate());
        dataMap.put("MODIFYDATE", DateUtil.getCurrentDate());
        examineeService.addExaminee(dataMap);
    }

    public DataMap getUserByUsername(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("PlantUserMapper.getUserByUsername", dataMap);
    }

    public void editUserLoginInfo(DataMap dataMap) throws Exception {
        daoSupport.update("PlantUserMapper.editUserLoginInfo", dataMap);
    }

    public DataMap getUserByUserId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("PlantUserMapper.getUserByUserId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void updatePassword(DataMap dataMap) throws Exception {
        daoSupport.update("PlantUserMapper.updatePassword", dataMap);
    }

    public List<DataMap> getTeachers(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("PlantUserMapper.getTeachers", page);
    }

    public List<DataMap> getExperts(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("PlantUserMapper.getExperts", page);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addUser(DataMap dataMap) throws Exception {
        dataMap.put("USER_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("PASSWORD", MD5Util.getMD5(dataMap.getString("PASSWORD")));
        dataMap.put("IP", "0.0.0.0");
        dataMap.put("LAST_LOGIN", dataMap.getString("CREATETIME"));
        daoSupport.save("PlantUserMapper.addUser", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addTeacher(DataMap dataMap) throws Exception {
        dataMap.put("ROLE_ID", PlantConst.ROLE_TEACHER);
        addUser(dataMap);
        //dataMap.put("PHONE", dataMap.getString("USERNAME"));
        if(StringUtils.isBlank(dataMap.getString("HEADURL")))
            dataMap.put("HEADURL", PlantConst.STATIC_IMG_NOHEAD);
        completeTeacherService.addBaseCompleteTeacher(dataMap);

        DataMap pocket = new DataMap();
        pocket.put("POCKET_ID", ShortUUID.randomUUID());
        pocket.put("USER_ID", dataMap.getString("USER_ID"));
        pocket.put("CREATETIME", DateUtil.getCurrentTime());
        pocket.put("UPDATETIME", DateUtil.getCurrentTime());
        pocketService.addPocket(pocket);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addExpert(DataMap dataMap) throws Exception {
        dataMap.put("ROLE_ID", PlantConst.ROLE_EXPERT);
        addUser(dataMap);
        //dataMap.put("PHONE", dataMap.getString("USERNAME"));
        if(StringUtils.isBlank(dataMap.getString("HEADURL")))
            dataMap.put("HEADURL", PlantConst.STATIC_IMG_NOHEAD);
        completeProService.addCompletePro(dataMap);

        DataMap pocket = new DataMap();
        pocket.put("POCKET_ID", ShortUUID.randomUUID());
        pocket.put("USER_ID", dataMap.getString("USER_ID"));
        pocket.put("CREATETIME", DateUtil.getCurrentTime());
        pocket.put("UPDATETIME", DateUtil.getCurrentTime());
        pocketService.addPocket(pocket);
    }

    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.update("PlantUserMapper.batchRemoves", objList);
        for(String obj : objList) {
            sessionService.kickPlantUser(obj);
        }
    }

    /**
     * 解冻用户
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void unRemove(DataMap dataMap) throws Exception {
        daoSupport.update("PlantUserMapper.unRemove", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editTeacher(DataMap dataMap) throws Exception {
        daoSupport.update("PlantUserMapper.editTeacher", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void setUserVip(DataMap dataMap) throws Exception {
        daoSupport.update("PlantUserMapper.setUserVip", dataMap);
    }

    public List<DataMap> searchStus(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("PlantUserMapper.searchStus", page);
    }
}
