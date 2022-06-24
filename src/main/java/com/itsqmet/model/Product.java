package com.itsqmet.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Product {

  private int id;
  private int stock;
  private String name;
  private String description;
  private String iva;
  private String type;
  private double valueP;
  private double valueS;

  public Product() {}

  public Product(
      String name,
      String description,
      double valueP,
      double valueS,
      int stock,
      String iva,
      String type) {
    this.name = name;
    this.description = description;
    this.valueP = valueP;
    this.valueS = valueS;
    this.stock = stock;
    this.iva = iva;
    this.type = type;
  }

  public Product(
      int id,
      String name,
      String description,
      double valueP,
      double valueS,
      int stock,
      String iva,
      String type) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.valueP = valueP;
    this.valueS = valueS;
    this.stock = stock;
    this.iva = iva;
    this.type = type;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getStock() {
    return stock;
  }

  public void setStock(int stock) {
    this.stock = stock;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getIva() {
    return iva;
  }

  public void setIva(String iva) {
    this.iva = iva;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public double getValueP() {
    return valueP;
  }

  public void setValueP(double valueP) {
    this.valueP = valueP;
  }

  public double getValueS() {
    return valueS;
  }

  public void setValueS(double valueS) {
    this.valueS = valueS;
  }
  public void getFromDB(ResultSet rs) throws SQLException {
    setId(rs.getInt(1));
    setName(rs.getString(2));
    setDescription(rs.getString(3));
    setValueP(rs.getDouble(4));
    setValueS(rs.getDouble(5));
    setStock(rs.getInt(6));
    setIva(rs.getString(7));
    setType(rs.getString(8));
  }
}
