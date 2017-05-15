package org.source.controller;

import org.source.entity.Admin;
import org.source.entity.Paper;
import org.source.entity.Project;
import org.source.entity.User;
import org.source.service.AdminService;
import org.source.service.PaperService;
import org.source.service.ProjectService;
import org.source.service.UserService;
import org.source.util.AlrtUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
@Controller
@RequestMapping("/")
public class AdminController {
    AlrtUtil alrtUtil=new AlrtUtil();
    @Resource
    private AdminService adminService;
    @Resource
    private UserService userService;
    @Resource
    private PaperService paperService;
    @Resource
    private ProjectService projectService;
    @RequestMapping("/addadmins")
    public ModelAndView addadmins(Admin admin){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("addAdmin");
        return modelAndView;
    }
    @RequestMapping("/adminLogin")
    public String adminLogin(Admin admin, HttpServletResponse response, HttpServletRequest request){
        Admin admin1=adminService.selectAdmin(admin.getAdminName());
        if (admin1!=null){
            if (admin.getPassword().equals(admin1.getPassword())){
                request.getSession().setAttribute("adminName", admin.getAdminName());
                alrtUtil.setAlert(response,"登录成功","/af.jsp");
                return null;
            }else {
                alrtUtil.setAlert(response,"请输入正确的密码","/login.jsp");
                return null;
            }
        }else {
            alrtUtil.setAlert(response,"请输入正确的名字","/login.jsp");
            return null;
        }

    }

    @RequestMapping("/registerAdmin")
    public String registerAdmin(Admin admin,HttpServletResponse response){
        Admin admin1=adminService.selectAdmin(admin.getAdminName());
        if (admin1!=null){
            alrtUtil.setAlert(response,"该管理员名已经存在，请重新输入","/dd.jsp");
            return null;
        }else {
            adminService.addAdmin(admin);
            alrtUtil.setAlert(response,"成功添加管理员","/dd.jsp");
            return null;
        }
    }
    @RequestMapping("/own")
    public ModelAndView own(HttpServletRequest request){
        String name=(String)request.getSession().getAttribute("adminName");
        if (name==null){
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("login");
            return modelAndView;
        }else {
            Admin admin = adminService.selectByName(name);
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("admin", admin);
            modelAndView.setViewName("adminInfo");
            return modelAndView;
        }

    }
    @RequestMapping("/updatePassword")
    public String updatePassword(@RequestParam(value = "id")Integer id,Admin admin){
        admin.setId(id);
        adminService.updateById(admin);
        return "/ff";
    }
    @RequestMapping("/updateNikeName")
    public String updateNikeName(@RequestParam(value = "id")Integer id,Admin admin){
        admin.setId(id);
        adminService.updateNikeName(admin);
        return "/ff";
    }
    @RequestMapping("/adminIndex")
    public ModelAndView adminIndex(HttpServletRequest request){
        String name= (String) request.getSession().getAttribute("adminName");
        if (name==null){
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.setViewName("login");
            return modelAndView;
        }else {
            Admin admin = adminService.selectAdmin(name);
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("admin", admin);
            modelAndView.setViewName("adminIndex");
            return modelAndView;
        }
    }
    @RequestMapping("/addUserso")
    public ModelAndView addUsers(){
        List<User>users=userService.selectAllUser();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("users",users);
        modelAndView.setViewName("addUser");
        return modelAndView;
    }
    @RequestMapping("/userDatile")
    public ModelAndView userDatile(@RequestParam(value = "id", required = false)Integer id,HttpServletRequest request){
        if (id==null){
            id= (Integer) request.getSession().getAttribute("id");
        }
        User user=userService.selectById(id);
        List<Paper> papers=paperService.selectByUserNane(user.getUserName());
        List<Project> projects=projectService.selectByUserName(user.getUserName());
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.addObject("papers",papers);
        modelAndView.addObject("projects",projects);
        modelAndView.setViewName("databaseUser");
        return modelAndView;
    }
    @RequestMapping("/adminDelectP")
    public String adminDelectP(@RequestParam(value = "id")Integer id,HttpServletRequest request){
        Paper paper=paperService.selectById(id);
        User user=userService.getByUserName(paper.getUserName());
        request.getSession().setAttribute("id",user.getId());
        paperService.deleteById(id);
        return "ah";
    }
    @RequestMapping("/AdeleteProject")
    public String AdeleteProject(@RequestParam(value = "id")Integer id,HttpServletRequest request){
        Project project=projectService.selectByIds(id);
        User user=userService.getByUserName(project.getUserName());
        request.getSession().setAttribute("id",user.getId());
        paperService.deleteById(id);
        return "ah";
    }
    @RequestMapping("/deleteUs")
    public String deleteUs(@RequestParam(value = "id")Integer id){
        userService.deleteById(id);
        return "tt";

    }
    @RequestMapping("/updateInformation")
    public ModelAndView updateInformation(@RequestParam(value = "id",required = false)Integer id,HttpServletRequest request){
        if (id==null){
            id= (Integer) request.getSession().getAttribute("id");
        }
        User user=userService.selectById(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.setViewName("updateUserInfo");
        return modelAndView;
    }
    @RequestMapping("/adminToUser")
    public String adminToUser(@RequestParam(value = "id")Integer id,User user,HttpServletRequest request,HttpServletResponse response){
        request.getSession().setAttribute("id",id);
        user.setId(id);
        userService.updateInfo(user);
        alrtUtil.setAlert(response,"修改成功","/hh.jsp");
        return null;
    }

}
