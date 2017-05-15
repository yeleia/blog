package org.source.service.impl;

import org.source.dao.ProjectSourceDao;
import org.source.entity.ProjectSource;
import org.source.service.ProjectSourceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-8.
 */
@Service("/projectSourceService")
public class ProjectSourceServiceImpl implements ProjectSourceService {
@Resource
    private ProjectSourceDao projectSourceDao;
    public Integer addProjectUrl(ProjectSource projectSource){
        return projectSourceDao.addProjectUrl(projectSource);
    }
    public ProjectSource selectMax(){
        return projectSourceDao.selectMax();
    }
    public List<ProjectSource> selectById(ProjectSource projectSource){
        return projectSourceDao.selectById(projectSource);
    }
    public ProjectSource selectByProId(Integer id){
        return projectSourceDao.selectByProId(id);
    }
    public Integer deleteById(Integer id){
        return projectSourceDao.deleteById(id);
    }
    public ProjectSource selectByProjectId(Integer id){
        return projectSourceDao.selectByProjectId(id);
    }
}
