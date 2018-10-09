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
            //如果是登录或者是学生上传文件接口 直接放行
            if (url.indexOf("login")>=0||url.indexOf("fileUpload")>0){
                return true;
            }else{
                try {
                    Admin admin = (Admin)request.getSession().getAttribute(Const.CURRENT_USER);
                    if (admin!=null){
                        return true;
                    }else {
                        request.setAttribute("message","身份验证过期,请重新登录!");
                        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
                        return false;
                    }
                }catch (Exception e){
                    request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
                    return false;
                }
            }
        }else if(url.indexOf("/stu/")>=0) {
            if (url.indexOf("login")>=0){
                return true;
            }else{
                try {
                    Student student = (Student) request.getSession().getAttribute(Const.CURRENT_USER);
                    if (student!= null){
                        return true;
                    }else {
                        request.setAttribute("message","身份验证过期,请重新登录! ");
                        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
                        return false;
                    }
                }catch (Exception e){
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
