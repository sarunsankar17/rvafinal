<%@page import="rva.showperformance.ASInfo"%>
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
<%@page import="rva.showperformance.EnvyInfo"%>
<%@page import="rva.administrator.ChangeDateFormat"%>
<html><head>
<script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
         <script>
          $(document).ready(function(){
            var date=new Date();
             var minDate=new Date(2015,00,01);
            $("#perdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:minDate,defaultDate:new Date()  
            });
          });
            </script>
           <script>
          $(document).ready(function(){
            var date=new Date();
             var minDate=new Date(2015,00,01);
             $("#datadate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:minDate,defaultDate:new Date()
              });
          });
          </script>
  </head>
  <body>

<%
String rowno=request.getParameter("rowno");
String process=request.getParameter("process");
Connection con=DBConnect.startConnection();
String cafename=null;
String taskname=null;
String auditorname=null;
String startdate=null;
String datadate=null;
String taskcount=null;
String performancetime=null;
session.setAttribute("envyrn", rowno);
ArrayList<String> lcafename=new ArrayList<String>();
ArrayList<String> ltaskname=new ArrayList<String>();
ArrayList<String> lauditorname=new ArrayList<String>();
ChangeDateFormat cdf=new ChangeDateFormat();
try{
  ResultSet res=null;
Statement st=con.createStatement();
EnvyInfo einfo=new EnvyInfo();
lcafename=einfo.getencafename();
ltaskname=einfo.getentaskname();
lauditorname=new ASInfo().getasauditorsName();
res=st.executeQuery("select a.envysionperformancefinalid,a.auditorname,a.datadate, a.timetoperform,a.takscount,b.envysiontaskname,c.envysioncafesname,a.performeddate from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid`  where a.envysionperformancefinalid like '"+rowno+"' ");
while(res.next()){
  auditorname=res.getString("a.auditorname");
  cafename=res.getString("c.envysioncafesname");
  taskname=res.getString("b.envysiontaskname");
  startdate=cdf.dbDatetoAppDate(res.getString("a.performeddate"));
  datadate=cdf.dbDatetoAppDate(res.getString("a.datadate"));
  taskcount=res.getString("a.takscount");
  performancetime=res.getString("a.timetoperform");
  
}%>
<form action="saveenvyperform.jsp?process=<%=process%>" method="post">
  <%if(process.equalsIgnoreCase("update")){%>
  <p><strong>Update Envysion Performance</strong></p>
  <table>
    <tr><th><label>Task Name:</label></th><td>
        <select name="tname" required>
          <%for(int i=0;i<ltaskname.size();i++){
if(ltaskname.get(i).equalsIgnoreCase(taskname)){%>
<option value="<%=ltaskname.get(i)%>" selected><%=ltaskname.get(i)%></option>
<%} 
else{%>
  <option value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
<%}
}%>
        </select>
      </td></tr>
    <tr><th><label>Cafe Name:</label></th>
    <td>
        <select name="cname" required>
          <%for(int i=0;i<lcafename.size();i++){
if(lcafename.get(i).equalsIgnoreCase(cafename)){%>
<option value="<%=lcafename.get(i)%>" selected><%=lcafename.get(i)%></option>
<%} 
else{%>
  <option value="<%=lcafename.get(i)%>"><%=lcafename.get(i)%></option>
<%}
}%>
        </select>
      </td></tr>
    <tr><th><label>Auditor Name:</label></th>
    <td>
        <select name="audname" required>
          <%for(int i=0;i<lauditorname.size();i++){
if(lauditorname.get(i).equalsIgnoreCase(auditorname)){%>
<option value="<%=lauditorname.get(i)%>" selected><%=lauditorname.get(i)%></option>
<%} 
else{%>
  <option value="<%=lauditorname.get(i)%>"><%=lauditorname.get(i)%></option>
<%}
}%>
        </select>
      </td></tr>
    <tr><th><label>Perform Date:</label></th><td><input type="text" id="perdate" name="performdate" required value="<%=startdate%>" autocomplete="off"></td></tr>
    <tr><th><label>Data Date:</label></th><td><input type="text" id="datadate" name="datadate"required value="<%=datadate%>" autocomplete="off"></td></tr>
    <tr><th><label>Task Count:</label></th><td><input type="text" id="tcount" name="taskcount" required value="<%=taskcount%>" autocomplete="off"></td></tr>
    <tr><th><label>Performance Time:</label></th><td><input type="text" id="pt" name="pt" required value="<%=performancetime%>" autocomplete="off"></td></tr>
    <tr><td><input type="submit" value="SAVE VALUES"></td>
      <td><a href="envyperformanceupdate.jsp">Cancel</a></tr>
  </table>
  <%}
  else{%>
  <p><strong>Add Envysion Performance</strong></p>
    <table>
    <tr><th><label>Task Name:</label></th><td>
        <select name="tname" required>
          <option value="">-Select-</option>
          <%for(int i=0;i<ltaskname.size();i++){%>
<option value="<%=ltaskname.get(i)%>"><%=ltaskname.get(i)%></option>
<%}%>
        </select>
      </td></tr>
    <tr><th><label>Cafe Name:</label></th>
    <td>
        <select name="cname" required>
          <option value="">-Select-</option>
 <%for(int i=0;i<lcafename.size();i++){
%>
<option value="<%=lcafename.get(i)%>"><%=lcafename.get(i)%></option>
<%
}%>
        </select>
      </td></tr>
    <tr><th><label>Auditor Name:</label></th>
    <td>
        <select name="audname" required>
          <option value="">-Select-</option>
          <%for(int i=0;i<lauditorname.size();i++){
%>
<option value="<%=lauditorname.get(i)%>"><%=lauditorname.get(i)%></option>
<%
}%>
        </select>
      </td></tr>
    <tr><th><label>Perform Date:</label></th><td><input type="text" id="perdate" name="performdate" required autocomplete="off"></td></tr>
    <tr><th><label>Data Date:</label></th><td><input type="text" id="datadate" name="datadate"required autocomplete="off"></td></tr>
    <tr><th><label>Task Count:</label></th><td><input type="text" id="tcount" name="taskcount" required autocomplete="off"></td></tr>
    <tr><th><label>Performance Time:</label></th><td><input type="text" id="pt" name="pt" required autocomplete="off"></td></tr>
    <tr><td><input type="submit" value="SAVE VALUES"></td>
      <td><a href="envyperformanceupdate.jsp">Cancel</a></tr>
  </table>
<%}%>
  
</form>
<%}
catch(Exception e){
  e.printStackTrace();
}
%>

  </body></html>


