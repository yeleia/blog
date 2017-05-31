package yeleia.dao;

import yeleia.entity.Type;

import java.util.List;

/**
 * Created by yelei on 17-5-16.
 */
public interface TypeDao {
    public Integer addType(Type type);
    public List<Type> selectType();
    public Integer deleteType(Integer id);
    public Type selectById(Integer id);
}
