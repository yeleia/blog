package org.source.controller;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.*;
import org.source.entity.Paper;
import org.source.entity.Project;
import org.source.entity.User;
import org.source.service.PaperService;
import org.source.service.ProjectService;
import org.source.service.UserService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
@Controller
@RequestMapping("/")
public class ExportController {
    @Resource
    private UserService userService;
    @Resource
    private PaperService paperService;
    @Resource
    private ProjectService projectService;
    @RequestMapping("/exportUser")
    public ResponseEntity<byte[]> export(@RequestParam("checks[]")List<Integer> checks, HttpServletRequest request, RedirectAttributes attributes,
                                         HttpServletResponse response)throws Exception{
        System.out.println(checks.size()+"hhh");

        List<User> userList=new ArrayList<User>();
        for (int i=0;i<checks.size();i++){
            Integer id=checks.get(i).intValue();
            User user=userService.selectById(id);
            userList.add(user);
        }
        /*ExportUtil.createExcel(articlesList);*/
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
        headCell.setCellValue("用户名");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(1);
        headCell.setCellValue("上传论文数");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(2);
        headCell.setCellValue("课题项目数");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(3);
        headCell.setCellValue("业绩积分");
        headCell.setCellStyle(cellStyle);
        //添加数据内容
        for (int i=0;i<userList.size();i++){
            hssfRow=sheet.createRow(i+1);
            User user=userList.get(i);
            //创建单元格，并设置值
            HSSFCell cell=hssfRow.createCell(0);
            cell.setCellValue(user.getUserName());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(1);
            cell.setCellValue(user.getFileCount());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(2);
            cell.setCellValue(user.getProjectCount());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(3);
            cell.setCellValue(user.getIntegration());
            cell.setCellStyle(cellStyle);
        }

        String path = request.getSession().getServletContext().getRealPath("/static/xls/");
        String name=String.valueOf(Calendar.getInstance().getTimeInMillis());
        try {
            OutputStream outputStream=new FileOutputStream(path+name+".xls");
            /*request.setAttribute("url","${pageContext.request.contextPath}/static/xls/");*/

            attributes.addAttribute("url",name+".xls");

            workbook.write(outputStream);
            outputStream.close();

        }catch (IOException e){
            e.printStackTrace();
        }
        String filePath=path+name+".xls";
       // System.out.println(filePath+"文件");
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(filePath.getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
       // System.out.println(fileName+"aa");
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    @RequestMapping("/exportPaper")
    public ResponseEntity<byte[]> exportPsper(@RequestParam("checks[]")List<Integer> checks, HttpServletRequest request, RedirectAttributes attributes,
                                         HttpServletResponse response)throws Exception{

        List<Paper> paperList=new ArrayList<Paper>();
        for (int i=0;i<checks.size();i++){
            Integer id=checks.get(i).intValue();
            Paper paper=paperService.selectById(id);
            paperList.add(paper);
        }
        /*ExportUtil.createExcel(articlesList);*/
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
        headCell.setCellValue("用户名");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(1);
        headCell.setCellValue("论文标题");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(2);
        headCell.setCellValue("期刊名称");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(3);
        headCell.setCellValue("发表时间");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(4);
        headCell.setCellValue("论文类别");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(5);
        headCell.setCellValue("论文积分");
        headCell.setCellStyle(cellStyle);
        //添加数据内容
        for (int i=0;i<paperList.size();i++){
            hssfRow=sheet.createRow(i+1);
            Paper paper=paperList.get(i);
            //创建单元格，并设置值
            HSSFCell cell=hssfRow.createCell(0);
            cell.setCellValue(paper.getUserName());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(1);
            cell.setCellValue(paper.getTitle());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(2);
            cell.setCellValue(paper.getMagazine());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(3);
            cell.setCellValue(paper.getDateTime());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(4);
            cell.setCellValue(paper.getCategory());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(5);
            cell.setCellValue(paper.getIntegration());
            cell.setCellStyle(cellStyle);
        }

        String path = request.getSession().getServletContext().getRealPath("/static/xls/");
        String name=String.valueOf(Calendar.getInstance().getTimeInMillis());
        try {
            OutputStream outputStream=new FileOutputStream(path+name+".xls");
            /*request.setAttribute("url","${pageContext.request.contextPath}/static/xls/");*/

            attributes.addAttribute("url",name+".xls");

            workbook.write(outputStream);
            outputStream.close();

        }catch (IOException e){
            e.printStackTrace();
        }
        String filePath=path+name+".xls";
       // System.out.println(filePath+"文件");
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(filePath.getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
       // System.out.println(fileName+"aa");
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    @RequestMapping("/exportProject")
    public ResponseEntity<byte[]> exportProject(@RequestParam("checks[]")List<Integer> checks, HttpServletRequest request, RedirectAttributes attributes,
                                              HttpServletResponse response)throws Exception{

        List<Project> projectList=new ArrayList<Project>();
        for (int i=0;i<checks.size();i++){
            Integer id=checks.get(i).intValue();
            Project project=projectService.selectById(id);
            projectList.add(project);
        }
        /*ExportUtil.createExcel(articlesList);*/
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
        headCell.setCellValue("用户名");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(1);
        headCell.setCellValue("项目标题");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(2);
        headCell.setCellValue("立题时间");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(3);
        headCell.setCellValue("结题时间");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(4);
        headCell.setCellValue("来源单位");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(5);
        headCell.setCellValue("到款经费");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(6);
        headCell.setCellValue("级别分值");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(7);
        headCell.setCellValue("本人角色");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(8);
        headCell.setCellValue("参与度");
        headCell.setCellStyle(cellStyle);
        headCell=hssfRow.createCell(9);
        headCell.setCellValue("课题积分");
        headCell.setCellStyle(cellStyle);
        //添加数据内容
        for (int i=0;i<projectList.size();i++){
            hssfRow=sheet.createRow(i+1);
            Project project=projectList.get(i);
            //创建单元格，并设置值
            HSSFCell cell=hssfRow.createCell(0);
            cell.setCellValue(project.getUserName());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(1);
            cell.setCellValue(project.getProjectTitle());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(2);
            cell.setCellValue(project.getStartTime());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(3);
            cell.setCellValue(project.getEndTime());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(4);
            cell.setCellValue(project.getFrom());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(5);
            cell.setCellValue(project.getMoney());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(6);
            cell.setCellValue(project.getScore());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(7);
            cell.setCellValue(project.getMyRole());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(8);
            cell.setCellValue(project.getInvolvement());
            cell.setCellStyle(cellStyle);
            cell=hssfRow.createCell(9);
            cell.setCellValue(project.getIntegration());
            cell.setCellStyle(cellStyle);

        }

        String path = request.getSession().getServletContext().getRealPath("/static/xls/");
        String name=String.valueOf(Calendar.getInstance().getTimeInMillis());
        try {
            OutputStream outputStream=new FileOutputStream(path+name+".xls");
            /*request.setAttribute("url","${pageContext.request.contextPath}/static/xls/");*/

            attributes.addAttribute("url",name+".xls");

            workbook.write(outputStream);
            outputStream.close();

        }catch (IOException e){
            e.printStackTrace();
        }
        String filePath=path+name+".xls";
       // System.out.println(filePath+"文件");
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(filePath.getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
       // System.out.println(fileName+"aa");
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }




}
