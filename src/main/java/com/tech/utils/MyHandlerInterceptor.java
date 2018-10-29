package com.tech.utils;

import com.tech.common.Const;
import com.tech.pojo.Admin;
import com.tech.pojo.Student;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        StringBuffer url = request.getRequestURL();
        //拦截所有后端请求
        if (url.indexOf("/admin/")>=0||url.indexOf("/manage/")>=0){
            //登录放行
            if (url.indexOf("login")>=0){
                return true;
            }else if(url.indexOf("fileUpload")>0) {
                Object object = request.getSession().getAttribute(Const.CURRENT_USER);
                if (object != null ) {
                    return true;
                } else {
                    request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
                    return false;
                }
            }else{
                Object object = request.getSession().getAttribute(Const.CURRENT_USER);
                if (object instanceof Admin){
                    return true;
                }else {
                    request.setAttribute("message","身份验证过期,请重新登录!");
                    request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
                    return false;
                }
            }
        }else if(url.indexOf("/stu/")>=0) {
            //登录放行
            if (url.indexOf("login")>=0){
                return true;
            }else{
                Object object = request.getSession().getAttribute(Const.CURRENT_USER);
                if (object instanceof Student){
                    return true;
                }else {
                    request.setAttribute("message","身份验证过期,请重新登录! ");
                    request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
                    return false;
                }
            }
        }else{
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
