package com.itsqmet.controller;

// @author mrmango

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itsqmet.dao.CustomerDAO;
import com.itsqmet.model.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Customer", urlPatterns = "/Customer")
@MultipartConfig
public class CustomersServlet extends HttpServlet {
  // GET = http://localhost:8080/POOII_JSF_war_exploded/CustomersS?crud=sel&txtBuscar=

  private static final Gson GSON = new GsonBuilder().serializeNulls().create();

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out = response.getWriter();
    String json = GSON.toJson(new CustomerDAO().getAll());
    out.write(json);
    out.flush();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = new Gson().toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Customer cs = new Gson().fromJson(formData, Customer.class);
    if (new CustomerDAO().create(cs)) {
      response.setStatus(HttpServletResponse.SC_CREATED);
    } else {
      response.sendError(HttpServletResponse.SC_CONFLICT);
    }
  }

  public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String formData = new Gson().toJson(request.getParameterMap());
    formData = formData.replaceAll("[\\[\\]]", "");
    Customer cs = new Gson().fromJson(formData, Customer.class);
    if (new CustomerDAO().update(cs)) {
      response.setStatus(HttpServletResponse.SC_OK);
    } else {
      response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
  }

  public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    if (new CustomerDAO().delete(id)) {
      response.setStatus(HttpServletResponse.SC_OK);
    } else {
      response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
  }
}
