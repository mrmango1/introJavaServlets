package com.itsqmet.dao;

import java.sql.SQLException;
import java.util.List;

public interface DAO<T> {

  boolean create(T t) throws SQLException;

  boolean delete(int ID) throws SQLException;

  List<T> getAll() throws SQLException;

  List<T> get(String search) throws SQLException;

  boolean update(T t) throws SQLException;
}
