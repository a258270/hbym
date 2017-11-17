package com.cms4j.base.plugin;

public class BaseSettingBase {
    private String title = "铭邦高考志愿网";
    private Integer messageport = 8888;
    private Integer pageNumber = 10;
    private String phone = "0311-69053126";
    private String email = "yz_school@126.com";
    private String address = "河北省石家庄市师大科技园A座1131";
    private String aboutus = "关于我们啊啊啊";

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getMessageport() {
        return messageport;
    }

    public void setMessageport(Integer messageport) {
        this.messageport = messageport;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
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
}
