<%-- 
    Document   : envysionresults1
    Created on : Jan 6, 2015, 6:31:52 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.taskinsert.EnvysionBean"%>
<%@page import="rva.showperformance.EnvyptProcessing"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Envysion Results</title>
    <style>
        #envyres,#envyres tr,#envyres th,#envyres td{
            border:1px solid #fff;
            border-collapse: collapse;
        }
        #envyres{
            width:99%;
            margin:2px 2px 5px 2px;
        }
       #envyres th
        {
            background-color: lightblue;
        }
       #envyres td,#envyres th{
            margin:2px;
        }
       #envyres tr:nth-child(odd){
            background-color : aliceblue;
        }
       #envyres tr:nth-child(even){
            background-color : ffffff;
        }
       #envyres td:last-child{
          text-align: right;
        } 
    </style>
  </head>
  <%
  ArrayList<String> lauditorName=new ArrayList<String>();
  ArrayList<String> ltaskName=new ArrayList<String>();
  ArrayList<String> lcafeName=new ArrayList<String>();
  ArrayList<String> lstartDate=new ArrayList<String>();
  ArrayList<String> lendDate=new ArrayList<String>();
  ArrayList<String> ldatadate=new ArrayList<String>();
  ArrayList<String> ltaskcount=new ArrayList<String>();
  ArrayList<Float> lperformTime=new ArrayList<Float>();
  EnvysionBean envybean=(EnvysionBean) session.getAttribute("envyresults");
  lauditorName=envybean.getauditorsname();
  ltaskName=envybean.gettasksName();
  lcafeName=envybean.getcafesName();
  lstartDate=envybean.getlStartdate();
  lendDate=envybean.getlEnddate();
  ldatadate=envybean.getlDatadate();
  ltaskcount=envybean.gettaskCount();
  lperformTime=envybean.getperformancetime();
  String datadate=envybean.getDatadate();
  
  %>
  <body>
    <strong>Envysion Performance Report</strong>
    <table id="envyres">
      
      <%if(lauditorName.size()>0){
    DecimalFormat dc=new DecimalFormat("0.00");
    float total=0.00f;
   // out.println(lauditorName.size());
    %>
    <tr><th>S.No</th><%if(datadate!=null){%><th>Performed Date</th><th>Data Date</th><th>Task Count</th><%}else{}%><th>Auditor Name</th><th>Cafe Name</th><th>Task Name</th><th>Performance Time in Hours</th></tr>    
<%
    
    for(int i=0;i<lauditorName.size();i++){
      
total=total+lperformTime.get(i);
%>
      <tr><td><%=i+1%></td>
        <%
        if(datadate!=null){%>
        <td><%=lstartDate.get(i)%></td>
        <td><%=ldatadate.get(i)%></td>
        <td><%=ltaskcount.get(i)%></td>
        
        <%}else{}
        %>
        <td><%=lauditorName.get(i)%></td>
        <td><%=lcafeName.get(i)%></td>
        <td><%=ltaskName.get(i)%></td>
       
        <td><%=dc.format(lperformTime.get(i))%></td></tr>
      
   <% }
   if(datadate==null){%>
   %>
   <tr><td colspan="4">Total</td><td><%=dc.format(total)%></td></tr>
   <%}
   else{}
    }else{%>  
<p>No Tasks Available for this selection</p>
<%}%>
    </table>
  </body>
</html>
