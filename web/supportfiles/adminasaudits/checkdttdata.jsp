<%-- 
    Document   : checkdttdata
    Created on : Jan 21, 2015, 5:00:02 PM
    Author     : RCT-456
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.*"%>
<%
try{
String taskname=request.getParameter("name");
String process=request.getParameter("process");
ArrayList<String> processstage=new ArrayList<String>();
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=null;
    
    res=st.executeQuery("SELECT * from dtttaskdetails where dtttaskname like '"+taskname+"' ");
    if(process.equalsIgnoreCase("checktname")){
    if(res.next()){
%>
<script>
      $(document).ready(function(){
      $('#butsub').disabled=true;
    });
    </script>
    <p>Task Name Already Available. Please Change Task Name.</p><br>
    <label></label><br>
<%
}
    else{
      res=st.executeQuery("SELECT * FROM `dttprocessstage`");
      while(res.next()){
        processstage.add(res.getString("dttprocessstagename"));
      }
      %>     
      <input type="button" value="+" name="addprstandpt" onclick="insertnewprandpt()"><br>
       <input type="submit" value="SAVE" name="formsub"><br>
      <%
    }
    }
    else{
      res=st.executeQuery("SELECT * FROM `dttprocessstage` where dttprocessstagename like '"+taskname+"' ");
      if(res.next()){%>
       <p>Task Name Already Available. Please Change Task Name.</p> 
     <% }
      else{%>
        <button type="submit">SAVE</button>
      <%}
    }
}
catch(Exception e){
  
}
%>