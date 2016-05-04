<%@page import="rva.administrator.ChangeDateFormat"%>
<%@page import="rva.userlogin.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.taskinsert.RetelTasks"%>
<%@page import="rva.showperformance.RetelBean"%>
<%@page import="rva.showperformance.RetelInfo"%>
<%@page import="rva.showperformance.RetelResProcessing"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Retel Task Counts</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />-->

<link href="cssfilefs/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<%
    RetelInfo retinfo=new RetelInfo();
    ChangeDateFormat cdf=new ChangeDateFormat();
ArrayList<String> lrtname=new ArrayList<String>();
ArrayList<String> laudname=new ArrayList<String>();
String audAccesslevel;
String auditorName;
lrtname=retinfo.getrtaskname();
laudname=retinfo.getraudname();
lrtname.remove("Demography Through 140 Store");
LogBean lb=(LogBean) session.getAttribute("currloginsession");
audAccesslevel=(String) lb.getAccesslevel();
auditorName=(String) lb.getAuditorname();
%>
<link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
  <script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
<style>
   #retelchecklist{
            //margin-left: 60px;
            width:auto;
            //align:center;
            background-color: aliceblue;
            margin-bottom: 10px;
        }
        
       #retelchecklist th
        {
           text-align: left; 
           width:auto;
           //width:1%;
        }
       #modify, #submit{
          width:120px;
          //margin-top:10px;
        }
        .insize select{
          width:250px;
        }
        
         #retelchecklist,#retelchecklist th,#retelchecklist tr,#retelchecklist td
         { border-collapse: collapse;
          } 
        #retelchecklist input{
            width:120px;
        }
        
</style>
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
          <script>
            function modifysearch(){
              document.getElementById("stdate").disabled=false;
              document.getElementById("endate").disabled=false;
              document.getElementById("stname").disabled=false;
              document.getElementById("audname").disabled=false;
              document.getElementById("submit").disabled=false;
            }
          </script>
</head>
<%
         ArrayList<String> launame=new ArrayList<String>();
         ArrayList<String> ltname=new ArrayList<String>();
         ArrayList<Integer> laucount=new ArrayList<Integer>();
         ArrayList<String> lsdate=new ArrayList<String>();
         ArrayList<String> ledate=new ArrayList<String>();
         int radVal=0;
         int totaltasks=0;
         String retres=null;
         RetelBean rb=(RetelBean) session.getAttribute("rrpres");
         %>
