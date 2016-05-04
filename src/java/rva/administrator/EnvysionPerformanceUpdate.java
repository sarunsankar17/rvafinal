/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.*;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import rva.taskinsert.EnvysionBean;
import rva.administrator.ChangeDateFormat;
import rva.showperformance.*;

public class EnvysionPerformanceUpdate extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try{
    String auditorName;
    String cafeName;
    String taskName;
    String performDate=null;
    //String endDate=null;
    String dataDate=null;
    String dbstartDate =null;
    String dbendDate=null;
    String dbdataDate=null;
    ChangeDateFormat cdf=new ChangeDateFormat();
    EnvysionBean envybean=new EnvysionBean();
    EnvyTaskPerformed envypt=new EnvyTaskPerformed();
    auditorName=request.getParameter("auname");
    cafeName=request.getParameter("cafename");
    taskName=request.getParameter("taskname");
    performDate=request.getParameter("performdate");
    //endDate=request.getParameter("enddate");
    dataDate=request.getParameter("datadate");
    response.setContentType("text/html");
    PrintWriter out=response.getWriter();
    if(performDate!=null){
      dbstartDate=cdf.toDbDate(performDate);
      //dbendDate=cdf.toDbDate(endDate);
      dataDate=null;
    }
    else{
      dbstartDate=null;
      dbendDate=null;
      dataDate=cdf.toDbDate(dataDate);
    }
    envybean.setauditorName(auditorName);
    envybean.setcafeName(cafeName);
    envybean.settaskName(taskName);
    envybean.setstartDate(dbstartDate);
    //envybean.setendDate(dbendDate);
    envybean.setDataDate(dataDate);
    envybean=envypt.getTasksPerformed(envybean);
    
    HttpSession session=request.getSession(true);
    session.setAttribute("envypuresults", envybean);
    RequestDispatcher rd=request.getRequestDispatcher("envyperformanceupdate.jsp");
    rd.forward(request, response);
    }
    catch(Exception e){
      System.out.println(e);
    }
 }
}
