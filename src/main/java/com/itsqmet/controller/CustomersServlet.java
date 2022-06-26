package com.itsqmet.controller;

// @author mrmango

import com.itsqmet.dao.CustomerDAO;
import com.itsqmet.model.Customer;
import static com.itsqmet.controller.utils.showToast;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Customer", urlPatterns = "/Customer")
public class CustomersServlet extends HttpServlet {
    String root = "/customer.jsp";
    // GET = http://localhost:8080/POOII_JSF_war_exploded/CustomersS?crud=sel&txtBuscar=

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // doGet(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        try {
            String name = request.getParameter("name");
            String ruc = request.getParameter("ruc");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");
            Customer cs = new Customer(name, ruc, contact, address);
            RequestDispatcher rd = showToast(request,root,new CustomerDAO().create(cs));
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    private void read(HttpServletRequest request, HttpServletResponse response) {
        try {
            String search = request.getParameter("search");
            String[] customerHeader = {"ID", "Nombres", "RUC", "Contacto", "Direccion"};
            ArrayList<String> customerTbl = new ArrayList<>();
            List<Customer> customerList = new CustomerDAO().get(search);
            for (Customer cs : customerList) {
                customerTbl.add("<tr>");
                customerTbl.add("<td>" + cs.getId() + "</td>");
                customerTbl.add("<td>" + cs.getName() + "</td>");
                customerTbl.add("<td>" + cs.getRuc() + "</td>");
                customerTbl.add("<td>" + cs.getContact() + "</td>");
                customerTbl.add("<td>" + cs.getAddress() + "</td>");
                customerTbl.add("</tr>");
            }
            customerTbl.add("<script>showReadModal()</script>");
            request.setAttribute("tHeader", customerHeader);
            request.setAttribute("tBody", customerTbl);
            RequestDispatcher rd = request.getRequestDispatcher(root);
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("ID"));
            String name = request.getParameter("name");
            String ruc = request.getParameter("ruc");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");
            Customer cs = new Customer(id, name, ruc, contact, address);
            RequestDispatcher rd = showToast(request,root,new CustomerDAO().update(cs));
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("ID"));
            RequestDispatcher rd = showToast(request,root,new CustomerDAO().delete(id));
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }
}
