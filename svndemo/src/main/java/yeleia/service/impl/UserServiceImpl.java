package yeleia.service.impl;

import org.springframework.stereotype.Service;
import yeleia.dao.UserDao;
import yeleia.entity.User;
import yeleia.service.UserService;

import javax.annotation.Resource;

/**
 * Created by yelei on 17-5-7.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    UserDao userDao;
   public User getByUserName(String userName){
        return userDao.getByUserName(userName);
    }


}
