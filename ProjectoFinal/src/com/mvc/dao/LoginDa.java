package com.mvc.dao;
 
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mvc.bean.LoginBean;
import com.mvc.util.DBUtil;
 
public class LoginDa {
     public String authenticateUser(LoginBean loginBean)
     {
         String ssn = loginBean.getSSN();
 
         Connection con = null;
         Statement statement = null;
         ResultSet resultSet = null;
 
         String ssnDB = "";
 
 
         try
         {
             con = DBUtil.createConnection();
             statement = con.createStatement();
             resultSet = statement.executeQuery("select ssn from Enrollment");
             while(resultSet.next())
             {
            	 ssnDB = resultSet.getString("ssn");
               if(ssn.equals(ssnDB))
               {
                  return "SUCCESS";
               }
             }
             
         }
         	catch(SQLException e)
         	{
             e.printStackTrace();
         	}
          return "Invalid user credentials";
     }
}