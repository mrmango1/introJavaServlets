package com.itsqmet.controller;

// @author mrmango

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itsqmet.dao.ProductDAO;
import com.itsqmet.model.Product;

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

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out = response.getWriter();
    String json = GSON.toJson(new ProductDAO().getAll());
    out.write(json);
    out.flush();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = GSON.toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Product pd = GSON.fromJson(formData, Product.class);
    if (new ProductDAO().create(pd)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }

  public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = GSON.toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Product pd = GSON.fromJson(formData, Product.class);
    if (new ProductDAO().update(pd)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }

  public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    if (new ProductDAO().delete(id)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }
}
