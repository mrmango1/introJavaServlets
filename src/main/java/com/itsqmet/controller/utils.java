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
}
