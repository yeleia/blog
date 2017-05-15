package org.source.controller;

import org.apache.commons.io.FileUtils;
import org.source.entity.ProjectSource;
import org.source.service.ProjectSourceService;
import org.source.util.AlrtUtil;
import org.source.util.Test;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Calendar;

/**
 * Created by yelei on 17-5-8.
 */
@Controller
@RequestMapping("/")
public class ProjectSourceController {
    AlrtUtil alrtUtil=new AlrtUtil();
    Test test = new Test();
    @Resource
    private ProjectSourceService projectSourceService;

    @RequestMapping("/addFiles")
    public String addProjects(@RequestParam("file") MultipartFile file, @RequestParam(value = "id") Integer id, ProjectSource projectSource,
                              HttpServletRequest request, HttpServletResponse response) throws Exception {
        String path = request.getSession().getServletContext().getRealPath("/static/projectFile/");
        String testFileName = file.getOriginalFilename();
        String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
        String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
        String fileName = name + "." + prefix;
        File targetFile = new File(path, fileName);
        file.transferTo(targetFile);
        projectSource.setSendTime(test.getTime());
        projectSource.setProjectId(id);
        projectSource.setTitle(testFileName);
        projectSource.setUrl(fileName);
        projectSourceService.addProjectUrl(projectSource);
        request.getSession().setAttribute("id", id);
        alrtUtil.setAlert(response,"添加成功","/av.jsp");
        return null;
    }

    @RequestMapping("/upProject")
    public ResponseEntity<byte[]> downSource(@RequestParam(value = "id") Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ProjectSource projectSource = projectSourceService.selectByProId(id);
        String filePath = request.getSession().getServletContext().getRealPath("/static/projectFile/") + projectSource.getUrl();
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(projectSource.getTitle().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);

    }
    @RequestMapping("/deleteProjectSource")
    public String deleteProjectSource(@RequestParam(value = "id")Integer id,@RequestParam(value = "projectId")Integer projectId,
                                      HttpServletRequest request){
        projectSourceService.deleteById(id);
        request.getSession().setAttribute("id",projectId);

        return "av";
    }
}
