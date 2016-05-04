<%-- 
    Document   : asqaauditsupdate1
    Created on : Jan 8, 2015, 5:42:51 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
      #insclient{
        margin: 2px;
      }
      button{
        margin:2px;
      }
       #qaaudits{
        width:800px;
        word-wrap: break-word;
        //overflow:break-word;
       //white-space:  nowrap;
        //overflow:hidden;
      }
      .clientsname{
        margin:5px 0px 5px 0px;
        width:100%;
        height:auto;
        background-color: aliceblue;
      }
      .clientsname header{
        margin-bottom: 3px;
     background-color: lightblue;
      }
      .auditsname{
        margin:5px 0px 5px 0px;
        width:100%;
        height:auto;
        background-color: aliceblue;
      }
      .auditsname header{
         margin-bottom: 3px;
     background-color: lightblue;
      }
      select{
        overflow-x: hidden;
      }
    </style>
    <script>
      function getaudDetails(){
        var clientname=document.getElementById("asqaclient").value;
        var xmlhttp;
        if(clientname!=""){
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
                document.getElementById("auditsname").innerHTML=xmlhttp.responseText;
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/getqaaudits.jsp?cli="+clientname,true);
              xmlhttp.send();
          }
          else{
            document.getElementById("auditsname").innerHTML="";
          }
      }
    </script>
    <script>
      function getptDetails(){
        var auditname=document.getElementById("qaaudits").value;
        var xmlhttp;
        if(auditname!=""){
          
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
                document.getElementById("asqapt").innerHTML=xmlhttp.responseText;
                document.getElementById("updateaudit").disabled=false;
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/getqaauditspt.jsp?auditname="+auditname,true);
              xmlhttp.send();
          }
          else{
          
            document.getElementById("asqapt").innerHTML="";
            document.getElementById("updateaudit").disabled=true;
          }
      }
    </script>
  </head>
  <%
  ArrayList<String> lclientName=new ArrayList<String>();
  ArrayList<String> lauditName=new ArrayList<String>();
  ArrayList<Float> lperformancetime=new ArrayList<Float>();
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("SELECT * from asqaclients");
    while(res.next()){
      lclientName.add(res.getString("asqaclientsname"));
    }
  }
  catch(Exception e){
    e.printStackTrace();
  }
  %>
  <body>
    <Strong>AS QA Audits Update</Strong>
    <div class="asqaupdate" id="asqaclients">
    <div class="clientsname" id="clientsname">
      <header class="cname"><strong>Insert/Update AS Clients</strong></header>
      <label>AS QA Client Name:</label>
      <select name="asqaclient" id="asqaclient" onchange="getaudDetails()">
        <option name="empty" value="">-select-</option>
        <%for(int i=0;i<lclientName.size();i++){ %>
        <option value="<%=lclientName.get(i)%>"><%=lclientName.get(i)%></option>
<%}%>
      </select><br><br>
      <button type="button" id="insertclient" onclick='window.top.location.href="insertasqadetails.jsp?insertdetail=clientname&clientname="+document.getElementById("asqaclient").value'>INSERT CLIENTS</button>
    </div>
      <div class="auditsname" id="auditsname">
        
      </div>
    </div>
  </body>
</html>
