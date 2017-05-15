package org.source.service.impl;

import org.source.dao.AdminDao;
import org.source.entity.Admin;
import org.source.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by yelei on 17-5-4.
 */
@Service("/adminServiceImpl")
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;
    public Integer addAdmin(Admin admin){
        return adminDao.addAdmin(admin);
    }
    public Admin selectAdmin(String adminName){
        return adminDao.selectAdmin(adminName);
    }
    public Admin selectByName(String adminName){
        return adminDao.selectByName(adminName);
    }
    public Integer updateById(Admin admin){
        return adminDao.updateById(admin);
    }
    public Integer updateNikeName(Admin admin){
        return adminDao.updateNikeName(admin);
    }
}
