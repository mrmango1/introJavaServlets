package com.itsqmet.dao;

import com.itsqmet.config.CBDD;
import com.itsqmet.model.Product;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements DAO<Product> {

  private final CBDD con = new CBDD();

  @Override
  public boolean create(Product pd) {
    String sql =
      "INSERT INTO productos"
        + "(nombre_prod, descripcion_prod,valor_ref_comp_prod,valor_ref_venta_prod,stock_prod,tiene_iva_prod,tipo_prod) VALUES('"
        + pd.getName()
        + "','"
        + pd.getDescription()
        + "','"
        + pd.getValueP()
        + "','"
        + pd.getValueS()
        + "','"
        + pd.getStock()
        + "','"
        + pd.getIva()
        + "','"
        + pd.getType()
        + "')";
    return con.execute(sql);
  }

  @Override
  public List<Product> getAll( ){
    List<Product> productList = new ArrayList<>();
    String sql =
      "SELECT * FROM productos;";
    ResultSet rs = con.query(sql);
    try {
      while (rs.next()) {
        Product pd = new Product();
        pd.getFromDB(rs);
        productList.add(pd);
      }
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
    return productList;
  }

  @Override
  public List<Product> get(String search){
    List<Product> productList = new ArrayList<>();
    String sql =
      "SELECT * FROM productos "
        + "WHERE nombre_prod like '%"
        + search
        + "%' OR descripcion_prod like '%"
        + search
        + "%' OR valor_ref_comp_prod like '%"
        + search
        + "%' OR valor_ref_venta_prod like '%"
        + search
        + "%' OR stock_prod like '%"
        + search
        + "%' OR tiene_iva_prod like '%"
        + search
        + "%' OR tipo_prod like '%"
        + search
        + "%'";
    ResultSet rs = con.query(sql);
    try {
      while (rs.next()) {
        Product pd = new Product();
        pd.getFromDB(rs);
        productList.add(pd);
      }
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    }
    return productList;
  }

  @Override
  public boolean update(Product pd) {
    String sql =
      "UPDATE productos SET nombre_prod='"
        + pd.getName()
        + "',descripcion_prod='"
        + pd.getDescription()
        + "',valor_ref_comp_prod='"
        + pd.getValueP()
        + "',valor_ref_venta_prod='"
        + pd.getValueS()
        + "',stock_prod='"
        + pd.getStock()
        + "',tiene_iva_prod='"
        + pd.getIva()
        + "',tipo_prod='"
        + pd.getType()
        + "' WHERE id_prod ="
        + pd.getId();
    return con.execute(sql);
  }

  @Override
  public boolean delete(int productID) {
    String sql = "DELETE FROM `productos` WHERE `id_prod` =" + productID;
    return con.execute(sql);
  }
}
