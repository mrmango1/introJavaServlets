package com.itsqmet.controller;

// @author mrmango

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itsqmet.dao.CustomerDAO;
import com.itsqmet.dao.ProductDAO;
import com.itsqmet.model.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Product", urlPatterns = "/Product")
@MultipartConfig
public class ProductsServlet extends HttpServlet {

  private static final Gson GSON = new GsonBuilder().serializeNulls().create();
  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    try {
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      PrintWriter pw = response.getWriter();
      String search = request.getParameter("search");
      GsonBuilder builder = new GsonBuilder().serializeNulls();
      Gson gson = builder.create();
      String json = GSON.toJson(new ProductDAO().getAll(search));
      pw.write(json);
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = new Gson().toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Customer cs = new Gson().fromJson(formData, Customer.class);
    if (new CustomerDAO().create(cs)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }
  public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = new Gson().toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Customer cs = new Gson().fromJson(formData, Customer.class);
    if (new CustomerDAO().update(cs)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }

  public void doDelete(HttpServletRequest request, HttpServletResponse response) {
    try {
      int id = Integer.parseInt(request.getParameter("id"));
      if (new CustomerDAO().delete(id)) {
        response.setStatus(HttpServletResponse.SC_CREATED);
      } else {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
      }
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }
}
