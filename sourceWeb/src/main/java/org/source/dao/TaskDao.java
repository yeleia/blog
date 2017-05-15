package org.source.dao;

import org.source.entity.Task;

import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
public interface TaskDao {
    public Integer addTask(Task task);
    public List<Task> selectTask();
    public Task selectById(Integer id);
    public Integer updateTask(Task task);
    public Integer deleteTask(Integer id);
}
