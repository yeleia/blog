package org.source.service.impl;

import org.source.dao.TaskDao;
import org.source.entity.Task;
import org.source.service.TaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
@Service("taskService")
public class TaskServiceImpl implements TaskService {
    @Resource
    private TaskDao taskDao;
    public Integer addTask(Task task){
        return taskDao.addTask(task);
    }
    public List<Task> selectTask(){
        return taskDao.selectTask();
    }
    public Task selectById(Integer id){
        return taskDao.selectById(id);
    }
    public Integer updateTask(Task task){
        return taskDao.updateTask(task);
    }
    public Integer deleteTask(Integer id){
        return taskDao.deleteTask(id);
    }
}
