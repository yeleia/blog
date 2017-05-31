package yeleia.dao;


import yeleia.entity.User;

/**
 * Created by yelei on 17-5-7.
 */
public interface UserDao {
    User getByUserName(String userName);

}
