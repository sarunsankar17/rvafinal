<%-- 
    Document   : rvaattendance
    Created on : Feb 21, 2015, 6:56:20 PM
    Author     : RCT-456
--%>

<%@page import="rva.userlogin.AttendanceProcessing"%>
<%@page import="rva.userlogin.LogBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.util.Date"%>
<%@page import="rva.administrator.ChangeDateFormat"%>
<%
   String date=request.getParameter("signin");
   Date date1=new Date();
   ChangeDateFormat cdf=new ChangeDateFormat();
   date=cdf.todbDateTimeAttend(date1);
   String time=cdf.toTime(date);
   String enddate=null;
   String shift=null;
   String status="Present";
   String process=request.getParameter("process");
   
   LogBean lb=(LogBean) session.getAttribute("currloginsession");
   int profileId=lb.getProfileid();
   Connection con=DBConnect.startConnection();
   try{
     Statement st=con.createStatement();
     if(process.equalsIgnoreCase("signin")){
       ResultSet res=st.executeQuery("SELECT * from shifttime where Date_add(starttime,interval 2 hour) > '"+time+"' and Date_sub(starttime,interval 2 hour) < '"+time+"' ");
       if(res.next()){
         shift=res.getString("shiftname");
       }
       else{
         shift="General";
       }
     PreparedStatement pstm=con.prepareStatement("INSERT INTO rvaattandance(profid,logindate,logoutdate,todayshift,attendancestatus)values(?,?,?,?,?)");
     pstm.setInt(1, profileId);
     pstm.setString(2, date);
     pstm.setString(3, enddate);
     pstm.setString(4, shift);
     pstm.setString(5, status);
     pstm.executeUpdate();
     session.setAttribute("signin", "Alreadysignedin");
     String signintime=new AttendanceProcessing().getLoginDateTime(profileId);
     String workingtime=new AttendanceProcessing().getWorkingTime(profileId);%>
     <table class="rvaattandance"><tr><th>In Time</th><th>Work Time</th></tr>
      <tr><td><%=signintime%></td><td><%=workingtime%></td></tr>
      <tr><td colspan="2"><input type="button" id="attendsout" value="Signout Attendance"></td></tr></table>
     <%}
     else{
       enddate=request.getParameter("signout");
       st.executeUpdate("UPDATE rvaattandance set logoutdate = '"+date+"' where profid = "+profileId+" and logoutdate is NULL ");
       session.setAttribute("signin", "SignedOut");
     }
   }
   catch(Exception e){
     e.printStackTrace();
   }
  %>
 