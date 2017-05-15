package org.source.dao;

import org.source.entity.Source;

import java.util.List;

/**
 * Created by yelei on 17-5-5.
 */
public interface SourceDao {
    public Integer insertSource(Source source);
    public List<Source> selectAll();
    public Source selectById(Integer id);
    public Integer deleteSource(Integer id);
}
