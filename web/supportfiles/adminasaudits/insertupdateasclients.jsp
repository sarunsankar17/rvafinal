<%-- 
    Document   : insertupdateasclients
    Created on : Nov 15, 2014, 6:38:27 PM
    Author     : RCT-456
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
 ArrayList<String> lclientName=new ArrayList<String>(); 
  String clientName;
  String selectboxcName;
  Connection con=DBConnect.startConnection();
  try{
   clientName=(String) request.getParameter("cliname");
   selectboxcName=(String) request.getParameter("selectcname");
   PreparedStatement pstm=null;
   Statement st=con.createStatement();
   
   if(selectboxcName==null){
   pstm=con.prepareStatement("INSERT INTO asclients(clientsname) VALUES(?)");
   pstm.setString(1,clientName);
   pstm.executeUpdate();
  ResultSet res=st.executeQuery("SELECT * from asclients");
  while(res.next()){
    lclientName.add(res.getString("clientsname"));
  }
  Collections.sort(lclientName);
  %>
  <header class="cname">Insert/Update AS Clients:</header>
  <lable>Client Name:</lable>
      <select name="clientname" class="cliname" id="cliname" onchange="cnameSel()" >
        <option name="null" value=""></option>
       <% for(int i=0;i<lclientName.size();i++){%>
       <option name="<%=lclientName.get(i)%>" value="<%=lclientName.get(i)%>"><%=lclientName.get(i)%></option>  
          <%}%>
      </select>
      <div class="entervalues" id="entercvalues"></div>
     
      <input type="button" value="INSERT" id="insertclient" onclick="getInput(this.id)">
      <input type="button" value="UPDATE" id="updateclient" onclick="update(this.id)"> 
  <%
   }
   else
   {
   st.executeUpdate("UPDATE asclients set clientsname='"+clientName+"' where clientsname LIKE '"+selectboxcName+"' ");
   ResultSet res=st.executeQuery("SELECT * from asclients");
  while(res.next()){
    lclientName.add(res.getString("clientsname"));
  }
  Collections.sort(lclientName);
  %>
  <header class="cname">Insert/Update AS Clients:</header>
  <lable>Client Name:</lable>
      <select name="clientname" class="cliname" id="cliname" onchange="cnameSel()" >
        <option name="null" value=""></option>
       <% for(int i=0;i<lclientName.size();i++){%>
       <option name="<%=lclientName.get(i)%>" value="<%=lclientName.get(i)%>"><%=lclientName.get(i)%></option>  
          <%}%>
      </select>
      <div class="entervalues" id="entercvalues"></div>
      
      <input type="button" value="INSERT" id="insertclient" onclick="getInput(this.id)">
      <input type="button" value="UPDATE" id="updateclient" onclick="update(this.id)">
   <%}
  }
catch(Exception e){
  e.printStackTrace();
}
%>

