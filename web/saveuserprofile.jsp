<%-- 
    Document   : saveuserprofile
    Created on : Dec 26, 2014, 8:39:50 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%
  
String profileid=(String) session.getAttribute("profileid");
   String fathername = null;
    String commaddress = null;
    String mobno = null;
    String emermobno = null;
    String emailid = null;
    String dob = null;
    String gender = null;
    String bgroup = null;
    String accesslevel = null;
    String doj = null;
    String dedicatedproj = null;
    String department = null;
    String empid = null;
    String designation = null;
    String profstatus = null;
    String maritalstatus=null;
    String targetres=null;
    int target = 0;
    String empname=null;
    String uid=null;
    String team=null;
    String auditorname=null;
    String relievingdate = null;
    SimpleDateFormat appsdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat dbsdf=new SimpleDateFormat("yyyy-MM-dd");
    Date date=null;
    String dbdob=null;
    String dbdoj=null;
    String dbdor=null; 
    String dom=null;
    Connection con=DBConnect.startConnection();
    try{
      auditorname=request.getParameter("fname");
      fathername=request.getParameter("fathername");
      commaddress=request.getParameter("caddress");
      mobno=request.getParameter("mobno");
      emermobno=request.getParameter("emermobno");
      emailid=request.getParameter("email");
      dob=request.getParameter("dob");
      date=appsdf.parse(dob);
      dbdob=dbsdf.format(date);
      gender=request.getParameter("gender");
      bgroup=request.getParameter("bgroup");
      accesslevel=request.getParameter("acclevel");
      doj=request.getParameter("doj");
      date=appsdf.parse(doj);
      dbdoj=dbsdf.format(date);
      dedicatedproj=request.getParameter("dedicatedproj");
      maritalstatus=request.getParameter("marstatus");
      department=request.getParameter("department");
      empid=request.getParameter("kpoid");
      designation=request.getParameter("designation");
      profstatus=request.getParameter("profstatus");
      
      targetres=request.getParameter("target");
     if(targetres.equalsIgnoreCase("")){
       //target=0;
     }
     else{
       target=Integer.parseInt(targetres);
     }
      team=request.getParameter("team");
      relievingdate=request.getParameter("relievedate");
      Statement st=con.createStatement();
      if(relievingdate==""){
        
        out.println("NULL");
        st.executeUpdate("Update userprofilepersonal set fathername ='"+fathername+"', address= '"+commaddress+"',mailid='"+emailid+"',mobno='"+mobno+"',emergencymobno='"+emermobno+"',dob='"+dbdob+"',gender='"+gender+"',bloodgroup='"+bgroup+"',profilestatus='"+profstatus+"',marritalstatus='"+maritalstatus+"' where profileid= "+profileid+" ");
      st.executeUpdate("UPDATE userprofileofficial set doj='"+dbdoj+"', department='"+department+"',team='"+team+"',dedicatedproject='"+dedicatedproj+"',kpoempid='"+empid+"',designation= '"+designation+"',accesslevel='"+accesslevel+"',targetpermonth="+target+",relievingdate=NULL where profileid="+profileid+" ");
      st.executeUpdate("UPDATE auditors set empcategory ='"+designation+"' where auditorsname like '"+auditorname+"' ");
      response.sendRedirect("userprofilemaintenance.jsp");
      }
      else{
         date=appsdf.parse(relievingdate);
      dbdor=dbsdf.format(date);
      empname=request.getParameter("fname");
      uid=request.getParameter("uid");
      profstatus="disabled";
      st.executeUpdate("DELETE FROM `userprofilepersonal` WHERE profileid= "+profileid+" ");
      st.executeUpdate("DELETE FROM `userprofileofficial` WHERE profileid= "+profileid+"  ");
      PreparedStatement pstm=con.prepareStatement("INSERT INTO `resignedemployees`(`fullname`, `username`, `password`, `fathername`, `address`, `mailid`, `mobno`, `emergencymobno`, `dob`, `gender`, `bloodgroup`, `profilestatus`, `marritalstatus`, `dom`, `doj`, `department`, `team`, `dedicatedproject`, `kpoempid`, `designation`, `accesslevel`, `targetpermonth`, `relievingdate`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
      pstm.setString(1, empname);
      pstm.setString(2, uid);
      pstm.setString(3, null);
      pstm.setString(4, fathername);
      pstm.setString(5, commaddress);
      pstm.setString(6, emailid);
      pstm.setString(7, mobno);
      pstm.setString(8, emermobno);
      pstm.setString(9, dbdob);
      pstm.setString(10, gender);
      pstm.setString(11, bgroup);
      pstm.setString(12, profstatus);
      pstm.setString(13, maritalstatus);
      pstm.setString(14, dom);
      pstm.setString(15, dbdoj);
      pstm.setString(16, department);
      pstm.setString(17, team);
      pstm.setString(18, dedicatedproj);
      pstm.setString(19, empid);
      pstm.setString(20, designation);
      pstm.setString(21, accesslevel);
      pstm.setInt(22, target);
      pstm.setString(23, dbdor);
      pstm.executeUpdate();
      response.sendRedirect("userprofilemaintenance.jsp");
      }
    }
    catch(Exception e){
      e.printStackTrace();
    }
%>

