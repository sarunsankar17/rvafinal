<%@page import="rva.administrator.ChangeDateFormat"%>
<%@page import="rva.showperformance.EnvyInfo"%>
<%@page import="rva.userlogin.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.taskinsert.RetelTasks"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.taskinsert.EnvysionBean"%>
<%@page import="rva.showperformance.EnvyptProcessing"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Envysion Performance Update</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />-->

<link href="cssfiles/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
  <script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<%
ArrayList<String> laudname=new ArrayList<String>();
ArrayList<String> lcafename=new ArrayList<String>();
ArrayList<String> ltaskname=new ArrayList<String>();
String audAccesslevel;
String auditorName;
LogBean lb=(LogBean) session.getAttribute("currloginsession");
audAccesslevel=(String) lb.getAccesslevel();
auditorName=(String) lb.getAuditorname();
EnvyInfo eninfo=new EnvyInfo();
laudname=eninfo.getenaudname();
lcafename=eninfo.getencafename();
ltaskname=eninfo.getentaskname();
%>
<style>
   #envychecklist{
            background-color: aliceblue;
            margin-bottom: 10px;
        }
       #envychecklist th
        {
           text-align: left; 
           width:100px;
        }
        #submit{
          width:100px;
        }
       #envychecklist input,#envychecklist select{
          width:100px;
        }
        #envychecklist,#envychecklist th,#envychecklist tr,#envychecklist td
         {
           border-collapse: collapse;
          } 
       #envychecklist .radiobut{
            width:auto;
        } 
        
       
</style>
<script>
          $(document).ready(function(){
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-1);
            $("#stdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,defaultDate:maxDate,maxDate: maxDate,minDate:new Date(2014,00,01),
//              onSelect: function(selected){
//                $("#endate").datepicker("option","minDate",selected);
//                //$("#datadate").prop("disabled",true);
//              }
            });
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-1);
            $("#endate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,defaultDate:maxDate,maxDate: maxDate,minDate:new Date(2014,00,01),
            onSelect: function(selected){
              $("#stdate").datepicker("option","maxDate",selected);
            }           
            });
          });
</script>
           <script>
          $(document).ready(function(){
            var date=new Date();
             var minDate=new Date(2015,00,01); 
             var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-1);
            $("#datadate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: maxDate,minDate:minDate,defaultDate:new Date()  
            });
          });
    </script>
    <script>
      function checkdate(value){
          if(value=="sedate"){
              $(".sedate").prop("disabled",false);
              $(".dtdate").prop("disabled",true);
              $(".dtdate").prop("value","");
              //alert("welcome");
       }
       else{
           $(".sedate").prop("disabled",true);
              $(".dtdate").prop("disabled",false);
              $(".sedate").prop("value","");
       }
      }
</script>
<script>
 function modifysearch(){
  document.getElementById("serad").disabled=false;
  document.getElementById("dtrad").disabled=false;
  document.getElementById("audname").disabled=false;
  document.getElementById("scname").disabled=false;
  document.getElementById("stname").disabled=false;
  document.getElementById("submit").disabled=false;
 var ddate=document.getElementById("datadate").value;
 if(ddate==""){
  document.getElementById("stdate").disabled=false;
  //document.getElementById("endate").disabled=false;
 }
 else{
   document.getElementById("datadate").disabled=false;
 }
 }
</script>
</head>
<%
  ArrayList<String> lauditorName=new ArrayList<String>();
  ArrayList<String> ltaskName=new ArrayList<String>();
  ArrayList<String> lcafeName=new ArrayList<String>();
  ArrayList<String> lstartDate=new ArrayList<String>();
  //ArrayList<String> lendDate=new ArrayList<String>();
  ArrayList<String> ldatadate=new ArrayList<String>();
  ArrayList<String> ltaskcount=new ArrayList<String>();
  ArrayList<Float> lperformTime=new ArrayList<Float>();
  ArrayList<String> lrowno=new ArrayList<String>();
  ChangeDateFormat cdf=new ChangeDateFormat();
  EnvysionBean envybean=(EnvysionBean) session.getAttribute("envypuresults");
  String defres=null;
  String process="addnew";
  %>

