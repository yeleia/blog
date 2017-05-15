package org.source.entity;

/**
 * Created by yelei on 17-5-3.
 */
public class User {
    private Integer id;
    private String userName;
    private String password;
    private String power;//权限
    private String roler;//角色
    private String nikeName;//昵称
    private String job;//职称
    private String blongs;//所在单位
    private String phone;//联系电话
    private String adress;//现居地址
    private Integer fileCount;//论文数
    private Integer projectCount;//科研数
    private Integer integration;//积分


    public Integer getId(){
        return id;
    }

    public void setId(Integer id){
        this.id = id;
    }

    public String getUserName(){
        return userName;
    }

    public void setUserName(String userName){
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public String getRoler() {
        return roler;
    }

    public void setRoler(String roler) {
        this.roler = roler;
    }

    public String getNikeName() {
        return nikeName;
    }

    public void setNikeName(String nikeName) {
        this.nikeName = nikeName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getBlongs() {
        return blongs;
    }

    public void setBlongs(String blongs) {
        this.blongs = blongs;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public Integer getFileCount() {
        return fileCount;
    }

    public void setFileCount(Integer fileCount) {
        this.fileCount = fileCount;
    }

    public Integer getProjectCount() {
        return projectCount;
    }

    public void setProjectCount(Integer projectCount) {
        this.projectCount = projectCount;
    }

    public Integer getIntegration() {
        return integration;
    }

    public void setIntegration(Integer integration) {
        this.integration = integration;
    }
}
