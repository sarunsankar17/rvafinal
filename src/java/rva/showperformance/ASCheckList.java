/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import rva.showperformance.ASChecklistProcessing;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Arun-S
 */
public class ASCheckList extends HttpServlet {
    private String startDate;
    private String endDate;
    private String auditorName;
    private String clientName;
    private String locationName;
    private Date sDate;
    private Date eDate;
    private String sdbDate;
    private String edbDate;
    private String shiftTime;
    private String dst;
    
    SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat sdbf=new SimpleDateFormat("yyyy-MM-dd");
    
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
      
      try
      {
      ASChecklistBean clb=new ASChecklistBean();
       ASChecklistProcessing clp=new ASChecklistProcessing();
  
        startDate=request.getParameter("performdate");
        endDate=request.getParameter("enddate");
        auditorName=request.getParameter("auditorname");
        clientName=request.getParameter("cliname");
        shiftTime=request.getParameter("shift");
        dst=request.getParameter("session");
        sDate=sdf.parse(startDate);
        sdbDate=sdbf.format(sDate);
        eDate=sdf.parse(endDate);
        edbDate=sdbf.format(eDate);
        clb.setauditorName(auditorName);
        clb.setclientName(clientName);
        clb.setDst(dst);
        //clb.setlocationName(endDate);
        clb.setstartDate(sdbDate);
        clb.setendDate(edbDate);
        clb.setshiftTime(shiftTime);
        if(!clientName.equals("-selectall-"))
        {
          locationName=request.getParameter("locationname");
          clb.setlocationName(locationName);
        }
       clb=clp.processValues(clb);
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        //out.println(clientName);
        
        HttpSession session=request.getSession(true);
        session.setAttribute("currentasclvalues", clb);
        //session.setAttribute("starttime",startDate);
        response.sendRedirect("aschecklist.jsp");
      }
      catch(Exception e)
      {
        System.out.println(e);
      }
    }   
}
