package org.gl.Dao;

import org.gl.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yelei on 17-3-8.
 */
@Repository
public class UserDao {
    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    //添加新用户
    public User addUser(User user){
        String sql="insert into gl_table (code,userName,status,startime,endtime,role)values(:code,:userName,:status,:startime,:endtime,:role)";
        SqlParameterSource parameterSource=new BeanPropertySqlParameterSource(user);
        namedParameterJdbcTemplate.update(sql,parameterSource);
        return user;
    }
    //根据code查询是否存在该编码
    public int selectCode(String code){

            String sql="select count(*) from gl_table where code=:code";
            SqlParameterSource param=new MapSqlParameterSource("code",code);
            return namedParameterJdbcTemplate.queryForInt(sql,param);

    }
    //查询所有用户显示在表格,返回集合对象
    public List selectAll(){
        String sql="select code,userName,status,role,startime,endtime from gl_table";
        List list=namedParameterJdbcTemplate.getJdbcOperations().query(sql,new BeanPropertyRowMapper(User.class));
        System.out.println(list+"uuuuuuuuuuuuuuuuuuuuuuu");

        return list;

    }
    //模糊查询，编码，名称，注册时段，账号类型
    public Map select(User user){
        String sql="select code,userName,status,role,startime,endtime from gl_table where code like:code";
        SqlParameterSource sqlParameterSource=new MapSqlParameterSource("code","%"+user.getCode()+"%");
        User user1=namedParameterJdbcTemplate.query(sql, (ResultSetExtractor<User>) sqlParameterSource);
        String sql2="select code,userName,status,role,startime,endtime from gl_table where userName like:userName";
        SqlParameterSource sqlParameterSource1=new MapSqlParameterSource("userName","%"+user.getUserName()+"%");
        User user2=namedParameterJdbcTemplate.query(sql2, (ResultSetExtractor<User>) sqlParameterSource1);
        String sql3="select code,userName,status,role,startime,endtime from gl_table where startime<:startime";
        SqlParameterSource sqlParameterSource2=new MapSqlParameterSource("startime",user.getStartime());
        User user3=namedParameterJdbcTemplate.query(sql3, (ResultSetExtractor<User>) sqlParameterSource2);
        String sql4="select code,userName,status,role,startime,endtime from gl_table where endtime>:endtime";
        SqlParameterSource sqlParameterSource3=new MapSqlParameterSource("endtime",user.getEndtime());
        User user4=namedParameterJdbcTemplate.query(sql4, (ResultSetExtractor<User>) sqlParameterSource3);
        String sql5="select code,userName,status,role,startime,endtime from gl_table where role=:role ";
        SqlParameterSource sqlParameterSource4=new MapSqlParameterSource("role",user.getRole());
        User user5=namedParameterJdbcTemplate.query(sql5, (ResultSetExtractor<User>) sqlParameterSource4);
        Map map=new HashMap();
        map.put("user1",user1);
        map.put("user2",user2);
        map.put("user3",user3);
        map.put("user4",user4);
        map.put("user5",user5);
        return map;

    }
    //根据编码删除用户
    public Integer deleteUser(String code){
        String sql="delete from gl_table where code=:code";
        Map map=new HashMap();

        map.put("code",code);
        return namedParameterJdbcTemplate.update(sql,map);

    }
    //根据编码更新用户信息
    public Integer updateUser(User user){
        String sql="update gl_table set code=:code,userName=:userName,status=:status,role=:role,startime=:startime,endtime=:endtime where code=:code";
        SqlParameterSource ps=new BeanPropertySqlParameterSource(user);
        return namedParameterJdbcTemplate.update(sql,ps);

    }

}
