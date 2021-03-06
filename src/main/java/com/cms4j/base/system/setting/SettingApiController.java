package com.cms4j.base.system.setting;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

/**
 * Description:
 * Created by zmj on 2017/6/16.
 */
@RestController
@RequestMapping(value = "/admin/setting/api")
public class SettingApiController extends ApiBaseController {
    public SettingApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "1";
    }

    /**
     * 编辑系统设置
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
            return this.interceptorJurisdiction();

        logger.begin("编辑系统设置");
        DataMap dataMap = this.getDataMap();
        String path = ClassUtils.getDefaultClassLoader().getResource("").getPath();
        Properties properties = new Properties();
        InputStream inputStream = new FileInputStream(path+"/setting/base.properties");
        properties.load(inputStream);
        OutputStream outputStream = new FileOutputStream(path+"/setting/base.properties");
        properties.setProperty("base.title", dataMap.getString("title"));
        properties.setProperty("base.pageNumber", dataMap.getString("pageNumber"));
        properties.setProperty("base.sc_head", dataMap.getString("sc_head"));
        properties.setProperty("base.kindfile_path", dataMap.getString("kindfile_path"));
        properties.setProperty("base.upload_path", dataMap.getString("upload_path"));
        properties.setProperty("base.phone", dataMap.getString("phone"));
        properties.setProperty("base.address", dataMap.getString("address"));
        properties.setProperty("base.email", dataMap.getString("email"));
        properties.setProperty("base.aboutus", dataMap.getString("aboutus"));
        properties.setProperty("base.messageport", dataMap.getString("messageport"));
        properties.setProperty("base.scvideo_path", dataMap.getString("scvideo_path"));
        properties.setProperty("base.scimage_path", dataMap.getString("scimage_path"));
        properties.store(outputStream, "Base Settings)");
        logger.end();
        return InvokeResult.success();
    }
}
