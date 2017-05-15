package org.source.controller;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.source.entity.Project;
import org.source.entity.ProjectSource;
import org.source.entity.User;
import org.source.service.ProjectService;
import org.source.service.ProjectSourceService;
import org.source.service.UserService;
import org.source.util.AlrtUtil;
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
public class ProjectController {
    Test test=new Test();
    AlrtUtil alrtUtil=new AlrtUtil();
    @Resource
    private ProjectService projectService;
    @Resource
    private UserService userService;
    @Resource
    private ProjectSourceService projectSourceService;

    @RequestMapping("/projectgl")
    public ModelAndView projectgl(@RequestParam(value = "type",required = false)Integer type, String string,
                                  Project project, HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        if (string == null){
            string = (String) request.getSession().getAttribute("string");
        } else {
            project.setUserName(string);
            project.setProjectTitle(string);
        }
        if (type==null){
            type= (Integer) request.getSession().getAttribute("type");
        }
        if (type==null||type==1){
            List<Project> projects=projectService.selectAndSortByUserName(project);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("projects",projects);
            modelAndView.setViewName("manageProject");

        }else if (type==2){
            List<Project> projects=projectService.selectAndSortByProjectTitle(project);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("projects",projects);
            modelAndView.setViewName("manageProject1");
        }else if (type==3){
            List<Project> projects=projectService.selectAndSortByStartTime(project);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("projects",projects);
            modelAndView.setViewName("manageProject2");
        }else if (type==4){
            List<Project> projects=projectService.selectAndSortByScore(project);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("projects",projects);
            modelAndView.setViewName("manageProject3");
        }else {
            List<Project> projects=projectService.selectAndSortByInte(project);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("projects",projects);
            modelAndView.setViewName("manageProject4");
        }
        return modelAndView;
    }
    @RequestMapping("/Ade")
    public String adminDeleteProject(@RequestParam(value = "id")Integer id){
        projectService.deleteProject(id);
        return "cc";

    }
    @RequestMapping("/addProjects")
    public String addProjects(@RequestParam("file") MultipartFile file, ProjectSource projectSource,Project project, HttpServletRequest request, HttpServletResponse response)throws Exception {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user == null) {
            return "login";
        } else {
            String path = request.getSession().getServletContext().getRealPath("/static/projectFile/");
            String testFileName = file.getOriginalFilename();
            String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
            String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
            String fileName = name + "." + prefix;
            File targetFile = new File(path, fileName);
            file.transferTo(targetFile);
            project.setUserName(user.getUserName());
            project.setIsUser(1);
       /* project.setProjectUrl(fileName);*/
            projectService.addProject(project);
            ProjectSource projectSource1 = projectSourceService.selectMax();
            projectSource.setProjectId(projectSource1.getProjectId() + 1);
            projectSource.setUrl(fileName);
            projectSource.setTitle(testFileName);
            projectSource.setSendTime(test.getTime());
            projectSourceService.addProjectUrl(projectSource);
            user.setIntegration(project.getIntegration());
            userService.addProjectCount(user);
            alrtUtil.setAlert(response, "上传成功", "/ab.jsp");
            return null;
        }
    }
    @RequestMapping("/userAddProject")
    public ModelAndView userAddProject(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("addProject");
        return modelAndView;
    }
    @RequestMapping("/toUpdateProject")
    public ModelAndView toUpdateProject(@RequestParam(value = "id",required = false)Integer id,ProjectSource projectSource,
                                        HttpServletRequest request)throws Exception{
        if (id==null){
            id= (Integer) request.getSession().getAttribute("id");
        }
        Project project=projectService.selectById(id);
        projectSource.setProjectId(id);
        List<ProjectSource>projectSources=projectSourceService.selectById(projectSource);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("project",project);
        modelAndView.addObject("projectSources",projectSources);
        modelAndView.setViewName("projectDetail");
        return modelAndView;
    }
    @RequestMapping("/seeProject")
    public ModelAndView seeProject(@RequestParam(value = "id",required = false)Integer id,ProjectSource projectSource,
                                   HttpServletRequest request)throws Exception{
        /*if (id==null){
            id= (Integer) request.getSession().getAttribute("id");
        }*/
        Project project=projectService.selectByIds(id);
       // System.out.println(project.getId()+"hhhhhh");
        projectSource.setProjectId(id);
        List<ProjectSource>projectSources=projectSourceService.selectById(projectSource);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("project",project);
        modelAndView.addObject("projectSources",projectSources);
        modelAndView.setViewName("AdminprojectDetail");
        return modelAndView;
    }
    @RequestMapping("/updateProjects")
    public String modifyProject(@RequestParam(value = "id")Integer id,@RequestParam("file") MultipartFile file,Project project,
                                HttpServletRequest request,HttpServletResponse response)throws Exception{
        project.setId(id);
        String path = request.getSession().getServletContext().getRealPath("/static/projectFile/");
        String testFileName = file.getOriginalFilename();
        String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
        String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
        String fileName = name + "." + prefix;
        File targetFile = new File(path, fileName);
        file.transferTo(targetFile);
        /*project.setProjectUrl(fileName);*/
        Integer i=projectService.updateProject(project);
        System.out.println(i+"修改成功");
        alrtUtil.setAlert(response,"修改成功","/ab.jsp");
        return null;
    }
    @RequestMapping("/deleteProject")
    public String deleteProject(@RequestParam(value = "id")Integer id,HttpServletResponse response)throws Exception{

        projectService.deleteById(id);
        alrtUtil.setAlert(response,"删除成功","/ab.jsp");
        return null;
    }
   @RequestMapping("/Aup")
   public ResponseEntity<byte[]> downProject(@RequestParam(value = "id") Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
       Project project = projectService.selectById(id);
       String filePath = request.getSession().getServletContext().getRealPath("/static/projectFile/")/* + project.getProjectUrl()*/;
       java.io.File file = new java.io.File(filePath);
       HttpHeaders headers = new HttpHeaders();
       String fileName = new String(project.getProjectTitle().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
       headers.setContentDispositionFormData("attachment", fileName);
       headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
       return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
               headers, HttpStatus.CREATED);
   }
   @RequestMapping("/checkProjectsTrue")
   public String checkProjectsTrue(@RequestParam(value = "id")Integer id,User user){
       //User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
       projectService.updateProjectState(id);
       Project project=projectService.selectById(id);
      // System.out.println(project.getIntegration());
       user.setIntegration(project.getIntegration());
       userService.addProjectCount(user);
       return "aa";
   }
   @RequestMapping("/checkProjectsFalse")
   public String checkProjectsFalse(@RequestParam(value = "id")Integer id){
       projectService.deleteById(id);
       return "aa";
   }
   @RequestMapping("/updateProject")
   public String updateProject(@RequestParam(value = "id")Integer id,Project project,HttpServletResponse response){
        project.setId(id);
       projectService.updateProject(project);
       alrtUtil.setAlert(response,"修改成功","/ab");

       return null;
   }

    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat,true));
    }


}
