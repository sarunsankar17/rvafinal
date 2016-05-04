<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%
ArrayList<String> lallauditName=new ArrayList<String>();
String allauditName=(String) request.getParameter("loc");
      Connection con=DBConnect.startConnection();
      try
      {
        Statement stm=con.createStatement();
        ResultSet res=stm.executeQuery("SELECT a.allauditsname FROM asallaudits as a JOIN aslocations as b on a.locationsid=b.locationsid WHERE b.locationsname LIKE '"+allauditName+"' ");
        while(res.next())
        {       
          lallauditName.add(res.getString("allauditsname"));
        }  
        Collections.sort(lallauditName);
      }
       catch(Exception e)
      {
        System.out.println(e);
      }
        %>    
        <lable>Audit Name:</lable>
        <select name="auditname" class="audname" id="audname" onchange="getauditDet()">
        <option name="null" value=""></option>
       <% for(int i=0;i<lallauditName.size();i++){%>
       <option name="<%=lallauditName.get(i)%>" value="<%=lallauditName.get(i)%>"><%=lallauditName.get(i)%></option>  
          <%}%>
      </select>
        <div class="entervalues" id="enteraavalues"></div>
        <div class="allauddet" id="allauddet">     
        </div>
        <input type="button" value="INSERT" id="insertaudit" onclick="insertnewaud()">
        <input type="button" value="UPDATE" id="updateaudit" onclick="updatenewaud()">
      