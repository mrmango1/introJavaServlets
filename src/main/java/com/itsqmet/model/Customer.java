package com.itsqmet.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

// @author mrmango
public class Customer implements Serializable {

  private int id;
  private String name;
  private String ruc;
  private String contact;
  private String address;

  public Customer() {
  }
  public Customer(String name, String ruc, String contact, String address) {
    this.name = name;
    this.ruc = ruc;
    this.contact = contact;
    this.address = address;
  }
  public Customer(int id,String name, String ruc, String contact, String address) {
    this.id = id;
    this.name = name;
    this.ruc = ruc;
    this.contact = contact;
    this.address = address;
  }
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getRuc() {
    return ruc;
  }

  public void setRuc(String ruc) {
    this.ruc = ruc;
  }

  public String getContact() {
    return contact;
  }

  public void setContact(String contact) {
    this.contact = contact;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public void getFromDB(ResultSet rs) throws SQLException {
    setId(rs.getInt(1));
    setName(rs.getString(2));
    setRuc(rs.getString(3));
    setContact(rs.getString(4));
    setAddress(rs.getString(5));
  }
}
