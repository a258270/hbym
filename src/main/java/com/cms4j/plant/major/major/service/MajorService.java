package com.cms4j.plant.major.major.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.user.service.ExamineeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cms4j.base.util.DateUtil;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
* Description: MajorService
* Created by zmj on 2017/09/13.
*/
@Service
public class MajorService {

    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private DaoSupport daoSupport;

    /**
     * 获取所有叶子节点专业
     * @return 当结果集为空时，返回new ArraryList
     */
    public List<DataMap> getLeafMajors(String code) throws Exception {
        return getMajorsByLevel(code, 5);
    }

    /**
     *
     * @param code 字典内码
     * @param level 2-5 其中5为叶子节点，详情结构参照字典结构
     * @return
     * @throws Exception
     */
    public List<DataMap> getMajorsByLevel(String code, int level) throws Exception {
        List<DataMap> listOut = new ArrayList<>();
        DataMap dataMap = new DataMap();
        dataMap.put("CODE", code);
        dataMap = dictionaryService.getDictionaryByCode(dataMap);
        List<DataMap> rootMajors = dictionaryService.getDictionariesByFatherId(dataMap);
        if(rootMajors == null)
            return listOut;

        if(level == 2)
            return rootMajors;

        for(DataMap rootMajor : rootMajors){//rootMajor为二位code
            List<DataMap> listMajors = dictionaryService.getDictionariesByFatherId(rootMajor);
            if(listMajors == null)
                continue;

            if(level == 3) {
                listOut.addAll(listMajors);
                continue;
            }
            for(DataMap listMarjor : listMajors){//listMarjor为四位code
                List<DataMap> leafTopMarjos = dictionaryService.getDictionariesByFatherId(listMarjor);
                if(leafTopMarjos == null)
                    continue;
                if(level == 4){
                    listOut.addAll(leafTopMarjos);
                    continue;
                }
                for(DataMap leafTopMarjor : leafTopMarjos){//leafMarjor为五位code
                    List<DataMap> leafMajors = dictionaryService.getDictionariesByFatherId(leafTopMarjor);
                    if(leafTopMarjos == null)
                        continue;
                    if(level == 5){
                        listOut.addAll(leafMajors);
                        continue;
                    }
                }
            }
        }

        return listOut;
    }

    public List<DataMap> getPageMajors(Page page) throws Exception {
        List<DataMap> majorNodes = (List<DataMap>) daoSupport.findForList("MajorMapper.getPageMajors", page);
        if(majorNodes == null) return new ArrayList<>();
        for(DataMap majorNode : majorNodes) {
            List<DataMap> majorNode_childs = dictionaryService.getDictionariesByFatherId(majorNode);
            if(majorNode_childs == null) continue;
            for(DataMap majorNode_child : majorNode_childs) {
                List<DataMap> majorNode_child_childs = dictionaryService.getDictionariesByFatherId(majorNode_child);
                if(majorNode_child_childs == null) continue;
                List<DataMap> majorNode_child_childs_arr = new ArrayList<>();
                majorNode_child_childs_arr.addAll(majorNode_child_childs);
                /*for(DataMap majorNode_child_child : majorNode_child_childs){
                    List<DataMap> majorNode_child_childTmp = dictionaryService.getDictionariesByFatherId(majorNode_child_child);
                    if(majorNode_child_childTmp == null) continue;
                    majorNode_child_childs_arr.addAll(majorNode_child_childTmp);
                }*/
                majorNode_child.put("childs", majorNode_child_childs_arr);
            }

            majorNode.put("childs", majorNode_childs);
        }

        return majorNodes;
    }

    public List<DataMap> getMajors(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MajorMapper.getMajors", page);
    }

    /**
    * 根据MAJOR_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getMajorById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("MajorMapper.getMajorById", dataMap);
    }

    /**
    * 批量删除专业
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("MajorMapper.batchRemoves", objList);
    }

    /**
    * 新增专业
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addMajor(DataMap dataMap) throws Exception {
        dataMap.put("MAJOR_ID", ShortUUID.randomUUID());
        daoSupport.save("MajorMapper.addMajor", dataMap);
    }

    /**
    * 编辑专业
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editMajor(DataMap dataMap) throws Exception {
        daoSupport.update("MajorMapper.editMajor", dataMap);
    }

    /**
    * 编辑专业中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfMajor(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("DIC_ID")))
            dataMap.put("DIC_ID", null);
        daoSupport.update("MajorMapper.editNotFrontOfMajor", dataMap);
    }

    /**
     * 浏览专业
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void viewMajor(DataMap dataMap) throws Exception {
        daoSupport.update("MajorMapper.viewMajor", dataMap);
    }

    /**
     * 根据专业id获取数据
     * @param dataMap
     * @return
     * @throws Exception
     */
    public DataMap getMajorByMajorId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("MajorMapper.getMajorByMajorId", dataMap);
    }

    public List<DataMap> getTopMajors(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MajorMapper.getTopMajors", page);
    }
}
