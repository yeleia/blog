package yeleia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import yeleia.entity.Blog;
import yeleia.entity.Type;
import yeleia.entity.User;
import yeleia.service.BlogService;
import yeleia.service.TypeService;
import yeleia.service.UserService;
import yeleia.util.Filter;
import yeleia.util.PageUtil;
import yeleia.util.Test;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yelei on 17-5-15.
 */
@Controller

public class BlogController {
    @Resource
    private UserService userService;
    @Resource
    private TypeService typeService;
    @Resource
    private BlogService blogService;

    @RequestMapping("/addBlogPage")
    public ModelAndView addBlogPage(){
        List<Type> types = typeService.selectType();
        return new ModelAndView("index", "types", types);
    }

    @RequestMapping("/addBlog")
    public void addBlog(Blog blog, HttpServletRequest request,HttpServletResponse response)throws Exception{
        blog.setBlogDate(Test.getTime());
        blogService.addBlog(blog);
        request.getSession().setAttribute("statue",1);
        /*return "redirect:/addBlogPage";*/
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert('添加成功'); window.location='/toGlBlog' ;window.close();</script>");
        response.getWriter().flush();
    }

    @RequestMapping("/Index")
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page) {
        if (page == null){
            page = 1;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", (page - 1) * 5);
        map.put("end", 5);
         Long count = blogService.getTotal();
        List<Blog> blogs = blogService.selectAll(map);
        for (int i = 0; i < blogs.size(); i++) {
            String a = (blogs.get(i).getBlogContent().replaceAll("&nbsp;", ""));
            System.out.println(a+"a");
            String b = (a.replaceAll("</?[^>]+x>", ""));
            String s= Filter.delHTMLTag(b);
            int len = s.length();
            if (len < 70){
                blogs.get(i).setBlogContent(s);
            } else {
                s = s.substring(0, 70);
                blogs.get(i).setBlogContent(s);
            }
        }
        List<Type> types=typeService.selectType();
        for (int i=0;i<types.size();i++){
            Integer n=blogService.selectByType(types.get(i).getBlogType());
            types.get(i).setCount(n);
        }
        User user = userService.getByUserName("yelei");
        Integer i=blogService.selectN();
        ModelAndView modelAndView = new ModelAndView();
        PageUtil.pagination(count, page, 5);
        modelAndView.addObject("pageCode", PageUtil.pagination(count, page, 5));
        modelAndView.addObject("blogs", blogs);
        modelAndView.addObject("types",types);
        modelAndView.addObject("user", user);
        modelAndView.addObject("i",i);
        modelAndView.setViewName("blog");
        return modelAndView;
    }

    @RequestMapping("/toGlBlog")
    public ModelAndView toGlBlog(){
        List<Blog> blogs = blogService.selectBlog();
        return new ModelAndView("glBlog", "blogs", blogs);
    }
    @RequestMapping("/toUpdateBlog")
    public ModelAndView toUpdateBlog(@RequestParam(value = "id") Integer id){
        List<Type> types = typeService.selectType();
        Blog blog = blogService.selectBlogById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("types", types);
        modelAndView.addObject("blog", blog);
        modelAndView.setViewName("updateBlog");
        return modelAndView;
    }

    @RequestMapping("/updateBlog")
    public String updateBlog(@RequestParam(value = "id") Integer id, Blog blog) {
        blog.setId(id);
        blogService.updateBlog(blog);
        return "redirect:/toUpdateBlog?id="+id ;
    }
    @RequestMapping("/deleteBlog")
    public String deleteBlog(@RequestParam(value = "id")Integer id){
        blogService.deleteBlogById(id);
        return "redirect:/toGlBlog";
    }
    @RequestMapping("/toSeeBlog")
    public ModelAndView toSeeBlog(@RequestParam(value = "id")Integer id){
        Blog blog=blogService.selectBlogById(id);
        return new ModelAndView("seeBlog","blog",blog);
    }
    @RequestMapping("/seeType")
    public ModelAndView seeType(@RequestParam(value = "string")String string,@RequestParam(value = "page",required = false)Integer page){
        if (page==null){
            page=1;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", (page - 1) * 5);
        map.put("end", 5);
        map.put("blogType",string);
        Integer count=blogService.getTotleByType(string);
        List<Blog> blogs=blogService.select(map);
        for (int i = 0; i < blogs.size(); i++) {
            String a = (blogs.get(i).getBlogContent().replaceAll("&nbsp;", ""));
            System.out.println(a+"a");
            String b = (a.replaceAll("</?[^>]+x>", ""));
            String s= Filter.delHTMLTag(b);
            int len = s.length();
            if (len < 70){
                blogs.get(i).setBlogContent(s);
            } else {
                s = s.substring(0, 70);
                blogs.get(i).setBlogContent(s);
            }
        }
        List<Type> types=typeService.selectType();
        for (int i=0;i<types.size();i++){
            Integer n=blogService.selectByType(types.get(i).getBlogType());
            types.get(i).setCount(n);
        }
        Integer i=blogService.selectN();
        User user = userService.getByUserName("yelei");
        ModelAndView modelAndView = new ModelAndView();
        PageUtil.pagination(count, page, 5);
        modelAndView.addObject("pageCode", PageUtil.pagination(count, page, 5));
        modelAndView.addObject("blogs", blogs);
        modelAndView.addObject("types",types);
        modelAndView.addObject("user", user);
        modelAndView.addObject("i",i);
        modelAndView.setViewName("blogType");
        return modelAndView;
    }
    @RequestMapping("/showBlog")
    public ModelAndView showBlog(@RequestParam(value = "id")Integer id){
        Blog blog=blogService.selectBlogById(id);
        return new ModelAndView("singleBlog","blog",blog);
    }
    @RequestMapping("/showBlogByType")
    public ModelAndView showBlogByType(@RequestParam(value = "id")Integer id){
        Blog blog=blogService.selectBlogById(id);
        ModelAndView m=new ModelAndView();
        m.addObject("blog",blog);
        m.setViewName("singleBloga");
        return m;
    }
}
