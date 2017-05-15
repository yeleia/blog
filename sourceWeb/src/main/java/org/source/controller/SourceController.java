package org.source.controller;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.source.entity.Source;
import org.source.entity.User;
import org.source.service.SourceService;
import org.source.service.UserService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Calendar;
import java.util.List;

/**
 * Created by yelei on 17-5-5.
 */
@Controller
@RequestMapping("/")
public class SourceController {
    @Resource
    private UserService userService;
    @Resource
    private SourceService sourceService;
    @RequestMapping("/mySource")
    public ModelAndView mySource(){
       /* User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        User user1=userService.getByUserName(user.getUserName());*/
        List<Source> sources=sourceService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        /*modelAndView.addObject("user",user1);*/
        modelAndView.addObject("sources",sources);
        modelAndView.setViewName("source");
        return modelAndView;
    }
    @RequestMapping("/upSource")
    public String upSource(@RequestParam("file") MultipartFile file, Source source, HttpServletRequest request, HttpServletResponse response)throws Exception {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user == null) {
            return "login";
        } else {
            String path = request.getSession().getServletContext().getRealPath("/static/taskFile/");
            String testFileName = file.getOriginalFilename();
            String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
            String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
            String fileName = name + "." + prefix;
            File targetFile = new File(path, fileName);
            file.transferTo(targetFile);
            //source.setSourseName(testFileName);
            source.setUserName(user.getUserName());
            source.setSouceUrl(fileName);
            sourceService.insertSource(source);
            return "ae";
        }
    }
    @RequestMapping("/downSource")
    public ResponseEntity<byte[]> downSource(@RequestParam(value = "id") Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Source source=sourceService.selectById(id);
        String filePath = request.getSession().getServletContext().getRealPath("/static/taskFile/") + source.getSouceUrl();
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(source.getSourseName().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    @RequestMapping("/deleteSource")
    public String dele(@RequestParam(value = "id")Integer id){
        sourceService.deleteSource(id);
        return "ae";

    }
    @RequestMapping("/adminSource1")
    public ModelAndView adminSource(){
        List<Source> sources=sourceService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("sources",sources);
        modelAndView.setViewName("adminSource");
        return modelAndView;
    }
    @RequestMapping("/upSource11")
    public String upSource11(@RequestParam("file") MultipartFile file, Source source, HttpServletRequest request, HttpServletResponse response)throws Exception{
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user==null){
            return "login";
        }else {
        String path = request.getSession().getServletContext().getRealPath("/static/taskFile/");
        String testFileName = file.getOriginalFilename();
        String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
        String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
        String fileName = name + "." + prefix;
        File targetFile = new File(path, fileName);
        file.transferTo(targetFile);
        //source.setSourseName(testFileName);
        source.setUserName(user.getUserName());
        source.setSouceUrl(fileName);
        sourceService.insertSource(source);
        return "ss";
    }

}}
