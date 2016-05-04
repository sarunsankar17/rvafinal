<%-- 
    Document   : dttnewtaskinsert1
    Created on : Jan 21, 2015, 2:30:20 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
      .dtttaskdetails{
        width:100%;
        height:auto;
        background-color: aliceblue;
        margin-bottom: 5px;
      }
      .dtttaskdetails header{
        background-color: lightblue;
        margin-bottom: 3px;
      }
      </style>
    <script>
      function getdttperftime(){
        var taskname=document.getElementById("dtttname").value;
        var xmlhttp;
        if(taskname!=""){
        if(window.XMLHttpRequest)
            {
              xmlhttp=new XMLHttpRequest();
            }
            else
            {
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function() 
            { 
              if(xmlhttp.readyState==4&&xmlhttp.status==200)
              {
                document.getElementById("perftime").innerHTML=xmlhttp.responseText;
                document.getElementById("updatetask").disabled=false;
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/getdttpt.jsp?task="+taskname,true);
              xmlhttp.send();
          }
       else{
         document.getElementById("updatetask").disabled=true;
         document.getElementById("perftime").innerHTML="";
       }
      }
    </script>
    </head>
  <body>
   <%
   ArrayList<String> taskname=new ArrayList<String>();
   ArrayList<String> ltaskstage=new ArrayList<String>();
   try{
     Connection con=DBConnect.startConnection();
     Statement st=con.createStatement();
     ResultSet res=null;
      res=st.executeQuery("SELECT * from dtttaskdetails");
     while(res.next()){
       taskname.add(res.getString("dtttaskname"));
     }
     res=st.executeQuery("SELECT * FROM `dttprocessstage`");
      while(res.next()){
        ltaskstage.add(res.getString("dttprocessstagename"));
      }
     
     %>
     <Strong>DTT New Task Insert/Update</Strong><br><br>
     <div class="dtttaskdetails">
       <header><strong>DTT Task Details</strong></header>
  <label>DTT Task Name:</label><select name="dtttaskname" id="dtttname" onchange="getdttperftime()">
    <option value="">-select-</option>
    <%
    for(int i=0;i<taskname.size();i++){%>
      <option value="<%=taskname.get(i)%>"><%=taskname.get(i)%></option>
    <%}
    %>
  </select><br><br>
  <div id="perftime"></div>
  <button type="button" id="inserttask" onclick='window.top.location.href="dtttaskdetailchange.jsp?process=insert" '>INSERT</button>
  <button type="button" disabled id="updatetask" onclick='window.top.location.href="dtttaskdetailchange.jsp?process=update&taskname="+document.getElementById("dtttname").value+"&pt="+document.getElementById("dttperftime").value' >UPDATE</button>
     </div> 
     <div class="dtttaskdetails">
       <header><strong>DTT Task Stages</strong></header>
  <label>DTT Task Stage:</label><select name="dtttaskname" id="dtttname" onchange="getdttperftime()">
    <option value="">-select-</option>
    <%
    for(int i=0;i<ltaskstage.size();i++){%>
      <option value="<%=ltaskstage.get(i)%>"><%=ltaskstage.get(i)%></option>
    <%}
    %>
  </select><br><br>
  <button type="button" id="inserttaskstage" onclick='window.top.location.href="dtttaskdetailchange.jsp?process=insertnewtaskstage" '>INSERT</button>
  
     </div>
     <%
   } 
   catch(Exception e){
     e.printStackTrace();
   }
   %> 
  </body>
</html>
