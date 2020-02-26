package com.mycompany.mp2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * 
 * CopyRight cosmos
 */
/**
 * @author saif
 */
public class ConnectionClass {

    static Connection con;
    static String url = "jdbc:postgresql://ec2-18-213-176-229.compute-1.amazonaws.com:5432/d303apr8u6vdc2";
    static String password = "9c83fe1b94fc1adc7e00c3a88e543f88a592b7eb0634c4a3a42dcb0b31c34cfd";
    static String user = "monumwvhkdvfbg";
//    static String url = "jdbc:postgresql://database-1.chnt7rhokzdz.us-east-1.rds.amazonaws.com:5432/sherifwebsite";
//    static String user = "postgres";
//    static String password = "postgres";

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
            return con;
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionClass.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

}
