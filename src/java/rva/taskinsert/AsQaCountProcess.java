/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.lang.Integer;
import java.sql.*;
import java.text.*;
import rva.dbaccess.DBConnect;
/**
 *
 * @author Arun-S
 */
public class AsQaCountProcess extends HttpServlet {
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author RCT-456
 */
  
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException
  {
    try
    {
     String auditorName;
  String performDate;
  Date date;
  
  ArrayList<String> qaauditName=new ArrayList<String>();
 String noofauditsperformed[];
 String noofauditsperf;
 ArrayList<String> noofauditsperform=new ArrayList<String>();
 ArrayList<Integer> noofauditint=new ArrayList<Integer>();
 int qaauditsid;
 int clientsid;
 float asqaauditspt;
 int noofaudits[];
 String dbDate;
 Connection con=DBConnect.startConnection();
 Statement st=con.createStatement();
 ResultSet res=null;
 PreparedStatement pstm=null;
    HttpSession session=request.getSession(true);
    auditorName=(String) session.getAttribute("auditorname");
    performDate= request.getParameter("performdate");
    SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
    date=sdf.parse(performDate);
    dbDate=sdf1.format(date);
    qaauditName= (ArrayList) session.getAttribute("audname");
    noofauditsperformed=(request.getParameterValues("auditcount"));
   response.setContentType("text/html");
   PrintWriter out=response.getWriter();
   for(int i=0;i<noofauditsperformed.length;i++)
   {
     noofauditsperform.add(noofauditsperformed[i]);
     noofauditint.add(Integer.parseInt(noofauditsperform.get(i)));
   }
   for(int j=0;j<noofauditint.size();j++)
   {
     res=st.executeQuery("SELECT qaauditsid, clientsid,asqaauditspt from asqaauditspt where qaauditsname like '"+qaauditName.get(j)+"' ");
     while(res.next())
     {
       qaauditsid=res.getInt("qaauditsid");
       clientsid=res.getInt("clientsid");
       asqaauditspt=res.getFloat("asqaauditspt")*noofauditint.get(j);
       pstm=con.prepareStatement("INSERT into asqafinal (qaperformeddate,qaauditorname,qaauditsid,noofauditsperformed,qaperformancetime,asqaclientsid) VALUES(?,?,?,?,?,?)");
       pstm.setString(1,dbDate);
       pstm.setString(2,auditorName);
       pstm.setInt(3,qaauditsid);
       pstm.setInt(4,noofauditint.get(j));
       pstm.setFloat(5,asqaauditspt);
       pstm.setInt(6, clientsid);
       pstm.executeUpdate();
     }
   }
   response.sendRedirect("asqacount.jsp");
  }
  
  catch(Exception e)
  {
    System.out.println(e);
  }
  }
}
