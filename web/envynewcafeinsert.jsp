<%-- 
    Document   : envynewcafeinsert
    Created on : Jan 20, 2015, 9:05:14 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.sql.*"%>
<%
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    PreparedStatement pstm=null;
    ResultSet res=null;
    String process=(String) session.getAttribute("changedetail");
    if(process.equalsIgnoreCase("cafeinsert")){
      String cafename=request.getParameter("cafename");
      pstm=con.prepareStatement("INSERT INTO envysioncafes(envysioncafesname) values(?) ");
      pstm.setString(1,cafename);
      pstm.executeUpdate();
    }
    else if(process.equalsIgnoreCase("cafeupdate")){
      String cafename=request.getParameter("cafename");
      String oldcafename=(String) session.getAttribute("oldcafename");
      st.executeUpdate("UPDATE envysioncafes set envysioncafesname='"+cafename+"' where envysioncafesname LIKE '"+oldcafename+"' ");
    }
     else if(process.equalsIgnoreCase("taskinsert")){
      String taskname=request.getParameter("taskname");
      int performancetime=(Integer.parseInt(request.getParameter("pt")));
      pstm=con.prepareStatement("INSERT INTO envysiontasks(envysiontaskname,timetoperform) values(?,?) ");
      pstm.setString(1,taskname);
      pstm.setInt(2, performancetime);
      pstm.executeUpdate();
    }
    else if(process.equalsIgnoreCase("taskupdate")){
     String taskname=request.getParameter("taskname");
      int performancetime=(Integer.parseInt(request.getParameter("pt")));
      String oldtaskname=(String) session.getAttribute("oldtaskname");
      st.executeUpdate("UPDATE envysiontasks set envysiontaskname='"+taskname+"',timetoperform="+performancetime+" where envysiontaskname LIKE '"+oldtaskname+"' ");
    }
  }
  catch(Exception e){
    e.printStackTrace();
  }
  response.sendRedirect("envysionnewtaskinsert.jsp");
%>
