package org.source.entity;

/**
 * Created by yelei on 17-5-4.
 */
public class Database {
    private Integer id;
    private String title;//资料名称
    private String dateUrl;//上传文件

    public Integer getId(){
        return id;
    }

    public void setId(Integer id){
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDateUrl() {
        return dateUrl;
    }

    public void setDateUrl(String dateUrl) {
        this.dateUrl = dateUrl;
    }
}
