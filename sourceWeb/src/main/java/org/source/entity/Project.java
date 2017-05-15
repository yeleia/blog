package org.source.entity;

import java.util.Date;

/**
 * Created by yelei on 17-5-3.
 */
public class Project {
    private Integer id;
    private String userName;//用户名
    private Integer isUser;//用户还是管理员
    private String projectTitle;//课题名
    private Date startTime;//立题时间
    private Date endTime;//结题时间
    private String from;//来源单位
    private double money;//到款经费
    private Integer score;//级别分值
    private Integer mark;  //经费分值
    private String myRole;//本人角色
    private Integer involvement;//参与度
    private Integer integration;//课题积分
    private Integer state;//状态
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getIsUser() {
        return isUser;
    }

    public void setIsUser(Integer isUser) {
        this.isUser = isUser;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public String getMyRole() {
        return myRole;
    }

    public void setMyRole(String myRole) {
        this.myRole = myRole;
    }

    public Integer getInvolvement() {
        return involvement;
    }

    public void setInvolvement(Integer involvement) {
        this.involvement = involvement;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public Integer getIntegration() {
        return integration;
    }

    public void setIntegration(Integer integration) {
        this.integration = integration;
    }


    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
