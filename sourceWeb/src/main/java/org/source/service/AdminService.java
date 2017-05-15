package org.source.service;

import org.source.entity.Admin;

/**
 * Created by yelei on 17-5-4.
 */
public interface AdminService {
    public Integer addAdmin(Admin admin);
    public Admin selectAdmin(String adminName);
    public Admin selectByName(String adminName);
    public Integer updateById(Admin admin);
    public Integer updateNikeName(Admin admin);
}
