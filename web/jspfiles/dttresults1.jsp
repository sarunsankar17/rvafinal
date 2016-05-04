<%-- 
    Document   : envysionresults1
    Created on : Jan 6, 2015, 6:31:52 PM
    Author     : RCT-456
--%>

<%@page import="rva.taskinsert.DTTBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.taskinsert.EnvysionBean"%>
<%@page import="rva.showperformance.EnvyptProcessing"%>
<%@page import="rva.showperformance.RetelBean"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>DTT Results</title>
    <style>
        #dttres, #dttres tr, #dttres th, #dttres td{
            border:1px solid #fff;
            border-collapse: collapse;
        }
         #dttres{
            width:99%;
            margin:2px 2px 5px 2px;
        }
        #dttres th
        {
            background-color: lightblue;
        }
        #dttres td, #dttres th{
            margin:2px;
        }
        #dttres tr:nth-child(odd){
            background-color : aliceblue;
        }
        #dttres tr:nth-child(even){
            background-color : ffffff;
        }
        #dttres td:last-child{
          text-align: right;
        }
    </style>
  </head>
  <%
  ArrayList<String> lauditorName=new ArrayList<String>();
  ArrayList<String> ltaskName=new ArrayList<String>();
  ArrayList<String> lstartDate=new ArrayList<String>();
  ArrayList<String> lendDate=new ArrayList<String>();
  ArrayList<Float> lperformTime=new ArrayList<Float>();
  DTTBean dttbean=(DTTBean) session.getAttribute("dttresults");
  lauditorName=dttbean.getauditorsname();
  ltaskName=dttbean.gettasksname();
  lstartDate=dttbean.getstartDateApp();
  lendDate=dttbean.getendDateApp();
  lperformTime=dttbean.getperformancetime();
  
  %>
  <body>
    <strong>DTT Performance Report</strong>
    <table id="dttres"><%if(lauditorName.size()>0){%>
      <tr><th>S.No</th><th>Auditor Name</th><th>Task Name</th><th>Performance Time in Hours</th></tr>    
<%
      float total=0.00f;
      DecimalFormat dc=new DecimalFormat("0.00");
    for(int i=0;i<lauditorName.size();i++){

total=total+lperformTime.get(i);
%>
      <tr><td><%=i+1%></td>
        <td><%=lauditorName.get(i)%></td>
        <td><%=ltaskName.get(i)%></td>
        <td><%=dc.format(lperformTime.get(i))%></td></tr>
   <% }%>
   <tr><td colspan="5">Total</td><td><%=dc.format(total)%></td></tr>
    <%}else{%>  
<p>No Tasks Available for this selection</p>
<%}%>
    </table>
  </body>
</html>
