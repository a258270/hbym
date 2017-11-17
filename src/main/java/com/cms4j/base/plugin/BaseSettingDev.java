package com.cms4j.base.plugin;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * description: 加载自定义配置
 *
 * @author: zmj
 * @create: 2017/5/30
 */
@Component
@Profile("dev")
public class BaseSettingDev extends BaseSettingBase implements BaseSetting {
    private String sc_head;
    private String kindfile_path;
    private String upload_path;
    private String scvideo_path;
    private String scimage_path;

    public BaseSettingDev() {
        this.sc_head = "c:/sc_head";
        this.kindfile_path = "c:/kindfile_path";
        this.upload_path = "c:/upload_path";
        this.scvideo_path = "c:/sc_video";
        this.scimage_path = "c:/sc_image";
    }

    public String getSc_head() {
        return sc_head;
    }

    public void setSc_head(String sc_head) {
        this.sc_head = sc_head;
    }

    public String getKindfile_path() {
        return kindfile_path;
    }

    public void setKindfile_path(String kindfile_path) {
        this.kindfile_path = kindfile_path;
    }

    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
    }

    public String getScvideo_path() {
        return scvideo_path;
    }

    public void setScvideo_path(String scvideo_path) {
        this.scvideo_path = scvideo_path;
    }

    public String getScimage_path() {
        return scimage_path;
    }

    public void setScimage_path(String scimage_path) {
        this.scimage_path = scimage_path;
    }
}
