<%-- 
    Document   : getqaaudits
    Created on : Jan 18, 2015, 4:27:09 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%
ArrayList<String> lauditsname=new ArrayList<String>();
ArrayList<Float> lperformancetime=new ArrayList<Float>();
String clientname=request.getParameter("cli");
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT a.qaauditsname from asqaauditspt as a JOIN asqaclients as b on a.clientsid=b.asqaclientsid where asqaclientsname='"+clientname+"' ");
  while(res.next()){
    lauditsname.add(res.getString("a.qaauditsname"));
  }%>
  <header class="cname"><strong>Insert/Update AS Audits</strong></header>
      <label>AS QA Audit Name:</label>
  <select class="qaaudits" id="qaaudits" onchange="getptDetails()">
    <option id="empty" value="">-select-</option>
    <%for(int i=0;i<lauditsname.size();i++){
      %>
      <option name="<%=lauditsname.get(i)%>" value="<%=lauditsname.get(i)%>"><%=lauditsname.get(i)%></option>
    <%
}%>
  </select>
  <div class="asqapt" id="asqapt"></div><br>
  <button type="button" id="insertaudit" onclick='window.top.location.href="insertasqadetails.jsp?insertdetail=auditname"'>INSERT AUDITS</button>
  <button type="button" disabled id="updateaudit" onclick='window.top.location.href="insertasqadetails.jsp?insertdetail=updateaudit&clientname="+document.getElementById("asqaclient").value+"&auditname="+document.getElementById("qaaudits").value+"&perftime="+document.getElementById("perftime").value'>UPDATE AUDITS PT</button>
<%
}
catch(Exception e){
  e.printStackTrace();
}
%>
