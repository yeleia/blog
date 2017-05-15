package org.source.controller;

import org.apache.commons.io.FileUtils;
import org.source.entity.Task;
import org.source.entity.UserTask;
import org.source.service.TaskService;
import org.source.service.UserTaskService;
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
public class TaskController {
    Test test=new Test();
    AlrtUtil alrtUtil=new AlrtUtil();
    @Resource
    private TaskService taskService;
    @Resource
    private UserTaskService userTaskService;
    @RequestMapping("/task")
    public ModelAndView task(){
        List<Task> tasks=taskService.selectTask();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("tasks",tasks);
        modelAndView.setViewName("managetask");
        return modelAndView;
    }
    @RequestMapping("/toAddTask")
    public ModelAndView toAddTask(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("relaeseTask");
        return modelAndView;
    }
    @RequestMapping("/addTask")
    public String addTask(@RequestParam("file") MultipartFile file, Task task, HttpServletRequest request,
                 HttpServletResponse response)throws Exception {

        String adminName = (String) request.getSession().getAttribute("adminName");
        if (adminName == null) {
            return "login";
        } else {
            task.setAdminName(adminName);
            String path = request.getSession().getServletContext().getRealPath("/static/taskFile/");
            String testFileName = file.getOriginalFilename();
            String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
            String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
            String fileName = name + "." + prefix;
            File targetFile = new File(path, fileName);
            file.transferTo(targetFile);
            task.setTemplate(fileName);
            task.setPushTime(test.getTime());

            taskService.addTask(task);
            alrtUtil.setAlert(response, "添加任务成功", "/ee.jsp");
            return null;
        }
    }
    @RequestMapping("/downTask")
    public ResponseEntity<byte[]> downFile(@RequestParam(value = "id") Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //System.out.println(id);
        Task task=taskService.selectById(id);
        String filePath = request.getSession().getServletContext().getRealPath("/static/taskFile/") + task.getTemplate();
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(task.getTemplate().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(@RequestParam(value = "id")Integer id){
        ModelAndView modelAndView=new ModelAndView();
        Task task=taskService.selectById(id);
        modelAndView.addObject("task",task);
        modelAndView.setViewName("updateTask");
        return modelAndView;

    }
    @RequestMapping("/updatesTask")
    public String updatesTask(@RequestParam(value = "id")Integer id,Task task,HttpServletResponse response){
        task.setId(id);
        //task.setEndTime(test.format(task.getEndTime()));
        System.out.println(task.getEndTime()+"时间");
        taskService.updateTask(task);
        alrtUtil.setAlert(response,"修改成功","/ee.jsp");
        return null;
    }
    @RequestMapping("/deleteTask")
    public String deleteTask(@RequestParam(value = "id")Integer id){
        taskService.deleteTask(id);

        return "ee";
    }
    @RequestMapping("/seeTask")
    public ModelAndView seeTask(@RequestParam(value = "id",required = false)Integer id,HttpServletRequest request){
       if (id==null){
        id= (Integer) request.getSession().getAttribute("id");
       }
        List<UserTask> userTasks=userTaskService.selectByTaskId(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("userTasks",userTasks);
        modelAndView.setViewName("taskDatil");
        return modelAndView;
    }
    @RequestMapping("/adminDeleteTask")
    public String adminDeleteTask(@RequestParam(value = "id")Integer id,HttpServletRequest request){
        request.getSession().setAttribute("id",id);
        userTaskService.deleteTask(id);
        return "vv";
    }



    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat,true));
    }



}
