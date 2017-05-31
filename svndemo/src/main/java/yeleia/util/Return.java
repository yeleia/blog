package yeleia.util;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by yelei on 17-5-22.
 */
public class Return {
    public static void hh(HttpServletResponse  response, String string)throws Exception{
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert("+string+");</script>");
        response.getWriter().flush();
    }
    public static void ll(HttpServletResponse response,String string, String dd)throws Exception{
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert("+string+"); window.location="+dd+" ;window.close();</script>");
        response.getWriter().flush();
    }
}
