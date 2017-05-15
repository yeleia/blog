package org.source.tool;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintStream;

/**
 * Created by liubo on 17-3-28.
 */
public class Alert {
    public void setAlert(HttpServletResponse response,String express,String url){
        try {
            response.setContentType("text/html; charset=utf-8");
            PrintStream out = new PrintStream(response.getOutputStream());

            out.println("<script language='javascript'>");
            out.println("alert('"+express+"！');" +
                    "window.location.href='"+url+"'");
            out.println("</script>");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void alert(HttpServletResponse response,String title, String text,String type,String reply,String url){
        try {
            response.setContentType("text/html; charset=utf-8");
            PrintStream out = new PrintStream(response.getOutputStream());
            out.println(
                    "\t<link href=\"//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">\n" +
                    "\t<script src=\"//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js\"></script>\n" +
                    "\t<script>\n" +
                    "\t\tswal({\n" +
                    "\t\t\ttitle: '"+title+"',\n" +
                    "\t\t\ttext: '"+text+"',\n" +
                    "\t\t\ttype: '"+type+"',\n" +
                    "\t\t\tconfirmButtonText: '"+reply+"',\n" +
                    "\t\t\t});\t\n" +
                    "\t\twindow.location.href=\""+url+";\n"+
                    "</script>");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
