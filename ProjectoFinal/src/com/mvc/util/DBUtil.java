package com.mvc.util;
 
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBUtil {
 public static Connection createConnection()
 {
     Connection con = null;
     String url = "jdbc:sqlserver://s16988308.onlinehome-server.com:1433;databaseName=CUNY_DB;integratedSecurity=false;"; //MySQL URL and followed by the database name
     String username = "cst4713";
     String password = "password1";
     try 
     {
         try 
         {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //loading mysql driver 
         } 
         catch (ClassNotFoundException e)
         {
            e.printStackTrace();
         } 
         con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
         System.out.println("Printing connection object "+con);
     } 
     catch (Exception e) 
     {
        e.printStackTrace();
     }
     return con; 
 }
}