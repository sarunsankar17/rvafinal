<%@page import="rva.taskinsert.DTTBean"%>
<%@page import="rva.taskinsert.GettingDTTTaskId"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head>
	<title>DTT Count Sheet</title>
       <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
       <style>
         #insnew{
           width:auto;
         }
           table{
               width:600px;
           }
         table,tr,td,th{
           border:2px solid #fff;
           border-collapse: collapse;
         }
         .datepicker{
           width:100px;
         }
         th{
           background-color: lightblue;
         }
         tr:last-child{
           background-color: #FFFFFF;
         }
         .remove{
           width:auto;
         }
         th,td{
             width:200px;
         }
         select, input{
           width:255px;
         }
         #submit
        {
          margin:10px 0px 0px 250px;
        }
       </style>
       <script>
         function checkvalue(id)
         {
           var x=document.getElementById(id).value;
           var nan=isNaN(x);
           //var empval="";
           if(nan||x<0)
           {
             alert("You have entered wrong value! Please enter correct number");
             document.getElementById(id).value="";
           }
         }
         </script>
         <script>
          $(document).ready(function(){
            var date=new Date();
             var minDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-1);
            $("#stdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:minDate,defaultDate:new Date()  
            });
          });
            </script>
           <script>
            function insertNew()
            {
                 // var tab =document.getElementById('table');
                  //var rowcount=tab.rows.length;
                 
                  var htmres;
                  var lastrowid=$('#table tr:last').attr('id');
                  //alert(lastrowid);
                  var rowid=lastrowid.replace(/[^0-9]+/ig,"");
                  var rowidint=parseInt(rowid);
                  var newrid=rowidint+1;
                  var xmlhttp;
                  if(window.XMLHttpRequest)
                  {
                    xmlhttp=new XMLHttpRequest();
                  }
                  else
                  {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                  }
                  xmlhttp.onreadystatechange=function()
                  {
                    if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                    htmres=xmlhttp.responseText;
                    
                    $('.envycount tr:last').after('<tr id="'+newrid+'">'+htmres+'<td><input type="button" class="remove" id="remove'+newrid+'" value="Romove" onclick="removeFunction(this.id)"></td></tr>');
                 
                  }
                  }
                  xmlhttp.open("GET","supportfiles/countsheet/dttinsertnewrow.jsp?rowcnt="+newrid,true);
                  xmlhttp.send();      
                 
  }
         </script>
          <script>
           function removeFunction(id)
           {
             var butid=id;
            // alert(butid);
             var rowid=butid.replace(/[^0-9]+/ig,"");
             //alert(rowid);             
           $('table.envycount #'+rowid).remove();
             
  }
         </script>
        </head>
<body>
  <%LogBean logbean1=(LogBean) session.getAttribute("currloginsession");
            String auditorname=(String) logbean1.getAuditorname();
            session.setAttribute("auditorname",auditorname);
            String accessl=(String) logbean1.getAccesslevel();
            Connection con=DBConnect.startConnection();
            
            DTTBean dttbean=new GettingDTTTaskId().getdttcltname();
            ArrayList<String> taskname=dttbean.gettasksname();
            ArrayList<String> processstage=dttbean.getprocessStage();
            
            %>
  <strong>DTT Count Sheet</strong><br><br>
  <%
  
    if(!accessl.equalsIgnoreCase("Auditor")&&(!accessl.equalsIgnoreCase("QAAuditor"))){%>
    <a href="dttreportfileupload.jsp"><button>Upload Report File</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
    
    <a href="dttmissedtasks.jsp"><button>DTT Missed Tasks</button></a>
    <br><br>
  <%}
  %>
  
       <form class="envycountsheet" method="POST" action="DTTCountSheet">
            
            <strong>Auditor Name:</strong>&nbsp;&nbsp;&nbsp;<%=auditorname%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <strong>Performed Date:</strong>&nbsp;&nbsp;&nbsp;<input type="text" class="datepicker" id="stdate" autocomplete="off" name="performdate" required/>
          <br><br>
          <input type="button" id="insnew" onclick="insertNew()" value="+">
<table class="envycount" id="table">
            <tr id="1"><th>LogMeIn Name</th><th>Task Name</th><th>Process Completed Till</th></tr>
            <tr id="2">
              <td><input type="text" name="logmeinname" placeholder="LogMeIn Name" required autocomplete="off"></td>
              <td>
                  <select name="taskname" id="taskname" required>
                     <option name="null" value="">-select-</option>
                <%
            for(int i=0;i<taskname.size();i++){%>
            <option name="task" value="<%=taskname.get(i)%>"><%=taskname.get(i)%></option>
          <%}
            %>
                </select>
              </td><td><select name="processstage" required>
                  <option value="">-select-</option>
                 <% for(int i=0;i<processstage.size();i++){%>
                 <option name="task" value="<%=processstage.get(i)%>"><%=processstage.get(i)%></option>
                 <%}%>
                </select></td></tr>
        </table>
              <button id="submit" type="submit" value="submit"/>SAVE</button>
       </form>
</body>	
</html>