package com.itsqmet.controller;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itsqmet.dao.SupplierDAO;
import com.itsqmet.model.Supplier;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Supplier", urlPatterns = "/Supplier")
@MultipartConfig
public class SupplierServlet extends HttpServlet {
  private static final Gson GSON = new GsonBuilder().serializeNulls().create();

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out = response.getWriter();
    String json = GSON.toJson(new SupplierDAO().getAll());
    out.write(json);
    out.flush();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = GSON.toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Supplier sp = GSON.fromJson(formData, Supplier.class);
    if (new SupplierDAO().create(sp)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }

  public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = GSON.toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Supplier sp = GSON.fromJson(formData, Supplier.class);
    if (new SupplierDAO().update(sp)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }

  public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    if (new SupplierDAO().delete(id)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
  }

}
