package org.source.service.impl;

import org.source.dao.UserDao;
import org.source.entity.User;
import org.source.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-3.
 */
@Service("/userService")
public class UserServiceImpl implements UserService{
    @Resource
    private UserDao userDao;
    public User getByUserName(String userName){
        return userDao.getByUserName(userName);
    }
    public Integer registerUser(User user){
        return userDao.registerUser(user);
    }
    public Integer updateFileCount(User user){
        return userDao.updateFileCount(user);
    }
    public List<User> selectAndSortByName(User user){
        return userDao.selectAndSortByName(user);
    }
    public List<User> selectAndSortByFileCount(User user){
        return userDao.selectAndSortByFileCount(user);
    }
    public List<User> selectAndSortByProjectCount(User user){
        return userDao.selectAndSortByProjectCount(user);
    }
    public List<User> selectAndSortByIntegration(User user){
        return userDao.selectAndSortByIntegration(user);
    }
    public Integer deleteUser(String userName){
        return userDao.deleteUser(userName);
    }
    public User selectById(Integer id){
        return userDao.selectById(id);
    }
    public Integer updateInfo(User user){
        return userDao.updateInfo(user);
    }
    public Integer updatePa(User user){
        return userDao.updatePa(user);
    }
    public Integer updateIntegration(User user){
        return userDao.updateIntegration(user);
    }
    public Integer addProjectCount(User user){
        return userDao.addProjectCount(user);
    }
    public List<User> selectAllUser(){
        return userDao.selectAllUser();
    }
    public Integer deleteById(Integer id){
        return userDao.deleteById(id);
    }
}
