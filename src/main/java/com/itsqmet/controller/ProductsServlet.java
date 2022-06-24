package com.itsqmet.controller;

// @author mrmango
import com.itsqmet.dao.ProductDAO;
import com.itsqmet.model.Product;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductsS", urlPatterns = "/ProductsS")
public class ProductsServlet extends HttpServlet {

  // GET = localhost:8080/POOII_JSF/ProductsS?crud=del&txtId=16

  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    String menu = request.getParameter("crud");
    switch (menu) {
      case "create":
        create(request, response);
        break;
      case "read":
        read(request, response);
        break;
      case "update":
        update(request, response);
        break;
      case "delete":
        delete(request, response);
        break;
    }
  }

  private void create(HttpServletRequest request, HttpServletResponse response) {
    try {
      response.setContentType("text/html");
      PrintWriter pw = response.getWriter();
      String name = request.getParameter("name");
      String description = request.getParameter("description");
      int valueP = Integer.parseInt(request.getParameter("valueP"));
      int valueS = Integer.parseInt(request.getParameter("valueS"));
      int stockP = Integer.parseInt(request.getParameter("stock"));
      String iva = request.getParameter("iva");
      String type = request.getParameter("type");
      Product pd = new Product(name, description, valueP, valueS,stockP,iva,type);
      ProductDAO pdDAO = new ProductDAO();
      boolean resp = pdDAO.create(pd);
      if (resp) {
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('Producto Insertado');");
        pw.println("location='productView.jsp';");
        pw.println("</script>");
      } else {
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('No se ha podido ingresar el producto');");
        pw.println("location='productView.jsp';");
        pw.println("</script>");
      }
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }

  private void read(HttpServletRequest request, HttpServletResponse response) {
    try {
      String search = request.getParameter("search");
      ArrayList<String> productTbl = new ArrayList<>();
      ProductDAO pdDAO = new ProductDAO();
      List<Product> productList = pdDAO.get(search);
      for (Product pd: productList) {
        productTbl.add("<tr>");
        productTbl.add("<td>"+pd.getId()+"</td>");
        productTbl.add("<td>"+pd.getName()+"</td>");
        productTbl.add("<td>"+pd.getDescription()+"</td>");
        productTbl.add("<td>"+pd.getValueP()+"</td>");
        productTbl.add("<td>"+pd.getValueS()+"</td>");
        productTbl.add("<td>"+pd.getStock()+"</td>");
        productTbl.add("<td>"+pd.getIva()+"</td>");
        productTbl.add("<td>"+pd.getType()+"</td>");
        productTbl.add("</tr>");
      }
      request.setAttribute("productList", productTbl);
      RequestDispatcher rd = request.getRequestDispatcher("/productView.jsp");
      rd.forward(request, response);
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }

  private void update(HttpServletRequest request, HttpServletResponse response) {
    try {
      response.setContentType("text/html");
      PrintWriter pw = response.getWriter();
      int id = Integer.parseInt(request.getParameter("ID"));
      String name = request.getParameter("name");
      String description = request.getParameter("description");
      int valueP = Integer.parseInt(request.getParameter("valueP"));
      int valueS = Integer.parseInt(request.getParameter("valueS"));
      int stockP = Integer.parseInt(request.getParameter("stock"));
      String iva = request.getParameter("iva");
      String type = request.getParameter("type");
      Product pd = new Product(id, name, description, valueP, valueS,stockP,iva,type);
      ProductDAO pdDAO = new ProductDAO();
      boolean resp = pdDAO.update(pd);
      if (resp) {
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('Producto Actualizado');");
        pw.println("location='productView.jsp';");
        pw.println("</script>");
      } else {
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('No se ha podido actualizar el Producto');");
        pw.println("location='productView.jsp';");
        pw.println("</script>");
      }
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }

  private void delete(HttpServletRequest request, HttpServletResponse response) {
    try {
      response.setContentType("text/html");
      PrintWriter pw = response.getWriter();
      int id = Integer.parseInt(request.getParameter("ID"));
      ProductDAO pdDAO = new ProductDAO();
      boolean resp = pdDAO.delete(id);
      if (resp) {
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('Producto Eliminado');");
        pw.println("location='productView.jsp';");
        pw.println("</script>");
      } else {
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('No se ha podido eliminar el producto');");
        pw.println("location='productView.jsp';");
        pw.println("</script>");
      }
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }
}
