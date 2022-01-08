package com.mvc.controller;
 
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDa;
 
public class LoginServlet extends HttpServlet {
 
    public LoginServlet() // default constructor
    {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
       
        String ssn = request.getParameter("SSN");

 
        LoginBean loginBean = new LoginBean();
        loginBean.setSSN(ssn);
        LoginDa loginDao = new LoginDa();
 
        String SSNValidate = loginDao.authenticateUser(loginBean);
 
        if(SSNValidate.equals("SUCCESS"))
         {
 
             request.getRequestDispatcher("/MyRegist.jsp").forward(request, response);
         }
         else
         {
             request.setAttribute("errMessage", SSNValidate);
             request.getRequestDispatcher("/LoginError.jsp").forward(request, response);
         }
    }
}