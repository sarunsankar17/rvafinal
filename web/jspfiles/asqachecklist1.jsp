<%-- 
    Document   : test
    Created on : Jul 15, 2014, 3:27:29 AM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.showperformance.ASQAAuditors"%>
<%@page import="rva.showperformance.ASQAChecklistBean"%>
<%@page import="rva.userlogin.*"%>
<%@page import="rva.showperformance.ASInfo"%>
<%@page import="rva.showperformance.ASQAChecklistProcessing"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
  <head>
    <metequiv ="Content-Type" content="text/html; charset=UTF-8">
    <title>AS QA CheckList</title>
    <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <script src="jsfiles/tablesorter.min.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        
            <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
      <style>      
    #asqachecklist{  
            width:auto;
            background-color: aliceblue;
            margin-bottom: 5px;
    }
       #asqachecklist th
        {
          //width:105px;
           text-align: left; 
        }
      #asqachecklist  td:nth-child(){
            text-align:left;
            width:150px;
        }
      #modify,  #submit{
          width:80px;
         // margin: 5px 0px 0px 0px;
        }
       #asqachecklist input,#asqachecklist select{
          width:150px;
        }
        #asqachecklist table,#asqachecklist th,#asqachecklist tr,#asqachecklist td
         {
           border-collapse: collapse;
            //border: 1px solid black;
        } 
        
        
        </style>
        <script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
        <script>
            function modifysearch(){
                document.getElementById("stdate").disabled=false;
                document.getElementById("endate").disabled=false;
                document.getElementById("cliname").disabled=false;
                document.getElementById("auditorname").disabled=false;
                document.getElementById("submit").disabled=false;
            }
            </script>
           
  <script>
          $(document).ready(function(){
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            $("#stdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate:maxDate,minDate:new Date(2014,00,01),
              onSelect: function(selected){
                $("#endate").datepicker("option","minDate",selected)
              }
            });
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            $("#endate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate:maxDate,minDate:new Date(2014,00,01),
            onSelect: function(selected){
              $("#stdate").datepicker("option","maxDate",selected)
            }           
            });
          });
          </script>
  </head>
  <body>   
   <strong>AS QA Performance Report</strong>
   <%
         ASInfo asqainfo=new ASInfo();
      ArrayList<String> asqacleints=new ArrayList<String>();
      LogBean lb=(LogBean) session.getAttribute("currloginsession");
      String audAccesslevel;
          String auditorName;
          audAccesslevel=(String) lb.getAccesslevel();
          auditorName=(String) lb.getAuditorname();
        asqacleints=asqainfo.getasqaclientName();
