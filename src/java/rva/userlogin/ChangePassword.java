/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import rva.dbaccess.DBConnect;

/**
 *
 * @author Arun-S
 */
public class ChangePassword extends HttpServlet {
  
  private String userID;
  private String password;
  Connection con=DBConnect.startConnection();
  
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
   userID=request.getParameter("username");
   password=request.getParameter("password");
try
{
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT * from userprofilepersonal where username LIKE '"+userID+"' ");
  if(res.next())
  {
  st.executeUpdate("UPDATE `userprofilepersonal` SET `password`='"+password+"' WHERE username='"+userID+"'");
  response.sendRedirect("userprofilemaintenance.jsp");
  }
  else
  {
    response.sendRedirect("changepassword.jsp");
  }
}
catch(Exception e)
{
  System.out.println(e);
}

}
}
