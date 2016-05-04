<%-- 
    Document   : retelnewtaskinsert
    Created on : Jan 21, 2015, 6:48:08 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>
      function checkvalue(){
        var taskname=document.getElementById("reteltask").value;
        if(taskname!=""){
          
          document.getElementById("update").disabled=false;
        }
        else{
          document.getElementById("update").disabled=true;
        }
      }
    </script>
    <style>
      .reteltaskdetails{
        width:100%;
        height:auto;
        background-color: aliceblue;
      }
      .reteltaskdetails header{
        width:100%;
        height:auto;
        background-color: lightblue;
        margin-bottom: 3px;
      }
    </style>
  </head>
  <body>
    <%
      ArrayList<String> taskname=new ArrayList<String>();
   try{
     
     Connection con=DBConnect.startConnection();
     Statement st=con.createStatement();
     ResultSet res=st.executeQuery("SELECT * from reteltaskname");
     while(res.next()){
       taskname.add(res.getString("taskname"));
     }
   
   %>
   <strong>Retel Task Insert/Update</strong>
   <br><br>
   <div class="reteltaskdetails">
     <header><strong>Retel Task Details</strong></header>
   <label>Task Name:</label><select name="reteltaskname" id="reteltask" onchange="checkvalue()">
     <option value="">-select-</option>
     <%
     for(int i=0;i<taskname.size();i++){
       %>
       <option value="<%=taskname.get(i)%>"><%=taskname.get(i)%></option>
     <%
     }
     %>
   </select><br><br>
   <button type="button" id="insert" onclick='window.top.location.href="retelnewtaskinsertprocessing.jsp?process=insert"'>INSERT</button>
   <button type="button" id="update" disabled onclick='window.top.location.href="retelnewtaskinsertprocessing.jsp?process=update&taskname="+document.getElementById("reteltask").value'>UPDATE</button>
   </div>  <%}
   catch(Exception e){
     e.printStackTrace();
   }
    %>
  </body>
</html>
