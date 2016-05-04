<%-- 
    Document   : quickresults
    Created on : Oct 1, 2014, 9:33:31 AM
    Author     : Arun-S
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.text.*"%>
<%@page import="rva.userlogin.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quick Results</title>
        <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
        <style>#historicalchecklist select{
                width:170px;
            }
         #historicalchecklist .datepicker{
                width:70px;
            }
          #historicalchecklist #seachid{
                width:20px;
                height:20px;
            }
          #historicalchecklist .headtab{
                width:100%;
            }  
            #historicalchecklist{
              margin-bottom: 10px;
            }
        </style>
       
        
  <script type="text/javascript">
    $(document).ready(function(){
      $("#seachid").click(function(){
            var sdat=$("#stdate").val();
            var edat=$("#endate").val();
            var cname=$("#cliname").val();
            var audname=$("#auditorname").val();
            $("#wait").visiblity=true;
            $(document).l
            $(document).ajaxStart(function(){
        $("#wait").show();
        //alert("wait");
    });
    $(document).ajaxComplete(function(){
        $("#wait").hide();
    });
        $.post("supportfiles/quicksearch/quicksearchres.jsp",
        {
          clname:cname,
          aname:audname,sdate:sdat,edate:edat
        },
        function(data,status){
          $("#res").html(data);
      });
      });
    });
   </script>
  <script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
  <script>
          $(document).ready(function(){
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            
            $("#stdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,defaultDate: maxDate,maxDate:maxDate,minDate:new Date(2014,00,01),
              onSelect: function(selected){
                $("#endate").datepicker("option","minDate",selected)
              }
            });
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            $("#endate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true, defaultDate:maxDate,maxDate:maxDate,minDate:new Date(2014,00,01),
            onSelect: function(selected){
              $("#stdate").datepicker("option","maxDate",selected)
            }           
            });
          });
          </script>
    </head>
    <body>
        <strong>Performance Report</strong>
     <table id="historicalchecklist" class="headtab">
            <%
                Date date=new Date();
                String appDate;
                 String dbDate=null;
               ResultSet res=null;
                String performanceasTime=null;
                String performancedttTime=null;
                String performanceenvyTime=null;
                SimpleDateFormat smt=new SimpleDateFormat("MM/dd/yyyy");
                SimpleDateFormat dbdate=new SimpleDateFormat("yyyy-MM-dd");
                Calendar cal=Calendar.getInstance();
                int year=cal.get(Calendar.YEAR);
                int month=cal.get(Calendar.MONTH);
                int day=cal.get(Calendar.DATE)-2;
                cal.set(year,month,day);
                String dbperformeddate=dbdate.format(cal.getTime());
                String appperformeddate=smt.format(cal.getTime());
                DecimalFormat decimal=new DecimalFormat("0.00f");
               dbDate=dbdate.format(date);
               appDate=smt.format(date);
                int retelcount=0;
                %>
            <tr><th><strong>Start Date:</strong></th><td> <input type="text" class="datepicker"id="stdate" autocomplete="off" name="performdate" value="<%=appperformeddate%>" required/></td><th>
                    <strong>End Date: </strong></th><td> <input type="text" class="datepicker" value="<%=appperformeddate%>" id="endate" autocomplete="off" name="enddate" required></td>
                <th><strong>Client Name:</strong></th><td><%
      ArrayList<String> cleints=new ArrayList<String>();
      
        Connection con=DBConnect.startConnection();
        try
        {
          Statement stm=con.createStatement();
          %> 
                  <td><select name="cliname" class="selsize" id="cliname">
                          <option name="cnall" value="-selectall-">-Select All-</option>
                          <option name="cnas" value="arrowsight">Arrowsight</option>
                           <option name="cndtt" value="dtt">DTT</option>
                         
                          <option name="cnenvy" value="envysion">Envysion</option>
                          <option name="cnret" value="retel">Retel</option>
                          </select></td>
        <%

          ArrayList<String> alauditors=new ArrayList<String>();
          String audAccesslevel;
          String auditorName;
          LogBean lb=(LogBean) session.getAttribute("currloginsession");
          audAccesslevel=(String) lb.getAccesslevel();
          auditorName=(String) lb.getAuditorname();
         res=stm.executeQuery("SELECT * FROM auditors");
          while(res.next())
          {
            alauditors.add(res.getString("auditorsname"));
          }%>
                      <th>
                  Auditor Name:</th><td> 
                        <select name="auditorname" class="selsize" id="auditorname" required>
                  <%
                  //alauditors.add("-selectall-");
                  Collections.sort(alauditors);%>
                  <option name="-selectall-" value="-selectall-">-Select All-</option>
                <%for(int j=0;j<alauditors.size();j++){
                  if(!alauditors.get(j).equalsIgnoreCase("nill")){
                    %>
                      <option name="<%=alauditors.get(j)%>" value="<%=alauditors.get(j)%>">
                      <%=alauditors.get(j)%></option>
                      <%}else{}}%>
                  </select></td>
               
    <td><button type="submit" onclick="myfunction()" value="submit"><img id="seachid" src="images/go.jpg" alt="submit"></button></td></tr></table>
   <%
   res=stm.executeQuery("SELECT sum(timetoperform) from asauditsreportfinal where performdate between '"+dbperformeddate+"' and '"+dbperformeddate+"' ");
   while(res.next()){
     performanceasTime=String.format("%.2f",res.getFloat("sum(timetoperform)")/3600);
   }
   res=stm.executeQuery("SELECT sum(performancetime) from dttfinal where performdate between '"+dbperformeddate+"' and '"+dbperformeddate+"' ");
   while(res.next()){
     performancedttTime=String.format("%.2f",res.getFloat("sum(performancetime)")/60);
   }
   res=stm.executeQuery("SELECT sum(timetoperform) from envysionperformancefinal where performeddate between '"+dbperformeddate+"' and '"+dbperformeddate+"' ");
   while(res.next()){
     performanceenvyTime=String.format("%.2f",res.getFloat("sum(timetoperform)")/60);
   }
   res=stm.executeQuery("SELECT count(auditorname) from retellog where performdate between '"+dbperformeddate+"' and '"+dbperformeddate+"' ");
   while(res.next()){
     retelcount=res.getInt("count(auditorname)");
   }
   %>
    <div id="res">
      <div id="wrapper">
        <table id="keywords" class="quickres"><thead>
            <tr><th><span>S.No</span></th><th><span>Project Name</span></th><th><span>Performance Time</span></th></tr></thead>
          <tbody> <tr><td>1</td><td>Arrowsight</td><td><%=performanceasTime%> Hours</td></tr>
        <tr><td>2</td><td>DTT</td><td><%=performancedttTime%> Hours</td></tr>
        <tr><td>3</td><td>Envysion</td><td><%=performanceenvyTime%> Hours</td></tr>
        <tr><td>4</td><td>Retel</td><td><%=retelcount%> #</td></tr></tbody>
      </table> </div>
<div id="wait" style="display:none;width:69px;height:89px;border:1px solid black;position:absolute;top:50%;left:50%;padding:2px;"><img src="images/demo_wait.gif" width="64" height="64" /><br>Loading..</div>
    </div>
      
    </body>
</html> 
<%
        }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    %>