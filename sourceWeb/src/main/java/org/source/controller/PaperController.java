package org.source.controller;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.source.entity.Paper;
import org.source.entity.Project;
import org.source.entity.User;
import org.source.service.PaperService;
import org.source.service.ProjectService;
import org.source.service.UserService;
import org.source.util.AlrtUtil;
import org.source.util.AsposeUtil;
import org.source.util.Test;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
@Controller
@RequestMapping("/")
public class PaperController {
    AlrtUtil alrtUtil=new AlrtUtil();
    Test test=new Test();
    @Resource
    private PaperService paperService;
    @Resource
    private UserService userService;
    @Resource
    private ProjectService projectService;
    @RequestMapping("/check")
    public ModelAndView check(){
        List<Paper> papers=paperService.getCheck();
        List<Project>projects=projectService.selectProject();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("papers",papers);
        modelAndView.addObject("projects",projects);
        modelAndView.setViewName("checkArtical");
        return modelAndView;
    }
    @RequestMapping("/checkTrue")
    public String checkTrue(@RequestParam(value = "id")Integer id,Paper paper,User user){
        paperService.updateState(id);
        Paper paper1=paperService.selectById(id);
        user.setIntegration(paper1.getIntegration());
        userService.updateFileCount(user);
        return "aa";
    }
    @RequestMapping("/checkfalse")
    public String checkfalse(@RequestParam(value = "id")Integer id){
        paperService.deleteById(id);
       return "aa";
    }
    @RequestMapping("/Agl")
    public ModelAndView Agl(@RequestParam(value = "type",required = false)Integer type,String string,
                            Paper paper,HttpServletRequest request) {
        if (string == null){
            string = (String) request.getSession().getAttribute("string");
        } else {
            paper.setUserName(string);
            paper.setTitle(string);
            paper.setCategory(string);
        }
        if (type==null){
            type= (Integer) request.getSession().getAttribute("type");
        }
        if (type == null || type == 1){
            List<Paper> papers = paperService.selectAndSortByTitle(paper);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            ModelAndView modelAndeView = new ModelAndView();
            modelAndeView.addObject("papers", papers);
            modelAndeView.setViewName("manageArtical");
            return modelAndeView;
        } else if (type == 2){
            List<Paper> papers=paperService.selectAndSortByTime(paper);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            ModelAndView modelAndeView=new ModelAndView();
            modelAndeView.addObject("papers",papers);
            modelAndeView.setViewName("manageArtica2");
            return modelAndeView;
        }else {
            List<Paper> papers=paperService.selectAndSortByInt(paper);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            ModelAndView modelAndeView=new ModelAndView();
            modelAndeView.addObject("papers",papers);
            modelAndeView.setViewName("manageArtical3");
            return modelAndeView;
        }


    }
    @RequestMapping("/downA")
    public ResponseEntity<byte[]> downFile(@RequestParam(value = "id") Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
      //  System.out.println(id);
        Paper paper = paperService.selectById(id);
        String filePath = request.getSession().getServletContext().getRealPath("/static/filesPDF/") + paper.getPaperUrl();
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(paper.getTitle().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    @RequestMapping("/deleteA")
    public String deleteA(@RequestParam(value = "id")Integer id){
        paperService.deleteById(id);
        return "bb";
    }
    @RequestMapping("/deleteB")
    public String deleteB(@RequestParam(value = "id")Integer id){
        paperService.deleteById(id);
        return "ab";
    }
    @RequestMapping("/userAddFile")
    public ModelAndView userAddFile(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("upload");
        return modelAndView;
    }
    @RequestMapping("/upLoadFile")
    public String upLoadFile(@RequestParam("file") MultipartFile file, Paper paper,
                             HttpServletRequest request,HttpServletResponse response)throws Exception {

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user == null) {
            return "login";
        } else {
            paper.setUserName(user.getUserName());
            paper.setIsUser(1);
       /* paper.setDateTime(test.getTime());*/
            paper.setState(0);
            String path = request.getSession().getServletContext().getRealPath("/static/files");
            String pathFilePDF = request.getSession().getServletContext().getRealPath("/static/filesPDF");
            String testFileName = file.getOriginalFilename();
            String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
            String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
            String fileName = name + "." + prefix;
            String fileNamePDF = name + ".pdf";
            paper.setPaperUrl(fileNamePDF);
            if (prefix.equals("pdf")) {
                File targetFile = new File(pathFilePDF, fileNamePDF);
                file.transferTo(targetFile);
            } else {
                File targetFile = new File(path, fileName);
                file.transferTo(targetFile);
            }
            if (prefix.equals("docx") || prefix.equals("doc") || prefix.equals("txt")) {
                AsposeUtil.docToPdf(path + "/" + fileName,
                        pathFilePDF + "/" + name + ".pdf");

            }
            paperService.addPaper(paper);//添加论文
           /* User user1=userService.getByUserName(user.getUserName());
            user1.setIntegration(user1.getIntegration()+paper.getIntegration());
            user1.setFileCount(user1.getFileCount()+1);
        System.out.println(user1.getIntegration()+user.getFileCount());
           userService.updateFileCount(user1);*/
            alrtUtil.setAlert(response, "上传成功", "/ab.jsp");
            return null;
        }
    }
    @RequestMapping("/detail")
    public ModelAndView detail(@RequestParam(value = "id")Integer id){
        Paper paper=paperService.selectById(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("paper",paper);
        modelAndView.setViewName("detail");
        return modelAndView;

    }
    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat,true));
    }


}
