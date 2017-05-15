package org.source.service;

import org.source.entity.Paper;

import java.util.List;

/**
 * Created by yelei on 17-5-4.
 */
public interface PaperService {
    public List<Paper> getCheck();
    public Integer updateState(Integer id);
    public Paper selectById(Integer id);
    public Integer deleteById(Integer id);
    public List<Paper> selectAndSortByTitle(Paper paper);
    public List<Paper> selectAndSortByTime(Paper paper);
    public List<Paper> selectAndSortByInt(Paper paper);
    public Integer deleteByUserName(String userName);
    public Integer addPaper(Paper paper);
    public List<Paper> selectByUserNane(String userName);
}
