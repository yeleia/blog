package org.source.util;

import org.source.tool.Alert;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by yelei on 17-4-12.
 */
public class AlrtUtil {
    private Alert alert=new Alert();
    public void setAlert(HttpServletResponse response, String express, String url){
        alert.setAlert(response,express,url);
    }
}
