package com.cms4j.plant.util;

import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class CardExcelView extends AbstractXlsView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String excelName = ShortUUID.randomUUID() + ".xls";
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(excelName,"utf-8"));
        response.setContentType("application/ms-excel; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        @SuppressWarnings("unchecked")
        List<DataMap> datas = (List<DataMap>) map.get("datas");
        Sheet sheet = workbook.createSheet("User Detail");
        sheet.setDefaultColumnWidth(30);
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.BLUE.index);
        style.setFillPattern((short) 1);
        font.setBold(true);
        font.setColor(HSSFColor.WHITE.index);
        style.setFont(font);
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("卡号");
        header.getCell(0).setCellStyle(style);
        header.createCell(1).setCellValue("密码");
        header.getCell(1).setCellStyle(style);
        header.createCell(2).setCellValue("到期时间");
        header.getCell(2).setCellStyle(style);
        header.createCell(3).setCellValue("地区");
        header.getCell(3).setCellStyle(style);
        header.createCell(4).setCellValue("类型");
        header.getCell(4).setCellStyle(style);
        header.createCell(5).setCellValue("用途");
        header.getCell(5).setCellStyle(style);
        header.createCell(6).setCellValue("是否销售");
        header.getCell(6).setCellStyle(style);
        header.createCell(7).setCellValue("是否使用");
        header.getCell(7).setCellStyle(style);
        int rowCount = 1;
        for (DataMap data : datas) {
            Row userRow = sheet.createRow(rowCount++);
            userRow.createCell(0).setCellValue(data.getString("PROVINCE_ID") + data.getString("TYPE_ID") + data.getString("PURPOSE_ID") + data.getString("NUMBER"));
            userRow.createCell(1).setCellValue(data.getString("PASSWORD"));
            userRow.createCell(2).setCellValue(DateUtil.date2Str((Date) data.get("OVERDUETIME"), "yyyy-MM-dd"));
            userRow.createCell(3).setCellValue(data.getString("PROVINCE_VALUE"));
            userRow.createCell(4).setCellValue(data.getString("TYPE_VALUE"));
            userRow.createCell(5).setCellValue(data.getString("PURPOSE_VALUE"));
            if((boolean) data.get("ISSALED"))
                userRow.createCell(6).setCellValue("是");
            else
                userRow.createCell(6).setCellValue("否");
            if((boolean) data.get("ISUSED"))
                userRow.createCell(7).setCellValue("是");
            else
                userRow.createCell(7).setCellValue("否");
        }
    }
}
