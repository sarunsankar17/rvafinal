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

/**
 *
 * @author Arun-S
 */
public class ASQACheckList extends HttpServlet {
    String auditorName;
    String clientName;
    String sDate;
    String eDate;
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
    auditorName=request.getParameter("auditorname");
    clientName=request.getParameter("cliname");
    sDate=request.getParameter("performdate");
    eDate=request.getParameter("enddate");
   
    ASQAChecklistBean asqacl=new ASQAChecklistBean();
    ASQAChecklistProcessing asclpro=new ASQAChecklistProcessing();
    asqacl.setQAAuditorname(auditorName);
    asqacl.setQAClientname(clientName);
    asqacl.setstartDate(sDate);
    asqacl.setendDate(eDate);
    asqacl=asclpro.processASQAChecklist(asqacl);
   response.setContentType("text/html");
   PrintWriter out=response.getWriter();
   HttpSession session=request.getSession(true);
   
   session.setAttribute("asqachecklistres",asqacl);
   response.sendRedirect("asqachecklist.jsp");
           
  
}

}
