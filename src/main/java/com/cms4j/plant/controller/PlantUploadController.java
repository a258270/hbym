package com.cms4j.plant.controller;

import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/7/5
 */
@Controller
@RequestMapping(value = "/plant")
public class PlantUploadController {

    @RequestMapping(value = "/upload")
    public String upload(@RequestParam MultipartFile file) {
        if (file.isEmpty()) {
            return "文件为空";
        }
        // 获取文件名
        String fileName = file.getOriginalFilename();
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        // 文件上传后的路径
        String filePath = ClassUtils.getDefaultClassLoader().getResource("").getPath() + DateUtil.date2Str(DateUtil.getCurrentDate(), "yyyy-MM-dd") + "/";
        // 解决中文问题，liunx下中文路径，图片显示问题
        fileName = ShortUUID.randomUUID() + suffixName;
        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            return "上传成功";
        }
        catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "上传失败";
    }
}
