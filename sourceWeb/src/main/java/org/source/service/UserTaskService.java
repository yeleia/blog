package org.source.service;

import org.source.entity.UserTask;

import java.util.List;

/**
 * Created by yelei on 17-5-5.
 */
public interface UserTaskService {
    public UserTask selectById(Integer id);
    public List<UserTask> selectAll(String userName);
    public Integer addUserTask(UserTask userTask);
    public Integer updateUserTask(UserTask userTask);
    public List<UserTask> selectByTaskId(Integer id);
    public Integer deleteTask(Integer id);
}
