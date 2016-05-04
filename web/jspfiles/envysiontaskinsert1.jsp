<%@page import="rva.userlogin.AttendanceProcessing"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head>
	<title>Envysion Count Sheet</title>
       <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
       <style>
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
         th,td{
           width:150px;
         }
         input,select{
           width:195px;
         }
         #submit
        {
          margin:10px 0px 0px 250px;
        }
        #insnew{
          width:auto;
        }
        .remove{ width:auto;}
       
       
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
          $(document).ready(function(){
            var date=new Date();
             var minDate=new Date(2015,00,01);
             
            $(".date_picker").each(function(){$(this).datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:minDate,defaultDate:new Date(),
                
            });
          });
          
      });
    </script>
           <script>
            function insertNew()
            {
                  var tab =document.getElementById('table');
                  //var rowcount=tab.rows.length;
                 
                  var htmres;
                  var lastrowid=$('#table tr:last').attr('id');
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
                  xmlhttp.open("GET","supportfiles/countsheet/envysioninsertnewrow.jsp?rowcnt="+newrid,true);
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
         <script>
           function myfunction(id){
             //alert(id);
             var val=id;
             var rowid=val.replace(/[^0-9]+/ig,"");
             var cname=document.getElementById(val).value;
             var dtdate=document.getElementById("dtdate"+rowid).value;
             var xmlhttp;
             if(dtdate!=""){
              
           if(window.XMLHttpRequest){
             xmlhttp=new XMLHttpRequest();
           }
           else{
             xmlhttp=new ActiveXOject("Microsoft.XMLHTTP");
           }
           
           xmlhttp.onreadystatechange=function(){
             
             if(xmlhttp.readyState==4&&xmlhttp.status==200){
               //alert("Welcome");
               var x=xmlhttp.responseText.split('<br>');
               document.getElementById("tn"+rowid).innerHTML=x[0];
               document.getElementById("tc"+rowid).innerHTML=x[1];
               //alert(x[1]);
             }
           }
           xmlhttp.open("GET","supportfiles/countsheet/getenvytasks.jsp?rowcount="+rowid+"&dtdate="+dtdate+"&cname="+cname,true);
           xmlhttp.send();
           }
           else{
               document.getElementById(val).value="";
            alert("Please Select Data Date To Insert Task Count!");
            // alert(val+("dtdate"+rowid));
           }
         }
         </script>
        </head>
<body>
  <strong>Envysion Count Sheet</strong><br><br>
       <form class="envycountsheet"method="POST" action="EnvysionCount">
            <%LogBean logbean1=(LogBean) session.getAttribute("currloginsession");
            String auditorname=(String) logbean1.getAuditorname();
            session.setAttribute("auditorname",auditorname);
            int profid=logbean1.getProfileid();
            String performdate=new AttendanceProcessing().getLoginDate(profid);
            Connection con=DBConnect.startConnection();
            
            ArrayList<String> cafename=new ArrayList<String>();
            ArrayList<String> taskname=new ArrayList<String>();
            ResultSet res=null;
            try
            {
              Statement st=con.createStatement();
              res=st.executeQuery("SELECT * FROM envysioncafes");
              while(res.next())
            {
              cafename.add(res.getString("envysioncafesname"));
            }
              res=st.executeQuery("SELECT * FROM envysiontasks");
              while(res.next())
            {
              taskname.add(res.getString("envysiontaskname"));
            }
            }
            catch(Exception e)
            {
              e.printStackTrace();
            }
            %>
            <strong>Auditor Name:</strong>&nbsp;&nbsp;&nbsp;<%=auditorname%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <strong>Performed Date:</strong>&nbsp;&nbsp;&nbsp;<%=performdate%>
          <br><br>
          <input type="button" id="insnew" onclick="insertNew()" value="+">
<table class="envycount" id="table">
  <tr id="1"><th>Data Date</th><th>Cafe Name</th><th>Task Name</th><th># of Tasks</th></tr>
  
  
            <tr id="2">
              <td><input type="text" class="date_picker" id="dtdate2" autocomplete="off" name="datadate" required/></td>
              <td>
                <select name="cafename" id="cname2" onchange="myfunction(this.id)" required>
                  <option name="null" value="">-select-</option>
                <%
            for(int i=0;i<cafename.size();i++){%>
            <option name="cafe" value="<%=cafename.get(i)%>"><%=cafename.get(i)%></option>
          <%  }
            %>
                </select></td><td id="tn2"></td>
                <td id="tc2"></td>
                  </tr>
        </table>
              <button id="submit" type="submit" value="submit"/>SAVE</button>
       </form>
</body>	
</html>