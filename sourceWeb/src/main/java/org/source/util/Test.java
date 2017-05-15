package org.source.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by yelei on 17-5-4.
 */
public class Test {
    public Date getTime() {

        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String time = format.format(date);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        java.sql.Date sdate = null; //初始化

        try {

            java.util.Date udate = sdf.parse(time);

            sdate = new java.sql.Date(udate.getTime());

            return sdate;


        } catch (ParseException e) {

            e.printStackTrace();
        return null;
        }
    }
    public Date format(Date date){
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String time = format.format(date);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        java.sql.Date sdate = null; //初始化

        try {

            java.util.Date udate = sdf.parse(time);

            sdate = new java.sql.Date(udate.getTime());

            return sdate;

        } catch (ParseException e) {

            e.printStackTrace();
            return null;
        }
    }
}


