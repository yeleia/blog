package yeleia.service.impl;

import org.springframework.stereotype.Service;
import yeleia.dao.BlogDao;
import yeleia.entity.Blog;
import yeleia.service.BlogService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by yelei on 17-5-16.
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService{
    @Resource
    private BlogDao blogDao;
    public Integer addBlog(Blog blog){
        return blogDao.addBlog(blog);
    }
    public Long getTotal(){
        return blogDao.getTotal();
    }
    public List<Blog> selectAll(Map<String,Object> map){
        return blogDao.selectAll(map);
    }
    public List<Blog> selectBlog(){
        return blogDao.selectBlog();
    }
    public Blog selectBlogById(Integer id){
        return blogDao.selectBlogById(id);
    }
    public Integer updateBlog(Blog blog){
        return blogDao.updateBlog(blog);
    }
    public Integer deleteBlogById(Integer id){
        return blogDao.deleteBlogById(id);
    }
    public Integer selectByType(String blogType){
        return blogDao.selectByType(blogType);
    }
    public List<Blog> select(Map<String,Object> map){
        return blogDao.select(map);
    }
    public Integer getTotleByType(String blogType){
        return blogDao.getTotleByType(blogType);
    }
    public Integer selectN(){
        return blogDao.selectN();
    }
    public Integer updateType(String blogType){
        return blogDao.updateType(blogType);
    }
}
