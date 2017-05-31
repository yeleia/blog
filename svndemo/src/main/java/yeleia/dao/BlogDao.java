package yeleia.dao;


import yeleia.entity.Blog;

import java.util.List;
import java.util.Map;

/**
 * Created by yelei on 17-5-7.
 */
public interface BlogDao {
    public Integer addBlog(Blog blog);
    public Long getTotal();
    public List<Blog> selectAll(Map<String,Object> map);
    public List<Blog> selectBlog();
    public Blog selectBlogById(Integer id);
    public Integer updateBlog(Blog blog);
    public Integer deleteBlogById(Integer id);
    public Integer selectByType(String blogType);
    public List<Blog> select(Map<String,Object> map);
    public Integer getTotleByType(String blogType);
    public Integer selectN();
    public Integer updateType(String blogType);
}
