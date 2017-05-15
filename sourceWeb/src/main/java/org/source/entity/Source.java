package org.source.entity;

/**
 * Created by yelei on 17-5-5.
 */
public class Source {
    private Integer id;
    private String userName;
    private String sourseName;
    private String souceUrl;

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

    public String getSourseName() {
        return sourseName;
    }

    public void setSourseName(String sourseName) {
        this.sourseName = sourseName;
    }

    public String getSouceUrl() {
        return souceUrl;
    }

    public void setSouceUrl(String souceUrl) {
        this.souceUrl = souceUrl;
    }
}
