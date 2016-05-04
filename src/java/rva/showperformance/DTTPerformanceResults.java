/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import rva.taskinsert.DTTBean;

/**
 *
 * @author RCT-456
 */
public class DTTPerformanceResults extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String auditorname;
    String taskname;
    String startDate;
    String endDate;
    auditorname=request.getParameter("auname");
    taskname=request.getParameter("taskname");
    startDate=request.getParameter("performdate");
    endDate=request.getParameter("enddate");
    DTTBean dttbean=new DTTBean();
    dttbean.setauditorname(auditorname);
    dttbean.settaskname(taskname);
    dttbean.setstartdateapp(startDate);
    dttbean.setenddateapp(endDate);
    DTTResultProcessing dttresult=new DTTResultProcessing();
    dttbean=dttresult.dttresultProcessing(dttbean);
    HttpSession session=request.getSession(true);
    session.setAttribute("dttresults",dttbean);
   
    RequestDispatcher rd=request.getRequestDispatcher("dttchecklist.jsp");
    rd.forward(request, response);
    }
  }

 