<body>
  <strong>Retel Performance Report</strong><br><br>
        <form action="RetelResults" method="POST">
            <%if(rb==null){
            %>
           <table id="retelchecklist">
               <tr><th>Start Date</th><th>End Date</th><th>Auditor Name</th><th>Select Task Name</th><td><input type="button" id="button" value="MODIFY"></td></tr>
               <tr>      
                <td> <input type="text" class="insize" id="stdate" autocomplete="off" name="performdate" required></td>
          <td> <input type="text" class="insize" id="endate" autocomplete="off" name="enddate" required></td>
            <td><select id="audname"class="insize" name="auname" required>
                <option value="-selectall-">-Select All-</option>
              <%for(int i=0;i<laudname.size();i++)
              {%>
            <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"/><%=laudname.get(i)%></option>
          <% }%>
        </select>
              </td>
            <td><select id="stname" class="insize"name="taskname" required>
                <option value="-selectall-">-Select All-</option>
              <%for(int i=0;i<lrtname.size();i++)
              {
              %>
            <option name="<%=lrtname.get(i)%>" id="<%=lrtname.get(i)%>" value="<%=lrtname.get(i)%>"/><%=lrtname.get(i)%></option>
          <%   }%>
        </select></td>
           <td><input type="submit" id="submit" value="SUBMIT"></td></tr>
</table>
        <%} else{
        String stdate=cdf.dbDatetoAppDate(rb.getPerformDate());
         String endate=cdf.dbDatetoAppDate(rb.getEPerformDate());
         String tname=rb.getTaskName();
         String aname=rb.getAuditorName();
        %>
            
         <table id="retelchecklist">
               <tr><th>Start Date</th><th>End Date</th><th>Auditor Name</th><th>Select Task Name</th><td><input type="button" id="button" onclick="modifysearch()" value="MODIFY"></td></tr>
               <tr>      
                <td> <input type="text" class="insize" id="stdate" autocomplete="off" value="<%=stdate%>" name="performdate" disabled required></td>
          <td> <input type="text" class="insize" id="endate" autocomplete="off" name="enddate" value="<%=endate%>" disabled required></td>
            <td><select id="audname"class="insize" name="auname" disabled required>
                <%if(aname.equalsIgnoreCase("-selectall-")){%>
                <option value="-selectall-" selected>-Select All-</option>
              <%for(int i=0;i<laudname.size();i++)
              {%>
            <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"/><%=laudname.get(i)%></option>
          <% }}
                else{%>
              <option value="-selectall-">-Select All-</option>
              <%
                  for(int i=0;i<laudname.size();i++){
                    if(laudname.get(i).equalsIgnoreCase(aname)){%>
                    <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>" selected><%=laudname.get(i)%></option> 
                    <%}
                    else{%>
                      <option name="<%=laudname.get(i)%>" id="<%=laudname.get(i)%>" value="<%=laudname.get(i)%>"><%=laudname.get(i)%></option> 
                  <%  }
                  }
  }%>
        </select>
              </td>
            <td><select id="stname" class="insize" name="taskname" disabled required>
                <%if(tname.equalsIgnoreCase("-selectall-")){
                %>
                <option value="-selectall-" selected>-Select All-</option>
              <%for(int i=0;i<lrtname.size();i++)
              {
              
              %>
            <option name="<%=lrtname.get(i)%>" id="<%=lrtname.get(i)%>" value="<%=lrtname.get(i)%>"/><%=lrtname.get(i)%></option>
          <%   
              }
                }
                else{%>
             <option value="-selectall-">-Select All-</option>     
 <%
               for(int i=0;i<lrtname.size();i++) {
                 if(lrtname.get(i).equalsIgnoreCase(tname)){%>
                   <option name="<%=lrtname.get(i)%>" id="<%=lrtname.get(i)%>" value="<%=lrtname.get(i)%>" selected><%=lrtname.get(i)%></option>
                 <%}
                 else{%>
                   <option name="<%=lrtname.get(i)%>" id="<%=lrtname.get(i)%>" value="<%=lrtname.get(i)%>"><%=lrtname.get(i)%></option>
                 <%}
               }
               }%>
              
        </select></td>
        <td><input type="submit" disabled id="submit" value="SUBMIT"></td></tr>
         </table>
         <%
             
            ltname=rb.getlTaskName();
         if(ltname.size()>0)
         {
         launame=rb.getlAuditorName();
         ltname=rb.getlTaskName();
         lsdate=rb.getlPerformDate();
         ledate=rb.getlEDate();
         laucount=rb.getlAuditCount();
         radVal=rb.getRadVal();    
         
         %>
         <div id="wrapper">
           <table id="keywords"><thead><tr><th><span>S.No</span></th><th><span>Task Name</span></th><th><span>Auditor Name</span></th><th><span>Total</span></th></tr></thead>
             <tbody>
         <%
             for(int i=0;i<launame.size();i++)
             {
             %>
             <tr>
               <td><%=i+1%></td>
               <td><%=ltname.get(i)%></td>
                 <td><%=launame.get(i)%></td>
                
                 <td><%=laucount.get(i)%></td></tr>
                 
             <%totaltasks=totaltasks+laucount.get(i);
             }%></tbody><%
             if(radVal>0)
             {%>
             <tr><td colspan="3">140 Store</td><td><%=radVal%></td></tr>
             
             <%}%>
           <tr><td colspan="3" style="text-align: right"><strong>Total Tasks Performed</strong></td><td><strong><%=totaltasks%></strong></td></tr>
         </table></div>
         <%}
         else{
           %>
           <p>No Results Available For Your Selection.</p>
         <%} session.setAttribute("rrpres",retres);
            }
           
        %>
</form>
</body>
</html>
