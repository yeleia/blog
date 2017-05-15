package org.source.entity;

import java.util.Date;

/**
 * Created by yelei on 17-5-4.
 */
public class Task {
    private Integer id;
    private String adminName;//管理员名字
    private String title;//任务题目
    private Date pushTime;//发布任务时间
    private Date endTime;//截至时间
    private String template;//任务模板，可以为空

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getPushTime() {
        return pushTime;
    }

    public void setPushTime(Date pushTime) {
        this.pushTime = pushTime;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
