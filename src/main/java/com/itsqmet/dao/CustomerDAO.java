package com.itsqmet.dao;

import com.itsqmet.config.CBDD;
import com.itsqmet.model.Customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements DAO<Customer> {

  private final CBDD con = new CBDD();

  @Override
  public boolean create(Customer cs) {
    String sql =
      "INSERT INTO `clientes`"
        + "(`nombres_cli`, `ruc_cli`, `contacto_cli`, `direccion_cli`) VALUES('"
        + cs.getName()
        + "','"
        + cs.getRuc()
        + "','"
        + cs.getContact()
        + "','"
        + cs.getAddress()
        + "')";
    return con.execute(sql);
  }
  @Override
  public List<Customer> getAll(String search){
    List<Customer> customerList = new ArrayList<>();
    String sql =
      "SELECT * FROM `clientes` WHERE `nombres_cli` like '%"
        + search
        + "%' or `id_cli`='"
        + search
        + "' or `ruc_cli` like '%"
        + search
        + "%'";
    ResultSet rs = con.query(sql);
    try{
      while (rs.next()) {
        Customer cs = new Customer();
        cs.getFromDB(rs);
        customerList.add(cs);
      }
    }catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
    return customerList;
  }
  @Override
  public Customer get(String search) throws SQLException {
    Customer cs = new Customer();
    String sql =
      "SELECT * FROM `clientes` WHERE `id_cli` ="
        + search;
    ResultSet rs = con.query(sql);
    while (rs.next()) {
      cs.getFromDB(rs);
    }
    return cs;
  }

  @Override
  public boolean update(Customer cs) {
    String sql =
      "UPDATE `clientes` SET `nombres_cli`='"
        + cs.getName()
        + "',`ruc_cli`='"
        + cs.getRuc()
        + "',`contacto_cli`='"
        + cs.getContact()
        + "',`direccion_cli`='"
        + cs.getAddress()
        + "' WHERE `id_cli`="
        + cs.getId();
    return con.execute(sql);
  }

  @Override
  public boolean delete(int customerID) {
    String sql = "DELETE FROM `clientes` WHERE `id_cli` =" + customerID;
    return con.execute(sql);
  }
}