ArrayList<String> lauditorName=new ArrayList<String>();
ArrayList<String> lclientName=new ArrayList<String>();
String sappDate;
String eappDate;
ArrayList<Float> lqaperformanceTime =new ArrayList<Float>();
ASQAChecklistBean asqaclb=(ASQAChecklistBean) session.getAttribute("asqachecklistres");
String sessionval=null;
DecimalFormat df=new DecimalFormat("0.00");
float total=0.00f;
   
  
   %>
   
    <form action="ASQACheckList" method="POST">
       
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%if(asqaclb==null){
          %>
          <table id="asqachecklist">
            <tr><th>Start Date</th><th>End Date</th><th>Client Name</th><th>Auditor Name</th>
            <td><input type="button" id="modify" value="MODIFY"></td>
            </tr>
            <tr><td><input type="text" class="datepicker"id="stdate" autocomplete="off" name="performdate" required/></td>
         <td><input type="text" class="datepicker" id="endate" autocomplete="off" name="enddate" required></td>
           <td><select name="cliname" class="selsize" id="cliname"><%
          for(int i=0;i<asqacleints.size();i++)
         {%>
              <option name="<%=(asqacleints.get(i))%>" value="<%=(asqacleints.get(i))%>"  >
              <%=(asqacleints.get(i))%></option>
        <%
      } %></select></td>
         <% 
          ArrayList<String> asqaauditors=new ArrayList<String>();
         asqaauditors=asqainfo.getasqaauditoName();
         %>
           <td><select name="auditorname" class="selsize" id="auditorname" required>
               <%for(int j=0;j<asqaauditors.size();j++){ %>
                      <option name="<%=asqaauditors.get(j)%>" value="<%=asqaauditors.get(j)%>">
                      <%=asqaauditors.get(j)%></option>
                      <%                    
}%>
                  </select>
            </td>
 <td><input type="submit" id="submit" value="SUBMIT"></td></tr></table><%}
          else{
lauditorName=asqaclb.getlauditorName();
lclientName=asqaclb.getlclientName();
sappDate=asqaclb.getstartDate();
eappDate=asqaclb.getendDate();
lqaperformanceTime=asqaclb.getlAsQAResults();
String qacname=asqaclb.getQAClientname();
String qaaudname=asqaclb.getQAAuditorname();
 %>
            <table id="asqachecklist">
            <tr><th>Start Date</th><th>End Date</th><th>Client Name</th><th>Auditor Name</th>
            <td><input type="button" id="modify" value="MODIFY" onclick="modifysearch()"></td>
            </tr>
            <tr><td><input type="text" class="datepicker"id="stdate" autocomplete="off" value="<%=sappDate%>" name="performdate" disabled required/></td>
         <td><input type="text" class="datepicker" id="endate" autocomplete="off" value="<%=eappDate%>" name="enddate" required disabled></td>
           <td><select name="cliname" class="selsize" id="cliname" disabled><%
          for(int i=0;i<asqacleints.size();i++)
         {
          if(asqacleints.get(i).equalsIgnoreCase(qacname)){
           %>
              <option name="<%=(asqacleints.get(i))%>" value="<%=(asqacleints.get(i))%>" selected >
              <%=(asqacleints.get(i))%></option>
        <%}
          else{%>
            <option name="<%=(asqacleints.get(i))%>" value="<%=(asqacleints.get(i))%>">
              <%=(asqacleints.get(i))%></option>
       <%   }
      } %></select></td>
         <% 
          ArrayList<String> asqaauditors=new ArrayList<String>();
         asqaauditors=asqainfo.getasqaauditoName();
         /* ResultSet res1=stm.executeQuery("SELECT * FROM auditors WHERE empcategory NOT LIKE 'auditor' ");
          while(res1.next())
          {
            alauditors.add(res1.getString("auditorsname"));
          }*/%>
           <td><select name="auditorname" class="selsize" id="auditorname" required disabled>
               <%for(int j=0;j<asqaauditors.size();j++){
               if(asqaauditors.get(j).equalsIgnoreCase(qaaudname)){  
               %>
               <option name="<%=asqaauditors.get(j)%>" value="<%=asqaauditors.get(j)%>" selected>
                      <%=asqaauditors.get(j)%></option>
                      <%}
                      else{%>
                               <option name="<%=asqaauditors.get(j)%>" value="<%=asqaauditors.get(j)%>">
                      <%=asqaauditors.get(j)%></option>
                            <%}
}%>
                  </select>
            </td>
            <td><input type="submit" disabled id="submit" value="SUBMIT"></td></tr></table>
 
 
       <% 
   if(lauditorName.size()>0)
{
    %>
    <div id="wrapper">
           
             
    <table class="asqares" id="keywords" name="asqares">
      <thead>
        <tr><th><span>S. No</span></th><th><span>Auditor Name</span></th><th><span>Client Name</span></th><th><span>Performance Time in Hrs</span></th></tr></thead>
       <tbody> <%
        for(int i=0;i<lauditorName.size();i++)
        {
        total=total+lqaperformanceTime.get(i);
        %>
        <tr>
          <td><%=i+1%></td>
            <td><%=lauditorName.get(i)%></td>
            <td><%=lclientName.get(i)%></td>
            
            <td><%=df.format(lqaperformanceTime.get(i))%></td>
        </tr>  
        <%}
        %></tbody>
        <tr><td colspan="3" style="text-align: right"><strong>Total</strong></td><td><strong><%=df.format(total)%></strong></td></tr>
    </table></div>
    <%}
else
{
    %>
    <p>No results available for this selection.</p><%
}
 session.setAttribute("asqachecklistres", sessionval);
   }%>
    </form>
  </body>
</html>