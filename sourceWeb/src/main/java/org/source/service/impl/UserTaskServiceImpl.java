package org.source.service.impl;

import org.source.dao.UserTaskDao;
import org.source.entity.UserTask;
import org.source.service.UserTaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-5.
 */
@Service("/userTaskService")
public class UserTaskServiceImpl implements UserTaskService{
    @Resource
    private UserTaskDao userTaskDao;
    public UserTask selectById(Integer id){
        return userTaskDao.selectById(id);
    }
    public List<UserTask> selectAll(String userName){
        return userTaskDao.selectAll(userName);
    }
    public Integer addUserTask(UserTask userTask){
        return userTaskDao.addUserTask(userTask);
    }
    public Integer updateUserTask(UserTask userTask){
        return userTaskDao.updateUserTask(userTask);
    }
    public List<UserTask> selectByTaskId(Integer id){
        return userTaskDao.selectByTaskId(id);
    }
    public Integer deleteTask(Integer id){
        return userTaskDao.deleteTask(id);
    }
}
