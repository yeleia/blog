package yeleia.entity;

/**
 * Created by yelei on 17-5-7.
 */
public class User {
    private Integer id;
    private String userName;
    private String password;
    private String headImage;
    private String title;
    private String nikeName;

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

    public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public String getHeadImage(){
        return headImage;
    }

    public void setHeadImage(String headImage){
        this.headImage = headImage;
    }

    public String getTitle(){
        return title;
    }

    public void setTitle(String title){
        this.title = title;
    }

    public String getNikeName() {
        return nikeName;
    }

    public void setNikeName(String nikeName) {
        this.nikeName = nikeName;
    }
}
