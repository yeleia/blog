package org.gl.model;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by yelei on 16-12-7.
 */
public class ResponseUtil {
    public static void write(HttpServletResponse response,Object o)
            throws Exception{
        response.setContentType("textml;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println(o.toString());
        out.flush();
        out.close();
    }

}
