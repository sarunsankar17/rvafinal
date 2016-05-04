<%-- 
    Document   : asresults
    Created on : Sep 13, 2014, 7:06:24 AM
    Author     : RCT-456
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.showperformance.ASChecklistBean"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AS Results</title>
    <style>
        #asresults,#asresults tr,#asresults th,#asresults td{
            border:1px solid #fff;
            border-collapse: collapse;
        }
        #asresults{
            width:99%;
            margin:2px 2px 5px 2px;
        }
      #asresults  th
        {
            background-color: lightblue;
        }
       #asresults td,#asresults th{
            margin:2px;
        }
       #asresults tr:nth-child(odd){
            background-color : aliceblue;
        }
       #asresults tr:nth-child(even){
            background-color : ffffff;
        }
        #asresults td:last-child{
          text-align: right;
        }
    </style>
    <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        <script>
          $(document).ready(function(){
            $("#exporttoexcel").click(function(){
             $("#asresults").btechco_excelexport({
               containerid:"asresults",
               datatype: $datatype.Table
             });
            });
          });
          </script>
  </head>
  <body>
    <strong>AS Performance Results</strong>
    <%
  // ChecklistBean cklBean=new ChecklistBean();
   ArrayList<String> laudName=new ArrayList<String>();
   ArrayList<String> lcliName=new ArrayList<String>();
   ArrayList<String> llocateName=new ArrayList<String>();
   ArrayList<String> lstartDate=new ArrayList<String>();
   ArrayList<String> lendDate=new ArrayList<String>();
   ArrayList<Float> ltimetoPerform=new ArrayList<Float>();
   ArrayList<String> lshiftTime=new ArrayList<String>();
   float totalResult=0.00f;
   ASChecklistBean clb=(ASChecklistBean) session.getAttribute("currentclvalues");
   laudName=clb.getlauditorName();
          if(laudName.size()<0)
          {
            laudName=clb.getlauditorName();
            lcliName=clb.getlclientName();
            llocateName=clb.getllocationName();
            lstartDate=clb.getlstartDate();
            lendDate=clb.getlendDate();
            lshiftTime=clb.getlshiftTime();
           ltimetoPerform=clb.getltimetoPerform();
           %>
          
           <table id="asresults">
             <tr><th>S.No</th><th>Client Name</th><th>Location name</th><th>Shift</th><th>Auditor Name</th><th>Performance Time in hrs</th></tr>
               <%
           DecimalFormat dc=new DecimalFormat("0.00");
           for(int i=0;i<laudName.size();i++)
           {
               
               %>
               <tr>
                 <td><%=i+1%></td>
                   <td><%=lcliName.get(i)%></td>
                   <td><%=llocateName.get(i)%></td>
                   
                   <td><%=lshiftTime.get(i)%></td>
                   <td><%=laudName.get(i)%></td>
                   <td><%=dc.format(ltimetoPerform.get(i))%>
                   </td></tr>
               
               <%
               totalResult=ltimetoPerform.get(i)+totalResult;
           }
           %>
           <tr><td colspan="5">Total</td><td><%=dc.format(totalResult)%></td></tr>
           </table>
         <% }
   else
   {%>
   <p>No Tasks Available for your selection!</p>
   <%}
      %>
  </body>
</html>
