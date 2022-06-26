package com.itsqmet.controller;

// @author mrmango
import com.itsqmet.dao.ProductDAO;
import com.itsqmet.model.Product;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.itsqmet.controller.utils.showToast;

@WebServlet(name = "Product", urlPatterns = "/Product")
public class ProductsServlet extends HttpServlet {

  String root = "/product.jsp";
  // GET = localhost:8080/POOII_JSF/ProductsS?crud=del&txtId=16

  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    switch (request.getParameter("crud")) {
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
      String name = request.getParameter("name");
      String description = request.getParameter("description");
      double valueP = Double.parseDouble((request.getParameter("valueP")));
      double valueS = Double.parseDouble((request.getParameter("valueS")));
      int stockP = Integer.parseInt(request.getParameter("stock"));
      String iva = request.getParameter("iva");
      String type = request.getParameter("type");
      Product pd = new Product(name, description, valueP, valueS,stockP,iva,type);
      RequestDispatcher rd = showToast(request,root,new ProductDAO().create(pd));
      rd.forward(request, response);
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }

  private void read(HttpServletRequest request, HttpServletResponse response) {
    try {
      String search = request.getParameter("search");
      ArrayList<String> productTbl = new ArrayList<>();
      String[] productHeader = {"ID", "Nombre", "Descripcion", "Valor Ref.Compra", "Valor Ref.Venta", "Stock", "Iva", "Tipo"};
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
      productTbl.add("<script>showReadModal()</script>");
      request.setAttribute("tHeader", productHeader);
      request.setAttribute("tBody", productTbl);
      RequestDispatcher rd = request.getRequestDispatcher("/product.jsp");
      rd.forward(request, response);
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }

  private void update(HttpServletRequest request, HttpServletResponse response) {
    try {
      int id = Integer.parseInt(request.getParameter("ID"));
      String name = request.getParameter("name");
      String description = request.getParameter("description");
      double valueP = Double.parseDouble((request.getParameter("valueP")));
      double valueS = Double.parseDouble((request.getParameter("valueS")));
      int stockP = Integer.parseInt(request.getParameter("stock"));
      String iva = request.getParameter("iva");
      String type = request.getParameter("type");
      Product pd = new Product(id, name, description, valueP, valueS,stockP,iva,type);
      RequestDispatcher rd = showToast(request,root,new ProductDAO().update(pd));
      rd.forward(request, response);
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }

  private void delete(HttpServletRequest request, HttpServletResponse response) {
    try {
      int id = Integer.parseInt(request.getParameter("ID"));
      RequestDispatcher rd = showToast(request,root,new ProductDAO().delete(id));
      rd.forward(request, response);
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
  }
}
