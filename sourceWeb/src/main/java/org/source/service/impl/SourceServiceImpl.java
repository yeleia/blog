package org.source.service.impl;

import org.source.dao.SourceDao;
import org.source.entity.Source;
import org.source.service.SourceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-5.
 */
@Service("sourceService")
public class SourceServiceImpl implements SourceService{
    @Resource
    private SourceDao sourceDao;
    public Integer insertSource(Source source){
        return sourceDao.insertSource(source);
    }
    public List<Source> selectAll(){
        return sourceDao.selectAll();
    }
    public Source selectById(Integer id){
        return sourceDao.selectById(id);
    }
    public Integer deleteSource(Integer id){
        return sourceDao.deleteSource(id);
    }
}
