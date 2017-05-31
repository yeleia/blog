package yeleia.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import yeleia.entity.User;
import yeleia.service.UserService;

import javax.annotation.Resource;

/**
 * Created by yelei on 17-5-9.
 */
@Controller
public class UserContrller {
    @Resource
    private UserService userService;
    @RequestMapping("/login")
    public String hh(User user){
        Subject subject= SecurityUtils.getSubject();
        User user1=userService.getByUserName(user.getUserName());
        if (user1!=null){
            UsernamePasswordToken token=new UsernamePasswordToken(user.getUserName(),user1.getPassword());
            try {
                subject.login(token);
                return "redirect:/addBlogPage";
            }catch (Exception e){
                return "login";
            }
        }else {
            return "login";
        }
    }
}


