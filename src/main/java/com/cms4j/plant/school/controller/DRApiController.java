package com.cms4j.plant.school.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.school.mjscore.service.MjscoreService;
import com.cms4j.plant.school.scscore.service.ScscoreService;
import com.cms4j.plant.school.service.ArrangmentService;
import com.cms4j.plant.school.service.HasmajorService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.util.PlantConst;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableCell;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.crypto.Data;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/7/31
 */
@RestController
public class DRApiController extends ApiBaseController{

    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private ScscoreService scscoreService;
    @Autowired
    private MjscoreService mjscoreService;
    @Autowired
    private HasmajorService hasmajorService;
    @Autowired
    private ArrangmentService arrangmentService;
    @Autowired
    private MajorService majorService;

    @RequestMapping(value = "/admin/daoru")
    public InvokeResult daoru() throws Exception {

        List<DataMap> majors = majorService.getMajorsByLevel("BMAJOR", 4);
        String mubanPath = "D:/a.xls";
        Workbook wb = Workbook.getWorkbook(new File(mubanPath));
        File targetFile = new File("D:/tar.xls");
        WritableWorkbook wwb = Workbook.createWorkbook(targetFile, wb);
        WritableSheet wws = wwb.getSheet(0);
        for(int i = 0; i < wws.getRows(); i++){
            String majorName = wws.getCell(0, i).getContents();
            String info = "";
            if(!StringUtils.isBlank(majorName)){
                for(DataMap major : majors) {
                    if(majorName.equals(major.getString("NAME"))){
                        info += major.getString("DIC_ID") + ",";
                    }
                }
            }

            if(!info.isEmpty()) info = info.substring(0, info.length() - 1);
            WritableCell cc = new Label(1, i, info);
            wws.addCell(cc);
        }

        wwb.write();
        wwb.close();
        /*DataMap arrangment = new DataMap();
        arrangment.put("CODE", "ARRANGMENT");
        arrangment = dictionaryService.getDictionaryByCode(arrangment);
        List<DataMap> arrangments = dictionaryService.getDictionariesByFatherId(arrangment);

        String mubanPath = "D:/SC_SCHOOL.xls";
        Workbook wb = Workbook.getWorkbook(new File(mubanPath));
        File targetFile = new File("D:/tar.xls");
        WritableWorkbook wwb = Workbook.createWorkbook(targetFile, wb);
        WritableSheet wws = wwb.getSheet(0);
        for(int i = 1; i < wws.getRows(); i++){
            String createdate = wws.getCell(6, i).getContents();
            if(!StringUtils.isBlank(createdate)){
                String out = createdate.substring(createdate.length() - 4);
                WritableCell cc = new Label(6, i, out);
                wws.addCell(cc);
            }
        }

        wwb.write();
        wwb.close();*/
        /*DataMap zmajor = new DataMap();
        zmajor.put("CODE", "ZMAJOR");
        zmajor = dictionaryService.getDictionaryByCode(zmajor);
        List<DataMap> zmajors = dictionaryService.getDictionariesByFatherId(zmajor);
        for(DataMap zmajorObj : zmajors) {
            List<DataMap> zmajorChilds = dictionaryService.getDictionariesByFatherId(zmajorObj);
            for(DataMap zmajorChild : zmajorChilds) {
                List<DataMap> zmajorChildsChilds = dictionaryService.getDictionariesByFatherId(zmajorChild);
                for(DataMap zmajorChildsChild: zmajorChildsChilds) {
                    zmajorChildsChild.put("CODE", zmajorChildsChild.getString("CODE").trim());
                    dictionaryService.updateDictionary(zmajorChildsChild);
                    DataMap param = new DataMap();
                    param.put("DIC_ID", ShortUUID.randomUUID());
                    param.put("NAME", zmajorChildsChild.getString("NAME"));
                    param.put("PARENT_ID", zmajorChildsChild.getString("DIC_ID"));
                    param.put("CODE", zmajorChildsChild.getString("CODE").substring(0, zmajorChildsChild.getString("CODE").length() - 1));
                    param.put("SORT", 1);
                    param.put("LEVEL", 5);
                    dictionaryService.addDictionary(param);
                }
            }
        }*/

        return InvokeResult.success();
    }
}
