package org.source.service;

import org.source.entity.User;

import java.util.List;

/**
 * Created by yelei on 17-5-3.
 */
public interface UserService {
    public User getByUserName(String userName);
    public Integer registerUser(User user);
    public Integer updateFileCount(User user);
    public List<User> selectAndSortByName(User user);
    public List<User> selectAndSortByFileCount(User user);
    public List<User> selectAndSortByProjectCount(User user);
    public List<User> selectAndSortByIntegration(User user);
    public Integer deleteUser(String userName);
    public User selectById(Integer id);
    public Integer updateInfo(User user);
    public Integer updatePa(User user);
    public Integer updateIntegration(User user);
    public Integer addProjectCount(User user);
    public List<User> selectAllUser();
    public Integer deleteById(Integer id);
}
