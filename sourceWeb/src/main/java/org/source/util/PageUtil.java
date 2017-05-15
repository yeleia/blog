package org.source.util;

/**
 * Created by yelei on 17-4-16.
 */

//totalNum:记录总数，currentPage:当前页面，pageSiza:每页大小
public class PageUtil {
    public static String pagination(long totalNum,int currentPage,int pageSize){
        long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
        StringBuffer pageCode = new StringBuffer();
        if (totalNum==0){
            return "没有数据";
        }else {
            if (currentPage == 1){
                pageCode.append("<li class=\"disabled\"><a href='#'>"+"上一页"+"</a></li>");
            }else {
                pageCode.append("<li><a href=/search?page=" + (currentPage - 1) + ">"+"上一页"+"</a></li>");
            }
                if (totalPage<=5){
                    for (int i=1;i<=totalPage;i++){
                        if (i==currentPage){
                            pageCode.append("<li class=\"active\"><a href='#'>"+i+"</a></li>");
                        }else {
                            pageCode.append("<li><a href=/search?page="+i+">"+i+"</a></li>");
                        }

                    }if (currentPage==totalPage){
                        pageCode.append("<li class=\"disabled\"><a href='#'>" + "下一页" + "</a></li>");
                    }else {
                        pageCode.append("<li><a href=search?page=" + (currentPage + 1) + ">" + "下一页" + "</a></li>");
                    }
                }else {
                    if (currentPage>3){
                        for (int i=1;i<=5;i++){
                            if (currentPage-3+i==currentPage){
                                pageCode.append("<li class=\"active\"><a href='#'>"+currentPage+"</a></li>");
                            }else {
                                pageCode.append("<li><a href=/search?page=" + ((currentPage - 3) + i) + ">" + ((currentPage - 3) + i) + "</a></li>");
                            }
                        }
                        if ((currentPage+2)==totalPage){
                            pageCode.append("<li class=\"disabled\"><a href='#'>"+"下一页"+"</a></li>");
                        }else {
                            pageCode.append("<li><a href=/search?page=" + (currentPage + 1) + ">"+"下一页"+"</a></li>");
                        }
                    }else {
                      /*  pageCode.append("<li class=\"disabled\"><a href='#'"+"上一页"+"</a></li>");*/
                        for (int i=1;i<=5;i++){
                            if (i==currentPage){
                                pageCode.append("<li class=\"active\"><a href='#'>"+i+"</a></li>");
                            }else {
                                pageCode.append("<li><a href=/search?page=" + i + ">" + i + "</a></li>");
                            }
                        }
                        pageCode.append("<li><a href=/search?page="+(currentPage+1)+">"+"下一页"+"</a></li>");
                        System.out.println(currentPage+1);


                    }

                }



            }
            return pageCode.toString();
        }


    }

