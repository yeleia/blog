package org.source.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.source.entity.Paper;
import org.source.entity.Project;
import org.source.entity.User;
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
public class UserController {
    AlrtUtil alrtUtil = new AlrtUtil();
/*    CryptographyUtil cryptographyUtil = new CryptographyUtil();*/
    @Resource
    private UserService userService;
    @Resource
    private PaperService paperService;
    @Resource
    private ProjectService projectService;

    @RequestMapping("/userRegister")
    public String register(User user, HttpServletResponse response) throws Exception {
        User user1 = userService.getByUserName(user.getUserName());
        if (user1 != null){
            alrtUtil.setAlert(response, "该用户已经存在", "/tt.jsp");
        } else {
            user.setAdress("null");
            user.setBlongs("null");
            user.setNikeName("null");
            user.setJob("null");
            user.setPower("null");
            user.setPhone("null");
            user.setRoler("null");
            userService.registerUser(user);
            alrtUtil.setAlert(response, "添加用户成功", "/tt.jsp");

        }
        return null;
    }

    @RequestMapping("/login")
    public String login(User user, HttpServletResponse response){
        Subject subject = SecurityUtils.getSubject();
       // String password = cryptographyUtil.md5(user.getPassword(), user.getPassword());
        User user1 = userService.getByUserName(user.getUserName());
        if (user1 != null){
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
            try {

                subject.login(token);
                return "/bc";
            } catch (Exception e){
                alrtUtil.setAlert(response, "请输入正确的密码", "login.jsp");
                return null;
            }
        } else {
            alrtUtil.setAlert(response, "该用户不存在", "login.jsp");
            return null;
        }
    }
    @RequestMapping("/userGl")
    public ModelAndView UserGl(@RequestParam(value = "type",required = false)Integer type, String string,
                               User user, HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        if (string == null){
            string = (String) request.getSession().getAttribute("string");
        } else {
            user.setUserName(string);
        }
        if (type==null){
            type= (Integer) request.getSession().getAttribute("type");
        }
        if (type==null || type==1){
            List<User> users=userService.selectAndSortByName(user);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("users",users);
            modelAndView.setViewName("manageUser");
        }else if (type==2){
            List<User> users=userService.selectAndSortByFileCount(user);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("users",users);
            modelAndView.setViewName("manageUser1");
        }else if (type==3){
            List<User> users=userService.selectAndSortByProjectCount(user);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("users",users);
            modelAndView.setViewName("manageUser2");
        }else {
            List<User> users=userService.selectAndSortByIntegration(user);
            request.getSession().setAttribute("string", string);
            request.getSession().setAttribute("type",type);
            modelAndView.addObject("users",users);
            modelAndView.setViewName("manageUser3");
        }

        return modelAndView;
    }
    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam(value = "userName")String userName){
        userService.deleteUser(userName);
        paperService.deleteByUserName(userName);
        projectService.deleteByUserName(userName);
        return "ad";

    }
    @RequestMapping("/userIn")
    public ModelAndView userIn(){
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user==null){
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.setViewName("login");
            return modelAndView;
        }else {
            User user1 = userService.getByUserName(user.getUserName());
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("user", user1);
            modelAndView.setViewName("userInfo");
            return modelAndView;
        }
    }
    @RequestMapping("/userIndexA")
    public ModelAndView userIndexA() {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user == null) {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("login");
            return modelAndView;
        } else {
            User user1 = userService.getByUserName(user.getUserName());
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("user", user1);
            modelAndView.setViewName("userIndex");

            return modelAndView;
        }
    }
    @RequestMapping("/updateOwn")
    public String updateInfo(@RequestParam(value = "id")Integer id, User user,HttpServletResponse response){
        user.setId(id);
        userService.updateInfo(user);
        alrtUtil.setAlert(response,"修改成功","/gg.jsp");
        return null;
    }
    @RequestMapping("/updatePa")
    public String updatePa(@RequestParam(value = "id")Integer id,User user,HttpServletResponse response){
        user.setId(id);
        System.out.println(id+"xiugai ");
        userService.updatePa(user);
        alrtUtil.setAlert(response,"修改成功","/gg.jsp");
        return null;
    }
    @RequestMapping("/showMe")
    public ModelAndView showMe() {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if (user == null) {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("login");
            return modelAndView;
        } else {
            User user1 = userService.getByUserName(user.getUserName());
            List<Paper> papers = paperService.selectByUserNane(user.getUserName());
            List<Project> projects = projectService.selectByUserName(user.getUserName());
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("user", user1);
            modelAndView.addObject("papers", papers);
            modelAndView.addObject("projects", projects);
            modelAndView.setViewName("database");
            return modelAndView;
        }
    }

}