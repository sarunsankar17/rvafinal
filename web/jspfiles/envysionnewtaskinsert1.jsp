<%-- 
    Document   : envysionnewtaskinsert1
    Created on : Jan 20, 2015, 4:13:55 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <style>
          .envytaskdetails{
            width:100%;
            height:auto;
            background-color: aliceblue;
          }
          .envytaskdetails header{
            margin-bottom: 3px;
            background-color: lightblue;
          }
          #tdetails{
            margin:5px;
          }
        </style>
        <script>
          $(document).ready(function(){
            $("#encafe").change(function(){
              var cafe=$("#encafe").val();
              if(cafe==""){
              $("#updateenvycafe").prop("disabled",true);
            }
            else{
               $("#updateenvycafe").prop("disabled",false);
            }
            });
          });
        </script>
        <script>
          function getpt(val){
          var task=val;
          var xmlhttp;
          if(task!=""){
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
                document.getElementById("envypt").innerHTML=xmlhttp.responseText;
                document.getElementById("updateenvytask").disabled=false;
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/getenvypt.jsp?task="+task,true);
              xmlhttp.send();
          }
          else{
            document.getElementById("envypt").innerHTML="";
            document.getElementById("updateenvytask").disabled=true;
          }
          }
        </script>
  </head>
  <body>
    <Strong>Envysion New Task Insert/Update</Strong><br><br>
    <%
    try{
      Connection con=DBConnect.startConnection();
      ResultSet res=null;
      ArrayList<String> cafes=new ArrayList<String>();
      ArrayList<String> tasks=new ArrayList<String>();
      Statement st=con.createStatement();
      res=st.executeQuery("SELECT * from envysioncafes");
      while(res.next()){
      cafes.add(res.getString("envysioncafesname"));
    }
    res=st.executeQuery("SELECT * from envysiontasks");
      while(res.next()){
      tasks.add(res.getString("envysiontaskname"));
      }
    %>
    <div class="envytaskdetails" id="cdetails">
      <header><strong>Cafe Name Insert</strong></header>
    Envysion Cafes:</td><td>
          <select id="encafe" name="cafes">
            <option value="">-select-</option>
        <%
    for(int i=0;i<cafes.size();i++){%>
    <option value="<%=cafes.get(i)%>"><%=cafes.get(i)%></option>       
   <%
    }
        %>
          </select> <br></br>
     
          <button type="button" id="insertenvycafe" onclick='window.top.location.href="updateenydetails.jsp?insertdetail=insertcafe"'>INSERT CAFE</button>
       <button type="button" disabled id="updateenvycafe" onclick='window.top.location.href="updateenydetails.jsp?insertdetail=updatecafe&cafename="+document.getElementById("encafe").value'>UPDATE CAFE</button>
    </div>
    <div class="envytaskdetails" id="tdetails">
      <header><strong>Cafe Name Insert</strong></header>
       Envysion Tasks:
          <select id="entask" name="tasks" onchange="getpt(this.value)">
            <option value="">-select-</option>
        <%
    for(int i=0;i<tasks.size();i++){%>
    <option value="<%=tasks.get(i)%>"><%=tasks.get(i)%></option>       
   <%
    }
        %>
          </select><br><br>
          <div id="envypt"></div>
          <br>
          <button type="button" id="insertenvytask" onclick='window.top.location.href="updateenydetails.jsp?insertdetail=inserttask"'>INSERT TASK</button>
        <button type="button" id="updateenvytask" disabled onclick='window.top.location.href="updateenydetails.jsp?insertdetail=updatetask&taskname="+document.getElementById("entask").value+"&envyperftime="+document.getElementById("perftime").value'>UPDATE TASK</button>
       </div>
    <%}    
    catch(Exception e){
      e.printStackTrace();
    }%>
  </body>
</html>
