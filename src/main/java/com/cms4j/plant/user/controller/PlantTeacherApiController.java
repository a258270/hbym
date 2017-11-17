package com.cms4j.plant.user.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.base.util.*;
import com.cms4j.plant.chat.service.ChatScoreService;
import com.cms4j.plant.chat.service.ChatService;
import com.cms4j.plant.school.service.ScArticleService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.ScImageService;
import com.cms4j.plant.user.service.ScVideoService;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.util.PlantValidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.*;

@RestController
@RequestMapping(value = "/plant/teacher/api")
public class PlantTeacherApiController extends ApiBaseController {
    @Autowired
    private BaseSetting baseSetting;

    @Autowired
    private CompleteTeacherService completeTeacherService;

    @Autowired
    private ChatService chatService;
    @Autowired
    private ScVideoService scVideoService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private ScImageService scImageService;
    @Autowired
    private ScArticleService scArticleService;
    @Autowired
    private ChatScoreService chatScoreService;

    @RequestMapping(value = "/basic")
    public InvokeResult basic(@RequestParam(name = "HEADURL", required = false) MultipartFile file) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("NICKNAME"))) return InvokeResult.failure("昵称不能为空！");
        if(!PlantValidUtil.isNickname(dataMap.getString("NICKNAME"))) return InvokeResult.failure(PlantValidUtil.ERROR_MSG_NICKNAME);
        if(StringUtils.isBlank(dataMap.getString("SEX"))) return InvokeResult.failure("性别不能为空！");
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getUpload_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("HEADURL", "/plant/file/download/" + s);
        }
        else{
            DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            if(complete == null){
                dataMap.put("HEADURL", PlantConst.STATIC_IMG_NONE);
            }
            else{
                dataMap.put("HEADURL", complete.getString("HEADURL"));
            }
        }

        if(!StringUtils.isBlank(dataMap.getString("NAMESECRET"))) dataMap.put("NAMESECRET", false); else dataMap.put("NAMESECRET", true);
        if(!StringUtils.isBlank(dataMap.getString("BIRTHDAYSECRET"))) dataMap.put("BIRTHDAYSECRET", false); else dataMap.put("BIRTHDAYSECRET", true);
        if(!StringUtils.isBlank(dataMap.getString("SEXSECRET"))) dataMap.put("SEXSECRET", false); else dataMap.put("SEXSECRET", true);
        dataMap.put("USER_ID", curUser.getString("USER_ID"));

        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        if (complete == null) {
            completeTeacherService.addCompleteTeacher(new DataMap());
        }

        completeTeacherService.editCompleteTeacher(dataMap);

        SessionUtil.addComplete2Session(completeTeacherService.getCompleteTeacherByUserId(curUser));

        return InvokeResult.success();
    }

    @RequestMapping(value = "/getpersons")
    public InvokeResult getPersons() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();

        Page page = new Page();
        Map params = new HashMap();
        if(StringUtils.isBlank(dataMap.getString("NAME")))
            dataMap.put("NAME", null);
        params.put("NAME", dataMap.getString("NAME"));
        params.put("USER_ID", curUser.getString("USER_ID"));
        page.setParams(params);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        List<DataMap> results = chatService.getStudentChatInfos(page);
        if(results == null) results = new ArrayList<>();
        for(DataMap result : results) {
            DataMap param = new DataMap();
            param.put("STUDENT_ID", result.getString("RUSER_ID"));
            param.put("TEACHER_ID", result.getString("SUSER_ID"));
            DataMap score = chatScoreService.getChatScoreByStudentIdAndTeacherId(param);
            if(score == null || StringUtils.isBlank(score.getString("SCORE")))
                result.put("chatscore", "4");
            else
                result.put("chatscore", score.getString("SCORE"));
        }
        page.setResults(results);

        return InvokeResult.success(page);
    }

    @RequestMapping(value = "/upload_video")
    public InvokeResult uploadVideo(@RequestParam(required = false, name = "URL") MultipartFile file) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isVideoSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_VIDEOSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getScvideo_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("URL", "/plant/scvideo/download/" + s);
        }
        else{
            return InvokeResult.failure("请上传视频文件！");
        }

        dataMap.put("USER_ID", curUser.getString("USER_ID"));
        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        dataMap.put("SCHOOL_ID", complete.getString("SCHOOL_ID"));
        scVideoService.addScVideo(dataMap);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/getvideos")
    public Page getVideos() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return new Page();

        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        DataMap params = new DataMap();
        params.put("USER_ID", curUser.getString("USER_ID"));
        page.setParams(params);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(5);

        List<DataMap> videos = scVideoService.getVideos(page);
        page.setResults(videos);
        return page;
    }

    @RequestMapping(value = "/edit_video/{id}")
    public InvokeResult editVideo(@PathVariable String id) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        dataMap.put("VIDEO_ID", id);

        scVideoService.editVideo(dataMap);

        return InvokeResult.success();
    }

    @RequestMapping(value = "removeVideos")
    public InvokeResult removeVideos() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        String[] ids = dataMap.getString("VIDEO_ID").split(",");
        List<String> list = Arrays.asList(ids);
        scVideoService.removeVideos(list);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/management_edit")
    public InvokeResult editManagement(@RequestParam(required = false, name = "HEADURL") MultipartFile file) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        dataMap.put("SCHOOL_ID", complete.getString("SCHOOL_ID"));

        schoolService.editSchoolByTeacher(dataMap);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/upload_image")
    public InvokeResult uploadImage(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getScimage_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("URL", "/plant/scimage/download/" + s);
        }
        else{
            return InvokeResult.failure("请上传图片文件！");
        }

        dataMap.put("USER_ID", curUser.getString("USER_ID"));
        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        dataMap.put("SCHOOL_ID", complete.getString("SCHOOL_ID"));
        scImageService.addScImage(dataMap);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/getimages")
    public Page getImages() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return new Page();

        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        DataMap params = new DataMap();
        params.put("USER_ID", curUser.getString("USER_ID"));
        page.setParams(params);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        List<DataMap> images = scImageService.getImages(page);
        page.setResults(images);
        return page;
    }

    @RequestMapping(value = "/removeImages")
    public InvokeResult removeImages() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        String[] ids = dataMap.getString("IMAGE_ID").split(",");
        List<String> list = Arrays.asList(ids);
        scImageService.removeImages(list);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/getarticles")
    public Page getArticles() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return new Page();

        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        DataMap params = new DataMap();
        params.put("USER_ID", curUser.getString("USER_ID"));
        page.setParams(params);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        List<DataMap> articles = scArticleService.getArticlesByUserId(page);
        page.setResults(articles);
        return page;
    }

    @RequestMapping(value = "/addarticle")
    public InvokeResult addArticle(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getUpload_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("IMGURL", "/plant/file/download/" + s);
        }
        dataMap.put("AUTHOR", curUser.getString("USER_ID"));

        scArticleService.addArticle(dataMap);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/removeArticles")
    public InvokeResult removeArticles() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        String[] ids = dataMap.getString("ARTICLE_ID").split(",");
        List<String> list = Arrays.asList(ids);
        scArticleService.removeArticles(list);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/edit_article/{id}")
    public InvokeResult editArticle(@RequestParam(required = false, name = "IMGURL") MultipartFile file, @PathVariable String id) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();

        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getUpload_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("IMGURL", "/plant/file/download/" + s);
        }

        dataMap.put("ARTICLE_ID", id);
        scArticleService.editArticle(dataMap);

        return InvokeResult.success();
    }
}
