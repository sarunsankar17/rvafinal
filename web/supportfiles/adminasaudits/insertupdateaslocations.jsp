<%-- 
    Document   : insertupdateaslocations
    Created on : Nov 24, 2014, 8:12:04 PM
    Author     : RCT-456
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
 ArrayList<String> llocationName=new ArrayList<String>(); 
  String clientName;
  String locationName;
  String selectboxlName;
  
  int clientNameid=0;
  Connection con=DBConnect.startConnection();
  try{
   clientName=(String) request.getParameter("cliname");
   selectboxlName=(String) request.getParameter("selblocname");
   locationName=(String) request.getParameter("locname");
   PreparedStatement pstm=null;
   Statement st=con.createStatement();
   
   ResultSet res2=st.executeQuery("SELECT * from asclients where clientsname LIKE '"+clientName+"' ");
   if(res2.next())
   {
     clientNameid=res2.getInt("clientsid");
   }
   
   if(selectboxlName==null){
   pstm=con.prepareStatement("INSERT INTO aslocations(locationsname,clientsid) VALUES(?,?)");
   pstm.setString(1,locationName);
   pstm.setInt(2,clientNameid);
   pstm.executeUpdate();
  ResultSet res=st.executeQuery("SELECT * from aslocations where clientsid LIKE "+clientNameid+" ");
  while(res.next()){
    llocationName.add(res.getString("locationsname"));
  }
  Collections.sort(llocationName);
  %>
  <header class="cname">Insert/Update AS Locations:</header>
      <div class="aslocname" id="aslocname">
 <lable>Location Name:</lable>
        <select name="locationname" class="locname" id="locname" onchange="lnameSel()">
        <option name="null" value=""></option>
       <% for(int i=0;i<llocationName.size();i++){%>
       <option name="<%=llocationName.get(i)%>" value="<%=llocationName.get(i)%>"><%=llocationName.get(i)%></option>  
          <%}%>
      </select>
      <div class="entervalues" id="enterlvalues"></div>
      <input type="button" value="INSERT" id="insertlocation" onclick="getInput(this.id)">
      <input type="button" value="UPDATE" id="updatelocation" onclick="update(this.id)">
      </div>
  <%
   }
   else
   {
   st.executeUpdate("UPDATE aslocations set locationsname='"+locationName+"' where locationsname LIKE '"+selectboxlName+"' ");
   ResultSet res=st.executeQuery("SELECT * from aslocations where clientsid LIKE "+clientNameid+" ");
  while(res.next()){
    llocationName.add(res.getString("locationsname"));
  }
  Collections.sort(llocationName);
  %>
  <header class="cname">Insert/Update AS Locations:</header>
      <div class="aslocname" id="aslocname">
 <lable>Location Name:</lable>
        <select name="locationname" class="locname" id="locname" onchange="lnameSel()">
        <option name="null" value=""></option>
       <% for(int i=0;i<llocationName.size();i++){%>
       <option name="<%=llocationName.get(i)%>" value="<%=llocationName.get(i)%>"><%=llocationName.get(i)%></option>  
          <%}%>
      </select>
      <div class="entervalues" id="enterlvalues"></div>
      <input type="button" value="INSERT" id="insertlocation" onclick="getInput(this.id)">
      <input type="button" value="UPDATE" id="updatelocation" onclick="update(this.id)">
      </div>
   <%}
  }
catch(Exception e){
  e.printStackTrace();
}
%>
