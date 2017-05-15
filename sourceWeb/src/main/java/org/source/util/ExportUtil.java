package org.source.util;/*
package org.yl.util;

import org.apache.poi.hssf.usermodel.*;
import org.yl.entity.Article;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

*/
/**
 * Created by yelei on 17-4-30.
 *//*

public class ExportUtil {
    public static void createExcel(List<Article>list){
        //创建一个Excell文件
        HSSFWorkbook workbook=new HSSFWorkbook();
        //创建一个工作表
        HSSFSheet sheet=workbook.createSheet("表");
        //添加表头行
        HSSFRow hssfRow=sheet.createRow(0);
        //设置单元格格式居中
        HSSFCellStyle cellStyle=workbook.createCellStyle();
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //添加表头内容
        HSSFCell headCell=hssfRow.createCell(0);
        headCell.setCellValue("题名");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(1);
        headCell.setCellValue("上传者");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(2);
        headCell.setCellValue("作者");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(3);
        headCell.setCellValue("上传时间");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(4);
        headCell.setCellValue("类别");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(5);
        headCell.setCellValue("被引");
        headCell.setCellStyle(cellStyle);
        //添加数据内容
        for (int i=0;i<list.size();i++){
            hssfRow=sheet.createRow(i+1);
            Article article=list.get(i);
            //创建单元格，并设置值
            HSSFCell cell=hssfRow.createCell(0);
            cell.setCellValue(article.getTitle());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(1);
            cell.setCellValue(article.getUserName());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(2);
            cell.setCellValue(article.getAuthor());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(3);
            cell.setCellValue(new SimpleDateFormat("yyyy-mm-dd").format(article.getDateTime()));
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(4);
            cell.setCellValue(article.getCategory());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(5);
            cell.setCellValue(article.getCsssci());
            cell.setCellStyle(cellStyle);
        }
        try {
            OutputStream outputStream=new FileOutputStream("/home/yelei/文档/" +
                    "1.xls");
            workbook.write(outputStream);
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
*/
