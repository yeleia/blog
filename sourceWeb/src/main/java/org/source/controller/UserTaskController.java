package org.source.controller;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.source.entity.Task;
import org.source.entity.User;
import org.source.entity.UserTask;
import org.source.service.TaskService;
import org.source.service.UserTaskService;
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
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by yelei on 17-5-5.
 */
@Controller
@RequestMapping("/")
public class UserTaskController {
    AlrtUtil alrtUtil=new AlrtUtil();
    Test test=new Test();
    @Resource
    private TaskService taskService;
    @Resource
    private UserTaskService userTaskService;
    @RequestMapping("/showTask")
    public ModelAndView selectTask(){
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user==null){
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.setViewName("login");
            return modelAndView;
        }else {
            List<Task> tasks = taskService.selectTask();
            List<Task> taskList = new ArrayList<Task>();
            for (int i = 0; i < tasks.size(); i++) {
                Integer id = tasks.get(i).getId();
                UserTask userTask = userTaskService.selectById(id);
                if (userTask == null) {
                    Task task = taskService.selectById(id);
                    taskList.add(task);
                }
            }


            List<UserTask> userTasks = userTaskService.selectAll(user.getUserName());
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("usesTasks", userTasks);
            modelAndView.addObject("task", taskList);
            modelAndView.setViewName("userTask");
            return modelAndView;
        }
    }
    @RequestMapping("/loadTask")
    public ResponseEntity<byte[]> downFile(@RequestParam(value = "id") Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println(id);
        Task task = taskService.selectById(id);
        String filePath = request.getSession().getServletContext().getRealPath("/static/taskFile/") + task.getTemplate();
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(task.getTitle().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    @RequestMapping("/upTask")
    public String uptask(@RequestParam(value = "id")Integer id, @RequestParam("file") MultipartFile file,UserTask userTask,
                         HttpServletResponse response,HttpServletRequest request)throws Exception {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user == null) {
            return "login";
        } else {
            Task task = taskService.selectById(id);
            userTask.setUserName(user.getUserName());
            userTask.setTaskId(id);
            userTask.setFileName(task.getTitle());
            userTask.setUploadTime(test.getTime());
            String path = request.getSession().getServletContext().getRealPath("/static/taskFile/");
            String testFileName = file.getOriginalFilename();
            String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
            String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
            String fileName = name + "." + prefix;
            File targetFile = new File(path, fileName);
            file.transferTo(targetFile);
            userTask.setFileUrl(fileName);
            userTaskService.addUserTask(userTask);
            alrtUtil.setAlert(response, "上传成功", "/ac.jsp");
            return null;
        }
    }

    @RequestMapping("/deleteUserTask")
    public ResponseEntity<byte[]> deleteUserTask(@RequestParam(value = "id") Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println(id);
        UserTask userTask=userTaskService.selectById(id);
        String filePath = request.getSession().getServletContext().getRealPath("/static/taskFile/") + userTask.getFileUrl();
        java.io.File file = new java.io.File(filePath);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(userTask.getFileUrl().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    @RequestMapping("/updateUserTask")
    public String hhh(@RequestParam(value = "id")Integer id, @RequestParam("file") MultipartFile file,UserTask userTask,
                      HttpServletResponse response,HttpServletRequest request)throws Exception{
        userTask.setUploadTime(test.getTime());
        String path = request.getSession().getServletContext().getRealPath("/static/taskFile/");
        String testFileName = file.getOriginalFilename();
        String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
        String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
        String fileName = name + "." + prefix;
        File targetFile = new File(path, fileName);
        file.transferTo(targetFile);
        userTask.setFileUrl(fileName);
        userTaskService.updateUserTask(userTask);
        alrtUtil.setAlert(response,"上传成功","/ac.jsp");
        return null;
    }

}
