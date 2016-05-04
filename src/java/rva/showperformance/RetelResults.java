/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import rva.dbaccess.DBConnect;

/**
 *
 * @author Arun-S
 */
public class RetelResults extends HttpServlet {

    private String auditorName;
    private String performDate;
    private String eperformDate;
    private String taskName;
    private Date date;
    private String thisDate;
    private Date edate;
    private String ethisDate;
    SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
        RetelBean rb=new RetelBean();
    RetelResProcessing rrp=new RetelResProcessing();
        auditorName=request.getParameter("auname");
        taskName=request.getParameter("taskname");
        performDate=request.getParameter("performdate");
        eperformDate=request.getParameter("enddate");
        
        
          date=sdf.parse(performDate);
          thisDate=sdf1.format(date);
          edate=sdf.parse(eperformDate);
          ethisDate=sdf1.format(edate);
          
          rb.setAuditorName(auditorName);
        rb.setTaskName(taskName);
        rb.setPerformDate(thisDate);
        rb.setEPerformDate(ethisDate);
        rb=rrp.processRetelCount(rb); 
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
       HttpSession session=request.getSession(true);
       session.setAttribute("rrpres", rb);
       response.sendRedirect("retshowresults.jsp");
        }
            catch(Exception e)
            {
                e.printStackTrace();
            }
}
}