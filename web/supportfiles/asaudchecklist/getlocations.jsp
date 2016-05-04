<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%
ArrayList<String> locname=new ArrayList<String>();
String client=(String) request.getParameter("cli");
      Connection con=DBConnect.startConnection();
      try
      {
        Statement stm=con.createStatement();
        ResultSet res=stm.executeQuery("SELECT a.locationsid, a.locationsname FROM aslocations as a JOIN asclients as b on a.clientsid=b.clientsid WHERE b.clientsname LIKE '"+client+"'");
        while(res.next())
        {       
          locname.add(res.getString("locationsname"));
        }  
        locname.add("-selectall-");
        Collections.sort(locname);
        %>    
        <th>Location Name</th>
        <br><td>
        <select id="locationname" name="locationname" width="150px">
          <%
          for(int i=0;i<locname.size();i++)
            {%>
            <option name="<%=locname.get(i)%>" id="locationname" value="<%=locname.get(i)%>"/> 
            <%=locname.get(i)%>
        </option>
            <%
            }
            %>
        </select></td><br>
        <%
      }
      catch(Exception e)
      {
        System.out.println(e);
      }
%>