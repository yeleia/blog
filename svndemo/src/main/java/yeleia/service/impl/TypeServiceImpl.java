package yeleia.service.impl;

import org.springframework.stereotype.Service;
import yeleia.dao.TypeDao;
import yeleia.entity.Type;
import yeleia.service.TypeService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yelei on 17-5-16.
 */
@Service("typeService")
public class TypeServiceImpl implements TypeService{
    @Resource
    private TypeDao typeDao;
    public Integer addType(Type type){
        return typeDao.addType(type);
    }
    public List<Type> selectType(){
        return typeDao.selectType();
    }
    public Integer deleteType(Integer id){
        return typeDao.deleteType(id);
    }
    public Type selectById(Integer id){
        return typeDao.selectById(id);
    }
}
