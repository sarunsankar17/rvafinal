/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.administrator;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RCT-456
 */
public class DTTMissedValues extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    ReadDttReport readdtt=new ReadDttReport();
    readdtt.readDTTMissedValues();
    response.sendRedirect("dttmissedtasks.jsp");
  }

}
