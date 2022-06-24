package com.itsqmet.config;

//@author mrmango
import java.sql.*;

public class CBDD {

    private Statement st;
    private static Connection con;

    static {
        String url = "jdbc:mysql://localhost:3306/factu_pim?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "1234";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }
    public static Connection getConnection() {
        return con;
    }

    public boolean execute(String sql) {
        try {
            st = con.createStatement();
            int r = st.executeUpdate(sql);            
            if(r==1){
                return true;
            }else{
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
            return false;
        }
    }

    public ResultSet query(String sql) {
        ResultSet rs = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return rs;
    }

}
