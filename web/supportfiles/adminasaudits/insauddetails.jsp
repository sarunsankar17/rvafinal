<%-- 
    Document   : insauddetails
    Created on : Dec 11, 2014, 3:55:09 PM
    Author     : RCT-456
--%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<%try{
 ArrayList<String> lauditgName=new ArrayList<String>();
 ArrayList<String> laudchoices=new ArrayList<String>();
 Connection con=DBConnect.startConnection();
 Statement st=con.createStatement();
 ResultSet res=st.executeQuery("SELECT * from asaudits");
 while(res.next()){
   lauditgName.add(res.getString("auditsname"));
 }
%>

<div class="noofstops" id="noofstops"><label>No of stops:</label>
  <input type="text" id="inpnoofstops" autocomplete="off" required> 
</div>
      <div class="auditgroupdet" id="auditgroupdet">
        <div class="audgroupname" id="audgroupname">
          <label><b>Audit group name:</b></label>
          <select class="audgsel" id="audgsel" onchange="audgnSel()">
            <option name="audgop" value=""></option>
            <%
            for(int i=0;i<lauditgName.size();i++){%>
            <option name="<%=lauditgName.get(i)%>" id="<%=lauditgName.get(i)%>" value="<%=lauditgName.get(i)%>"><%=lauditgName.get(i)%></option>
            <% }
            %>
  </select>
            <div class="entervalues" id="enteragvalues">
              
            </div>
 <input type="button" id="insnewagname" value="INSERT NEW AUDIT GROUP NAME" name="insnewagname" onclick="insertnewAGName()">
         
        </div>
            <div class="choandptdet" id="choandptdet">
            </div>
 
      </div>
<%
}
catch(Exception e){
  
}%>