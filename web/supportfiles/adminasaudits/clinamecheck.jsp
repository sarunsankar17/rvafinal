<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>

  
    <%
      String clientName=(String) request.getParameter("cliname");
      Connection con=DBConnect.startConnection();
      try
      {
        Statement st=con.createStatement();
        ResultSet res=st.executeQuery("SELECT * FROM asclients WHERE clientsname LIKE '"+clientName+"' ");
        if(res.next())
        {%>
        <p id="clires1">Client name already exist in database!</p>
       <%}
        else
        {%>
        <p id="clires1">Client name not available in database!</p>
       <%}
      }
      catch(Exception e)
      {
        System.out.println(e);
      }
      %>
  