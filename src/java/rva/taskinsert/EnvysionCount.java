/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import rva.administrator.ChangeDateFormat;
import rva.userlogin.AttendanceProcessing;
import rva.userlogin.LogBean;

/**
 *
 * @author RCT-456
 */
public class EnvysionCount extends HttpServlet {
  
  
  private SimpleDateFormat sdfdb=new SimpleDateFormat("yyyy-MM-dd");
  private SimpleDateFormat sdfapp=new SimpleDateFormat("MM/dd/yyyy");
  
  
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
  try{
   int cafenameid=0;
    int tasknameid=0;
   String cafename[];
   String taskname[];
   String taskcount[];
   String datadate[];
   String auditorName;
   String perfdate;
   Date date;
   String perfDatedb;
   
  ArrayList<String> cafes=new ArrayList<String>();
  ArrayList<String> tasks=new ArrayList<String>();
  ArrayList<String> taskcounts=new ArrayList<String>();
  ArrayList<String> ldatadate=new ArrayList<String>();
  HttpSession session=request.getSession(true);
  LogBean lb=(LogBean) session.getAttribute("currloginsession");
  int profid=lb.getProfileid();
  String performdate=new AttendanceProcessing().getLoginDate(profid);
  ChangeDateFormat cdf=new ChangeDateFormat();
  perfdate=cdf.toDbDate(performdate);
  auditorName=(String) session.getAttribute("auditorname");
  //perfdate=request.getParameter("performdate");
  cafename=request.getParameterValues("cafename");
  taskname=request.getParameterValues("taskname");
  taskcount=request.getParameterValues("nooftasks");
  datadate=request.getParameterValues("datadate");
    Collections.addAll(cafes,cafename);
  Collections.addAll(tasks,taskname);
  Collections.addAll(taskcounts,taskcount);
  Collections.addAll(ldatadate,datadate);
  EnvysionBean envybean=new EnvysionBean();
  envybean.setauditorName(auditorName);
  envybean.setperformDate(perfdate);
  envybean.setcafesName(cafes);
  envybean.settasksName(tasks);
  envybean.setlDatadate(ldatadate);
  envybean.settaskCount(taskcounts);
  EnvysionCountProcessing encp=new EnvysionCountProcessing();
  envybean=encp.insertValues(envybean);
  response.sendRedirect("envysiontaskinsert.jsp");
  }
  catch(Exception e){
    System.out.println(e);
  }
} 
}
