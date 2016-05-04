<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%
ArrayList<String> llocationName=new ArrayList<String>();
String client=(String) request.getParameter("cli");
      Connection con=DBConnect.startConnection();
      try
      {
        Statement stm=con.createStatement();
        ResultSet res=stm.executeQuery("SELECT a.locationsid, a.locationsname FROM aslocations as a JOIN asclients as b on a.clientsid=b.clientsid WHERE b.clientsname LIKE '"+client+"'");
        while(res.next())
        {       
          llocationName.add(res.getString("locationsname"));
        }  
        Collections.sort(llocationName);
      }
       catch(Exception e)
      {
        System.out.println(e);
      }
        %>    
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