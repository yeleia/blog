package org.source.dao;

import org.source.entity.Project;

import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
public interface ProjectDao {
    public List<Project> selectAndSortByUserName(Project project);
    public List<Project> selectAndSortByProjectTitle(Project project);
    public List<Project> selectAndSortByStartTime(Project project);
    public List<Project> selectAndSortByScore(Project project);
    public List<Project> selectAndSortByInte(Project project);
    public Integer deleteProject(Integer id);
    public Integer deleteByUserName(String userName);
    public Project selectById(Integer id);
    public Integer addProject(Project project);
    public List<Project> selectByUserName(String userName);
    public Integer updateProject(Project project);
    public Integer deleteById(Integer id);
    public Integer updateProjectState(Integer id);
    public List<Project> selectProject();
    public Project selectByIds(Integer id);
}
