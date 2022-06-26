package com.itsqmet.controller;

// @author mrmango

import com.itsqmet.dao.CustomerDAO;
import com.itsqmet.model.Customer;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Customer", urlPatterns = "/Customer")
public class CustomersServlet extends HttpServlet {

    // GET = http://localhost:8080/POOII_JSF_war_exploded/CustomersS?crud=sel&txtBuscar=

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
            CustomerDAO csDAO = new CustomerDAO();
            boolean resp = csDAO.create(cs);
            if (resp) {
                String success = "<script>successToast()</script>";
                request.setAttribute("resp", success);
            } else {
                String error = "<script>errorToast()</script>";
                request.setAttribute("resp", error);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/customer2.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    private void read(HttpServletRequest request, HttpServletResponse response) {
        try {
            PrintWriter pw = response.getWriter();
            String search = request.getParameter("search");
            String[] customerHeader = {"ID", "Nombres", "RUC", "Contacto", "Direccion"};
            ArrayList<String> customerTbl = new ArrayList<>();
            CustomerDAO csDAO = new CustomerDAO();
            List<Customer> customerList = csDAO.get(search);
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
            RequestDispatcher rd = request.getRequestDispatcher("/customer2.jsp");
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
            String ruc = request.getParameter("ruc");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");
            Customer cs = new Customer(id, name, ruc, contact, address);
            CustomerDAO csDAO = new CustomerDAO();
            boolean resp = csDAO.update(cs);
            if (resp) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Cliente Actualizado');");
                pw.println("location='customer.jsp';");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('No se ha podido actualizar el cliente');");
                pw.println("location='customer.jsp';");
                pw.println("</script>");
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("ID"));
            CustomerDAO csDAO = new CustomerDAO();
            boolean resp = csDAO.delete(id);
            if (resp) {
                String success = "<script>successToast()</script>";
                request.setAttribute("resp", success);
            } else {
                String error = "<script>errorToast()</script>";
                request.setAttribute("resp", error);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/customer2.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }
}
