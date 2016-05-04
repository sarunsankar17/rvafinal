
<%@page import="rva.showperformance.RetelBean"%>
<%@page import="rva.showperformance.RetelResProcessing"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retel Results</title>
        <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
  <script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
        <style>
        #retres,#retres tr,#retres th,#retres td{
            border:1px solid #fff;
            border-collapse: collapse;
        }
        #retres td:last-child{
          text-align: right;
        }
        #retres{
            width:99%;
            margin:2px 2px 5px 2px;
        }
       #retres th
        {
            background-color: lightblue;
        }
       #retres td,#retres th{
            margin:2px;
        }
       #retres tr:nth-child(odd){
            background-color : aliceblue;
        }
       #retres tr:nth-child(even){
            background-color : ffffff;
        }
        
    </style>
    </head>
    <body>
        <strong>Retel Performance Report</strong>
        <%
         ArrayList<String> launame=new ArrayList<String>();
         ArrayList<String> ltname=new ArrayList<String>();
         ArrayList<Integer> laucount=new ArrayList<Integer>();
         ArrayList<String> lsdate=new ArrayList<String>();
         ArrayList<String> ledate=new ArrayList<String>();
         int radVal=0;
         int totaltasks=0;
         
         RetelBean rb=(RetelBean) session.getAttribute("rrpres");
         ltname=rb.getlTaskName();
         if(ltname.size()>0)
         {
         launame=rb.getlAuditorName();
         ltname=rb.getlTaskName();
         lsdate=rb.getlPerformDate();
         ledate=rb.getlEDate();
         laucount=rb.getlAuditCount();
         radVal=rb.getRadVal();
         }
         if(launame.size()>0)
         {%>
         <table id="retres" border="1px" width="100%"><tr><th>Task Name</th><th>Auditor Name</th><th>Total</th></tr>     
         <%
             for(int i=0;i<launame.size();i++)
             {
             %>
             <tr><td><%=ltname.get(i)%></td>
                 <td><%=launame.get(i)%></td>
                
                 <td><%=laucount.get(i)%></td></tr>
                 
             <%totaltasks=totaltasks+laucount.get(i);
             }
             if(radVal>0)
             {%>
             <tr><td colspan="4">140 Store</td><td><%=radVal%></td></tr>
             
           <%}%>
             <tr><td colspan="4">Total tasks performed</td><td><%=totaltasks%></td></tr>
         </table>
         <%}
         else
         {%>
             <p>No tasks available for this selection</p>
         <%}
         %>
    </body>
</html>
