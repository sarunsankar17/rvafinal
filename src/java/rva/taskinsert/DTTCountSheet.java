/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author RCT-456
 */
public class DTTCountSheet extends HttpServlet {
  SimpleDateFormat db=new SimpleDateFormat("yyyy-MM-dd");
  SimpleDateFormat app=new SimpleDateFormat("MM/dd/yyyy");
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   try{
    String[] tasksname;
    String[] logmeinname;
    String auditorname;
    String performeddate;
    Date date;
    String performdateDB;
    String[] processstage;
    
    ArrayList<String> ltasksname=new ArrayList<String>();
    ArrayList<String> llogmeinname=new ArrayList<String>();
    ArrayList<String> lprocessstage=new ArrayList<String>();
    
    HttpSession session=request.getSession(true);
    auditorname=(String) session.getAttribute("auditorname");
    performeddate= request.getParameter("performdate");
    tasksname=request.getParameterValues("taskname");
    logmeinname=request.getParameterValues("logmeinname");
    processstage=request.getParameterValues("processstage");
    date=app.parse(performeddate);
    performdateDB=db.format(date);        
            
    DTTBean dttbean=new DTTBean();
    DTTCountProcessing dcp=new DTTCountProcessing();
    Collections.addAll(ltasksname, tasksname);
    Collections.addAll(llogmeinname,logmeinname);
    Collections.addAll(lprocessstage,processstage);
    dttbean.setauditorname(auditorname);
    dttbean.setperformdate(performdateDB);
    dttbean.settasksname(ltasksname);
    dttbean.setlogmeinname(llogmeinname);
    dttbean.setprocessStage(lprocessstage);
    dttbean=dcp.InsertdttCount(dttbean);    
    response.sendRedirect("dttcountsheet.jsp");
   }
   catch(Exception e){
     e.printStackTrace();
   }
     }
  }