package com.itsqmet.dao;

import com.itsqmet.config.CBDD;
import com.itsqmet.model.Supplier;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO implements DAO<Supplier> {

  private final CBDD con = new CBDD();

  @Override
  public boolean create(Supplier sp) {
    String sql =
      "INSERT INTO `proveedores`"
        + "(`nombres_pro`, `ruc_pro`, `contacto_pro`, `direccion_pro`) VALUES('"
        + sp.getName()
        + "','"
        + sp.getRuc()
        + "','"
        + sp.getContact()
        + "','"
        + sp.getAddress()
        + "')";
    return con.execute(sql);
  }
  @Override
  public List<Supplier> getAll(){
    List<Supplier> supplierList = new ArrayList<>();
    String sql =
      "SELECT * FROM `proveedores`";
    ResultSet rs = con.query(sql);
    try{
      while (rs.next()) {
        Supplier sp = new Supplier();
        sp.getFromDB(rs);
        supplierList.add(sp);
      }
    }catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
    return supplierList;
  }
  @Override
  public List<Supplier> get(String search) throws SQLException {
    List<Supplier> supplierList = new ArrayList<>();
    String sql =
      "SELECT * FROM `proveedores` WHERE `nombres_pro` like '%"
        + search
        + "%' or `id_pro`='"
        + search
        + "' or `ruc_pro` like '%"
        + search
        + "%'";
    ResultSet rs = con.query(sql);
    try{
      while (rs.next()) {
        Supplier sp = new Supplier();
        sp.getFromDB(rs);
        supplierList.add(sp);
      }
    }catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
    return supplierList;
  }

  @Override
  public boolean update(Supplier cs) {
    String sql =
      "UPDATE `proveedores` SET `nombres_pro`='"
        + cs.getName()
        + "',`ruc_pro`='"
        + cs.getRuc()
        + "',`contacto_pro`='"
        + cs.getContact()
        + "',`direccion_pro`='"
        + cs.getAddress()
        + "' WHERE `id_pro`="
        + cs.getId();
    return con.execute(sql);
  }

  @Override
  public boolean delete(int id) {
    String sql = "DELETE FROM `proveedores` WHERE `id_pro` =" + id;
    return con.execute(sql);
  }
}
