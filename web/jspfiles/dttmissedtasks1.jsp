<%@page import="java.util.ArrayList"%>
<%@page import="rva.taskinsert.*" %>
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
<%
  DTTBean dttbean=new DTTBean();
  GettingDTTTaskId gdtt=new GettingDTTTaskId();
  dttbean=gdtt.getdttmissedvalues();
   ArrayList<String> dttcltname=dttbean.gettasksname();
   ArrayList<String> dttcltaskstage=dttbean.getprocessStage();
   ArrayList<String> lauditorname=dttbean.getauditorsname();
   ArrayList<String> lperformdate=dttbean.getstartDateApp();
   ArrayList<String> logmeinname=dttbean.getlogmeinname();
   ArrayList<Integer> ldttmissedvalrn=dttbean.getdttmissedvalrn();
   if(dttcltname.size()>0){%>
   <form action="DTTMissedValues" method="POST">
     <input type="submit" name="formsubmit" id="subform" value="SUBMIT"><br><br>
   <div id="wrapper">
   <table id="keywords">
     <thead>
       <tr><th><span>S.No</span></th><th><span>LogMeIn Name</span></th><th><span>Task Name</span></th><th><span>Perform Date</span></th><th><span>Auditor Name</span></th><th><span>Process Completed</span></th><th></th></tr></thead> 
     <tbody>     
<%for(int i=0;i<dttcltname.size();i++){  

%>
      <tr><td><%=i+1%></td>
        <td><%=logmeinname.get(i)%></td>
        <td><%=dttcltname.get(i)%></td>
        <td><%=lperformdate.get(i)%></td>
        <td><%=lauditorname.get(i)%></td>
        <td><%=dttcltaskstage.get(i)%></td>
        <td><a href="updatedttmissedvalues.jsp?rowno=<%=ldttmissedvalrn.get(i)%>" method="post">Update</a></td></tr>
   <% }%>
</tbody>
   </table></div>
<br><br>

   
   </form>
  <%}
   else{%>
   <p>No Tasks Available</p>
   <%}
  %>

