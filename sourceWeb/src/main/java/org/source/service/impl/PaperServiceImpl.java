package org.source.service.impl;

import org.source.dao.PaperDao;
import org.source.entity.Paper;
import org.source.service.PaperService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
@Service("/paperService")
public class PaperServiceImpl implements PaperService{
    @Resource
    private PaperDao paperDao;
    public List<Paper> getCheck(){
        return paperDao.getCheck();
    }
    public Integer updateState(Integer id){
        return paperDao.updateState(id);
    }
    public Paper selectById(Integer id){
        return paperDao.selectById(id);
    }
    public Integer deleteById(Integer id){
        return paperDao.deleteById(id);
    }
    public List<Paper> selectAndSortByTitle(Paper paper){
        return paperDao.selectAndSortByTitle(paper);
    }
    public List<Paper> selectAndSortByTime(Paper paper){
        return paperDao.selectAndSortByTime(paper);
    }
    public List<Paper> selectAndSortByInt(Paper paper){
        return paperDao.selectAndSortByInt(paper);
    }
    public Integer deleteByUserName(String userName){
        return paperDao.deleteByUserName(userName);
    }
    public Integer addPaper(Paper paper){
        return paperDao.addPaper(paper);
    }
    public List<Paper> selectByUserNane(String userName){
        return paperDao.selectByUserNane(userName);
    }
}
