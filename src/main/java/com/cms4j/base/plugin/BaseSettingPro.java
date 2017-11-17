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
@Profile("pro")
public class BaseSettingPro extends BaseSettingBase implements BaseSetting {
    private String title = "铭邦高考志愿网";
    private Integer messageport = 8888;
    private Integer pageNumber = 10;
    private String sc_head;
    private String kindfile_path;
    private String upload_path;
    private String phone = "0311-69053126";
    private String email = "yz_school@126.com";
    private String address = "河北省石家庄市师大科技园A座1131";
    private String aboutus = "关于我们啊啊啊";
    private String scvideo_path;
    private String scimage_path;

    public BaseSettingPro() {
        this.sc_head = "/home/ubuntu/sc_head";
        this.kindfile_path = "/home/ubuntu/kindfile_path";
        this.upload_path = "/home/ubuntu/upload_path";
        this.scvideo_path = "/home/ubuntu/sc_video";
        this.scimage_path = "/home/ubuntu/sc_image";
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAboutus() {
        return aboutus;
    }

    public void setAboutus(String aboutus) {
        this.aboutus = aboutus;
    }

    public Integer getMessageport() {
        return messageport;
    }

    public void setMessageport(Integer messageport) {
        this.messageport = messageport;
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
