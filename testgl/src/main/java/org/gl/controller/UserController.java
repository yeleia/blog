package org.gl.controller;

import org.gl.Dao.UserDao;
import org.gl.model.ResponseUtil;
import org.gl.model.User;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by yelei on 17-3-10.
 */
@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    private UserDao userDao;
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    @RequestMapping("/add")
    public String addUser(User user, HttpServletRequest request,
                          HttpServletResponse response) throws Exception {



        System.out.println(user.getStartime()+user.getUserName()+user.getEndtime());
        Integer i = userDao.selectCode(user.getCode());

        if (i != 0) {
            System.out.println("jkhhjgjhfdjkgfjdhgd");
            JSONObject result = new JSONObject();
            result.put("success", true);
            ResponseUtil.write(response, result);
            return null;

        } else {
            System.out.println(user.getStatus() + user.getRole());
            User user1 = userDao.addUser(user);
            JSONObject result = new JSONObject();
            result.put("success", false);
            ResponseUtil.write(response, result);
            return null;
        }
    }

    @RequestMapping("/index")
    public ModelAndView selectAll(User user, HttpServletRequest request,
                                  HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();

        List users = userDao.selectAll();
        System.out.println(users + "kkkkkkkk");
        modelAndView.addObject("user", users);
        modelAndView.setViewName("index");


        return modelAndView;
    }

    @RequestMapping("/search")
    public String search(User user, HttpServletResponse response,
                         HttpServletRequest request) throws Exception {
        List<User> users = (List<User>) userDao.select(user);
        response.setContentType("text/html;charset=UTF-8");
        JSONObject result = new JSONObject();
        result.put("users", users);
        ResponseUtil.write(response, result);
        return null;

    }
    @RequestMapping("/delete")
    public String delete(@RequestParam(value="id")String id,User user, HttpServletRequest request, HttpServletResponse response)throws Exception{
        Integer i=userDao.deleteUser(id);
        System.out.println(i+"删除了的哈哈哈呵呵哈哈哈或");

        return "redirect:/index";

    }
    @RequestMapping("/update")
    public String update(User user,  HttpServletResponse response)throws Exception{

            Integer i = userDao.updateUser(user);
            return "redirect:/index";
        }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));

    }

}
