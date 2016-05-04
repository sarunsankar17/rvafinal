<%@page import="rva.showperformance.DttInfo"%>
<%@page import="rva.userlogin.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.taskinsert.RetelTasks"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.taskinsert.DTTBean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>DTT Checklist</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="cssfilefs/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<%
ArrayList<String> laudname=new ArrayList<String>();
ArrayList<String> ltaskname=new ArrayList<String>();
String audAccesslevel;
String auditorName;
LogBean lb=(LogBean) session.getAttribute("currloginsession");
audAccesslevel=(String) lb.getAccesslevel();
auditorName=(String) lb.getAuditorname();
DttInfo dttinfo=new DttInfo();
ltaskname=dttinfo.getdtttaskname();
laudname=dttinfo.getdttaudname();
%>
<script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
<style>
    #dttchecklist{
            width:430px;
            background-color: aliceblue;
            margin-bottom: 10px;
        }
       #dttchecklist th
        {
           text-align: left; 
           width:auto;
        }
       #dttchecklist td:nth-child(){
            text-align:left;
            width:100px;
        }
       #modify, #submit{
          width:100px;
        }
       #dttchecklist select{
          width:200px;
        }
       #dttchecklist input{
          width:130px;
        }
        #dttchecklist table,#dttchecklist th,#dttchecklist tr,#dttchecklist td
         { border-collapse: collapse;
         } 
        
</style>
<script>
  $(document).ready(function(){
    $("#modify").click(function(){
     $("#stdate").attr("disabled",false);
     $("#endate").attr("disabled",false);
     $("#audname").attr("disabled",false);
     $("#stname").attr("disabled",false);
     $("#submit").attr("disabled",false);
    });
  });
</script>
       <script>
          $(document).ready(function(){
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            $("#stdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: maxDate,minDate:new Date(2014,00,01),
              onSelect: function(selected){
                $("#endate").datepicker("option","minDate",selected)
              }
            });
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            $("#endate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: maxDate,minDate:new Date(2014,00,01),
            onSelect: function(selected){
              $("#stdate").datepicker("option","maxDate",selected)
            }           
            });
          });
     </script>
</head>
<%
  ArrayList<String> lauditorName=new ArrayList<String>();
  ArrayList<String> ltaskName=new ArrayList<String>();
  ArrayList<String> lstartDate=new ArrayList<String>();
  ArrayList<String> lendDate=new ArrayList<String>();
  ArrayList<Float> lperformTime=new ArrayList<Float>();
  DTTBean dttbean=(DTTBean) session.getAttribute("dttresults");
  String defres=null;
  %>
<body>
  <strong>DTT Performance Report</strong>
       <%
       %>
        <form action="DTTPerformanceResults" method="POST">
          <%if(dttbean==null){
          %>
           <table id="dttchecklist">
             <tr><th>Start Date</th><th>End Date</th><th>Auditor Name</th><th>Select Task Name</th><td><input type="button" id="modify" onclick="modifysearch()" value="MODIFY"></td></tr>
             <tr>
              <td><input type="text" class="insize" id="stdate" autocomplete="off" name="performdate" required></td>
           <td> <input type="text" class="insize" id="endate" autocomplete="off" name="enddate" required></td>
            <td><select id="audname" class="insize" name="auname" required>
                <option name="auditor" value="selectall">-Select All-</option>
              <%for(int i=0;i<laudname.size();i++)
              {%>
            <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"/><%=laudname.get(i)%></option>
          <% }%>
        </select></td>
        <td><select id="stname" class="insize" name="taskname" required>
                 <option name="task" value="selectall">-Select All-</option>
              <%for(int i=0;i<ltaskname.size();i++)
              {%>
            <option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
          <%}%>
        </select></td><td><input type="submit" id="submit" value="SUBMIT"></td></tr>
</table>
        <%}
          else{
  lauditorName=dttbean.getauditorsname();
  ltaskName=dttbean.gettasksname();
  lstartDate=dttbean.getstartDateApp();
  lendDate=dttbean.getendDateApp();
  lperformTime=dttbean.getperformancetime(); 
  String stdate=dttbean.getstartdateapp();
  String endate=dttbean.getenddateapp();
  String tname=dttbean.gettaskname();
  String audname=dttbean.getauditorname();
  %>
            <table id="dttchecklist">
             <tr><th>Start Date</th><th>End Date</th><th>Auditor Name</th><th>Select Task Name</th><td><input type="button" id="modify" onclick="modifysearch()" value="MODIFY"></td></tr>
             <tr>
              <td><input type="text" class="insize" id="stdate" value="<%=stdate%>" autocomplete="off" name="performdate" disabled required></td>
           <td> <input type="text" class="insize" id="endate" value="<%=endate%>" autocomplete="off" disabled name="enddate" required></td>
            <td><select id="audname" class="insize" disabled name="auname" required>
                <%
                if(tname.equalsIgnoreCase("-selectall-")){
                %>
                <option name="auditor" value="selectall" selected>-Select All-</option>
                <%
                for(int i=0;i<laudname.size();i++)
              {%>
            <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"/><%=laudname.get(i)%></option>
          <% }}
                else{%><option name="auditor" value="selectall">-Select All-</option>
                  <%
                for(int i=0;i<laudname.size();i++){
                  if(laudname.get(i).equalsIgnoreCase(audname)){%>
                    <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"selected><%=laudname.get(i)%></option>
                 <% }
                  else{%>
                    <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"><%=laudname.get(i)%></option>
                 <% }
                }
                }
          %>
        </select></td>
        <td><select id="stname" class="insize" disabled name="taskname" required>
                
              <%
                if(tname.equalsIgnoreCase("-selectall-")){%>
                <option name="task" value="selectall" selected>-Select All-</option>
              <%  for(int i=0;i<ltaskname.size();i++)
              {%>
            <option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
          <%}}
                else{%> <option name="task" value="selectall">-Select All-</option>
                  
      <%for(int i=0;i<ltaskname.size();i++){
                  if(ltaskname.get(i).equalsIgnoreCase(tname)){%>
                  <option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>" selected><%=ltaskname.get(i)%></option>
                  <%}
                  else{%>
                    <option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
                 <% }
                }}%>
          </select></td><td><input type="submit" disabled id="submit" value="SUBMIT"></td></tr>
</table>
          <%
          if(lauditorName.size()>0){%>
          <div id="wrapper">
            <table id="keywords">
              <thead>
                <tr><th><span>S.No</span></th><th><span>Auditor Name</span></th><th><span>Task Name</span></th><th><span>Performance Time in Hours</span></th></tr></thead>    
              <tbody>              
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
   <%}%></tbody>
      <tr><td colspan="3" style="text-align: right"><strong>Total</strong></td><td><strong><%=dc.format(total)%></strong></td></tr>
              
            </table></div>
         <% }
          else{%>
         <p>No Results Available For Your Selection.</p>
         <% }
          session.setAttribute("dttresults", defres);
          }
          
  %>
</form>
</body>
</html>
