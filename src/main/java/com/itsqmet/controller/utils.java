package com.itsqmet.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

public class utils {
    static RequestDispatcher showToast(HttpServletRequest request, String root, boolean resp){
        if (resp) {
            String success = "<script>successToast()</script>";
            request.setAttribute("resp", success);
        } else {
            String error = "<script>errorToast()</script>";
            request.setAttribute("resp", error);
        }
        return request.getRequestDispatcher(root);
    }
    static Double emptyDouble(String req){
        if(req.equals("")){
            return 0.0;
        }
        return Double.parseDouble(req);
    }
    static Integer emptyInteger(String req){
        if(req.equals("")){
            return 0;
        }
        return Integer.parseInt(req);
    }
}
