<%-- 
    Document   : updateasid
    Created on : Dec 23, 2014, 4:29:17 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.dbaccess.*"%>

<%
try{
  SimpleDateFormat appdate=new SimpleDateFormat("MM/dd/yyyy");
  SimpleDateFormat dbdate=new SimpleDateFormat("yyyy-MM-dd");
  Date date;
  String dbsdate=null;
  String oldauditorname=null;
  String dbedate=null;  
  PreparedStatement pstm=null;
  int asauditorsrowid =(Integer) (session.getAttribute("asidrowno"));
  String asauditorsidname=request.getParameter("asauditorsloginid");
  String auditorsname=request.getParameter("auditorsname");
  String appstartdate=request.getParameter("performdate");
  date=appdate.parse(appstartdate);
  dbsdate=dbdate.format(date);
  
   if(auditorsname.equalsIgnoreCase("Nill")){
   oldauditorname=(String)session.getAttribute("oldaudname");
   session.removeAttribute("oldaudname");
   String appenddate=request.getParameter("enddate");
   date=appdate.parse(appenddate);
   dbedate=dbdate.format(date);
  }
  int auditorsnamerowid=0;
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=null;
  
  res=st.executeQuery("SELECT * from auditors where auditorsname LIKE '"+auditorsname+"' ");
  while(res.next()){
    auditorsnamerowid=res.getInt("auditorsid");
  }
  st.executeUpdate("UPDATE asauditorslogin set auditorsloginname='"+asauditorsidname+"',auditorsid ="+auditorsnamerowid+" where auditorsloginid LIKE "+asauditorsrowid+" ");
  if(!auditorsname.equalsIgnoreCase("Nill")){
  pstm=con.prepareStatement("Insert Into astidassigndetails(tidname,auditorname,assigndate)values(?,?,?)");
  pstm.setString(1,asauditorsidname);
  pstm.setString(2, auditorsname);
  pstm.setString(3,dbsdate); 
pstm.executeUpdate();
}
  else{
    st.executeUpdate("UPDATE astidassigndetails set enddate='"+dbedate+"' where tidname LIKE '"+asauditorsidname+"' and auditorname LIKE '"+oldauditorname+"' and assigndate LIKE '"+dbsdate+"' ");
  }
  response.sendRedirect("asauditorsloginiddetails.jsp");
}
catch(Exception e){
  System.out.println(e);
}

%>
