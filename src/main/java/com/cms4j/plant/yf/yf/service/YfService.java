package com.cms4j.plant.yf.yf.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.*;
import com.cms4j.plant.stucount.service.StucountService;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.util.PlantConst;
import jxl.Sheet;
import jxl.Workbook;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.util.Arrays;
import java.util.List;

/**
* Description: YfService
* Created by zmj on 2017/09/18.
*/
@Service
public class YfService {

    @Autowired
    private DaoSupport daoSupport;
    @Autowired
    private StucountService stucountService;

    /**
    * 根据YF_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getYfById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("YfMapper.getYfById", dataMap);
    }

    /**
    * 获取一分一档分页数据
    * @param page
    * @return
    * @throws Exception
    */
    public List<DataMap> getYfs(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("YfMapper.getYfs", page);
    }

    /**
    * 批量删除一分一档
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        for(String obj : objList) {
            DataMap dObj = new DataMap();
            dObj.put("YF_ID", obj);
            dObj = this.getYfById(dObj);
            if(dObj != null) {
                this.removeYfByYearAndMajortype(dObj);
                stucountService.removeStucountByYearAndMajortype(dObj);
            }
        }
    }

    /**
    * 新增一分一档
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addYf(DataMap dataMap) throws Exception {
        dataMap.put("YF_ID", ShortUUID.randomUUID());
        daoSupport.save("YfMapper.addYf", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean addYf(DataMap dataMap, MultipartFile file) throws Exception {
        Workbook wb = Workbook.getWorkbook(file.getInputStream());
        Sheet sheet = wb.getSheet(0);

        String maxTotalCountW = "";
        String maxTotalCountL = "";

        for(int i = 2; i < sheet.getRows(); i++){
            String score = sheet.getCell(0, i).getContents();
            String wcount = sheet.getCell(1, i).getContents();
            String wtotalcount = sheet.getCell(2, i).getContents();
            String lcount = sheet.getCell(3, i).getContents();
            String ltotalcount = sheet.getCell(4, i).getContents();

            DataMap yf = new DataMap();
            yf.put("YEAR_ID", dataMap.getString("YEAR_ID"));
            if(!StringUtils.isBlank(score) && !StringUtils.isBlank(wcount) && !StringUtils.isBlank(wtotalcount)){
                yf.put("MAJORTYPE_ID", PlantConst.MAJORTYPE_W);
                yf.put("SCORE", score);
                yf.put("COUNT", wcount);
                yf.put("TOTALCOUNT", wtotalcount);
                addYf(yf);

                maxTotalCountW = yf.getString("TOTALCOUNT");
            }

            if(!StringUtils.isBlank(score) && !StringUtils.isBlank(lcount) && !StringUtils.isBlank(ltotalcount)){
                yf.put("MAJORTYPE_ID", PlantConst.MAJORTYPE_L);
                yf.put("SCORE", score);
                yf.put("COUNT", lcount);
                yf.put("TOTALCOUNT", ltotalcount);
                addYf(yf);

                maxTotalCountL = yf.getString("TOTALCOUNT");
            }
        }
        wb.close();

        if(!StringUtils.isBlank(maxTotalCountW)) {
            DataMap stucount = new DataMap();
            stucount.put("YEAR_ID", dataMap.getString("YEAR_ID"));
            stucount.put("MAJORTYPE_ID", PlantConst.MAJORTYPE_W);
            stucount.put("STUCOUNT", maxTotalCountW);
            stucountService.addStuCount(stucount);
        }

        if(!StringUtils.isBlank(maxTotalCountL)) {
            DataMap stucount = new DataMap();
            stucount.put("YEAR_ID", dataMap.getString("YEAR_ID"));
            stucount.put("MAJORTYPE_ID", PlantConst.MAJORTYPE_L);
            stucount.put("STUCOUNT", maxTotalCountW);
            stucountService.addStuCount(stucount);
        }

        return true;
    }

    /**
    * 编辑一分一档
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editYf(DataMap dataMap) throws Exception {
        daoSupport.update("YfMapper.editYf", dataMap);
    }

    /**
    * 编辑一分一档中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfYf(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("YEAR_ID")))
            dataMap.put("YEAR_ID", null);
        if(StringUtils.isBlank(dataMap.getString("MAJORTYPE_ID")))
            dataMap.put("MAJORTYPE_ID", null);
        if(StringUtils.isBlank(dataMap.getString("SCORE")))
            dataMap.put("SCORE", null);
        if(StringUtils.isBlank(dataMap.getString("COUNT")))
            dataMap.put("COUNT", null);
        if(StringUtils.isBlank(dataMap.getString("TOTALCOUNT")))
            dataMap.put("TOTALCOUNT", null);
        daoSupport.update("YfMapper.editNotFrontOfYf", dataMap);
    }

    public List<DataMap> getYfs(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("YfMapper.getYfsByYear", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeYfByYearAndMajortype(DataMap dataMap) throws Exception {
        daoSupport.delete("YfMapper.removeYfByYearAndMajortype", dataMap);
    }
}
