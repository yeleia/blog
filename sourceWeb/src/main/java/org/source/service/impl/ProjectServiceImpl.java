package org.source.service.impl;

import org.source.dao.ProjectDao;
import org.source.entity.Project;
import org.source.service.ProjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
    @Resource
    private ProjectDao projectDao;
    public List<Project> selectAndSortByUserName(Project project){
        return projectDao.selectAndSortByUserName(project);
    }
    public List<Project> selectAndSortByProjectTitle(Project project){
        return projectDao.selectAndSortByProjectTitle(project);
    }
    public List<Project> selectAndSortByStartTime(Project project){
        return projectDao.selectAndSortByStartTime(project);
    }
    public List<Project> selectAndSortByScore(Project project){
        return projectDao.selectAndSortByScore(project);
    }
    public List<Project> selectAndSortByInte(Project project){
        return projectDao.selectAndSortByInte(project);
    }
    public Integer deleteProject(Integer id){
        return projectDao.deleteProject(id);
    }
    public Integer deleteByUserName(String userName){
        return projectDao.deleteByUserName(userName);
    }
    public Project selectById(Integer id){
        return projectDao.selectById(id);
    }
    public Integer addProject(Project project){
        return projectDao.addProject(project);
    }
    public List<Project> selectByUserName(String userName){
        return projectDao.selectByUserName(userName);
    }
    public Integer updateProject(Project project){
        return projectDao.updateProject(project);
    }
    public Integer deleteById(Integer id){
        return projectDao.deleteById(id);
    }
    public Integer updateProjectState(Integer id){
        return projectDao.updateProjectState(id);
    }
    public List<Project>selectProject(){
        return projectDao.selectProject();
    }
    public Project selectByIds(Integer id){
        return projectDao.selectByIds(id);
    }
}