<body>
  <strong> Envysion Performance Report Update</strong><br><br>
   <% 
  LogBean lb2=(LogBean)session.getAttribute("currloginsession");
  String accessl=lb2.getAccesslevel();
  if(!accessl.equalsIgnoreCase("Auditor")&&(!accessl.equalsIgnoreCase("QAAuditor"))){
  %>
  <a href="updateenvyperformance.jsp?process=<%=process%>"><button>Add New</button></a>
  <%}%>
        <div class="mainbod">
          <form action="EnvysionPerformanceUpdate" method="POST">
            <%
             if(envybean==null){
             %>
           <table id="envychecklist"><tr><th>Date Select</th><th>Perform Date</th><th>Data Date</th><th>Auditor Name</th><th>Cafe Name</th><th>Task Name</th><td><input type="button" id="modify" value="MODIFY"></td></tr>
                <tr><td>
                        <input type="radio" id="serad" name="datesel" onclick="checkdate(this.value)" class="radiobut" value="sedate">Perform Date
                        <input type="radio" id="dtrad" name="datesel" onclick="checkdate(this.value)" class="radiobut" value="dtdate">Data Date
                    </td><td><input type="text" class="sedate" id="stdate" autocomplete="off" name="performdate" disabled required></td>
                    
            <td><input type="text" class="dtdate" id="datadate" autocomplete="off" name="datadate" required disabled ></td>
            <td><select id="audname" class="insize" name="auname" required>
                <option name="auditor" value="selectall">-Select All-</option>
              <%for(int i=0;i<laudname.size();i++)
              {%>
            <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"><%=laudname.get(i)%></option>
          <% }%>
        </select>   
              </td>
          <td><select id="scname" class="insize" name="cafename" required>
            <option name="cafe" value="selectall">-Select All-</option>
              <%for(int i=0;i<lcafename.size();i++)
              {%>
            <option name="<%=lcafename.get(i)%>" id="<%=lcafename.get(i)%>" value="<%=lcafename.get(i)%>"/><%=lcafename.get(i)%></option>
          <%}%>
        </select></td>
             <td><select id="stname" class="insize" name="taskname" required>
                 <option name="task" value="selectall">-Select All-</option>
              <%for(int i=0;i<ltaskname.size();i++)
              {%>
            <option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
          <%}%>
        </select></td>
        <td><input type="submit" id="submit" value="SUBMIT"></td></tr></table>
  <%}else{
  lauditorName=envybean.getauditorsname();
  ltaskName=envybean.gettasksName();
  lcafeName=envybean.getcafesName();
  lstartDate=envybean.getlStartdate();
  //lendDate=envybean.getlEnddate();
  ldatadate=envybean.getlDatadate();
  ltaskcount=envybean.gettaskCount();
  lperformTime=envybean.getperformancetime();
  lrowno=envybean.getRowno();
  String datadate=envybean.getDatadate();
  String stDate=null;
  String enDate=null;
  if(datadate==null){
  stDate=cdf.dbDatetoAppDate(envybean.getstartDate());
  enDate=cdf.dbDatetoAppDate(envybean.getendDate());
  }
  else{
    datadate=cdf.dbDatetoAppDate(datadate);
  }
  String audName=envybean.getauditorName();
  String cafeName=envybean.getcafeName();
  String taskName=envybean.gettaskName();
  
  %>
  <table id="envychecklist"><tr><th>Date Select</th><th>Perform Date</th><th>Data Date</th><th>Auditor Name</th><th>Cafe Name</th><th>Task Name</th><td><input type="button" id="modify" onclick="modifysearch()" value="MODIFY"></td></tr>
                <tr><td>
                    <%if(datadate==null){%>
                    <input type="radio" id="serad" name="datesel" onclick="checkdate(this.value)" disabled checked class="radiobut" value="sedate">Perform Date
                    <input type="radio" id="dtrad" name="datesel" onclick="checkdate(this.value)" disabled class="radiobut" value="dtdate">Data Date<%}
                    else{%>
                       <input type="radio" id="serad" name="datesel" onclick="checkdate(this.value)" disabled class="radiobut" value="sedate">Perform Date
                       <input type="radio" id="dtrad" name="datesel" onclick="checkdate(this.value)" disabled checked class="radiobut" value="dtdate"> Data Date
                   <% }
                        %>
                    </td><td>
                     <%if(datadate==null){%>
                      <input type="text" class="sedate" id="stdate" autocomplete="off" name="performdate" value="<%=stDate%>" disabled required><%}
                     else{%>
                        <input type="text" class="sedate" id="stdate" autocomplete="off" name="performdate" disabled required>
                     <%}%></td>
                
            <td><%if(datadate==null){%>
              <input type="text" class="dtdate" id="datadate" autocomplete="off" name="datadate" required disabled >
            <%}else{%><input type="text" class="dtdate" id="datadate" autocomplete="off" name="datadate" disabled required value="<%=datadate%>"><%}%>
            </td>
            <td><select id="audname" class="insize" name="auname" disabled required>
                <%if(audName.equalsIgnoreCase("selectall")){
                %>
                <option name="auditor" value="selectall" selected>-Select All-</option>
              <%for(int i=0;i<laudname.size();i++)
              {%>
            <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"><%=laudname.get(i)%></option>
          <% }}
                else{%>
                  <option name="auditor" value="selectall">-Select All-</option>
                  <%for(int i=0;i<laudname.size();i++){
                    if(laudname.get(i).equalsIgnoreCase(audName)){%>
                    <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>" selected><%=laudname.get(i)%></option>
                    <%}
                    else{%>
                      <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"><%=laudname.get(i)%></option>
                   <% }
                  }}%>
        </select>   
              </td>
          <td><select id="scname" class="insize" name="cafename" disabled required>
              <%if(cafeName.equalsIgnoreCase("selectall")){
                %>
                <option name="cafe" value="selectall" selected>-Select All-</option>
              <%for(int i=0;i<lcafename.size();i++)
              {%>
            <option name="<%=lcafename.get(i)%>" id="<%=lcafename.get(i)%>" value="<%=lcafename.get(i)%>"/><%=lcafename.get(i)%></option>
          <%}}
              else{%><option name="cafe" value="selectall">-Select All-</option>
                <%for(int i=0;i<lcafename.size();i++)
              {
             if(lcafename.get(i).equalsIgnoreCase(cafeName)){%>
             <option name="<%=lcafename.get(i)%>" id="<%=lcafename.get(i)%>" value="<%=lcafename.get(i)%>" selected><%=lcafename.get(i)%></option>
             <%}
             else{%><option name="<%=lcafename.get(i)%>" id="<%=lcafename.get(i)%>" value="<%=lcafename.get(i)%>"><%=lcafename.get(i)%></option>
<%}}}%>
        </select></td>
             <td><select id="stname" class="insize" name="taskname" disabled required>
                 <%if(taskName.equalsIgnoreCase("selectall")){%>
                 <option name="task" value="selectall" selected>-Select All-</option>
              <%for(int i=0;i<ltaskname.size();i++)
              {%>
            <option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
            <%}}else{%> <option name="task" value="selectall">-Select All-</option>
                 <%for(int i=0;i<ltaskname.size();i++){
                   if(ltaskname.get(i).equalsIgnoreCase(taskName)){%>
                   <option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>" selected><%=ltaskname.get(i)%></option>
                     <%}else{
                   %><option name="<%=ltaskname.get(i)%>" id="<%=ltaskname.get(i)%>" value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
                     <%}}}%>
        </select></td>
        <td><input type="submit" id="submit" disabled value="SUBMIT"></td></tr></table>
  
            <%
 if(lauditorName.size()>0){
   DecimalFormat dc=new DecimalFormat("0.00");
    float total=0.00f;
   // out.println(lauditorName.size());
    %>
    <div id="wrapper">
   <table id="keywords">
     <thead>
       <tr><th><span>S.No</span></th><th><span>Perform Date</span></th><th><span>Data Date</span></th><th><span>Task Count</span></th><th><span>Auditor Name</span></th><th><span>Cafe Name</span></th><th><span>Task Name</span></th><th><span>Performance Time in Minutes</span></th><th></th></tr></thead> 
     <tbody>     
<%for(int i=0;i<lauditorName.size();i++){  
total=total+lperformTime.get(i);
%>
      <tr><td><%=i+1%></td>
        
        <td><%=lstartDate.get(i)%></td>
        <td><%=ldatadate.get(i)%></td>
        <td><%=ltaskcount.get(i)%></td>
        <td><%=lauditorName.get(i)%></td>
        <td><%=lcafeName.get(i)%></td>
        <td><%=ltaskName.get(i)%></td>
        <td><%=dc.format(lperformTime.get(i))%></td>
        <%process="update";%>
        <td><a href="updateenvyperformance.jsp?rowno=<%=lrowno.get(i)%>&process=<%=process%>" method="post">Update</a></td></tr>
   <% }%>
</tbody>
 </table></div>
 <%} 
 else{%>
   <p>No Results Available For Your Selection.</p>
 <%
 } session.setAttribute("envypuresults", defres);
  }
 %>
</form>
</div>
</body>
</html>
