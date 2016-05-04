<%@page import="rva.userlogin.AttendanceProcessing"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.taskinsert.RetelTName"%>
<%@page import="rva.taskinsert.RetelTasks"%>
<%@page import="rva.dbaccess.DBConnect"%>

<html>
	<head>
	<title>Retel Task Insert</title>
        
<script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        

       <style>
      .maincon
      {
          margin:0;
          background-color:#a6e1ec;
          width:auto;
          height:auto;
      }
            .b_form
            {
             float:left;
             //background-color: #dFb5b4;
             width:700px;
             height:auto;
            }
          
            table{
            //margin-left: 60px;
            width:600px;
            margin: 3px;
            //align:center;
        }
        
        tr:first-child{
          height: 20px;
        }
      th, td:nth-child(){
            text-align:left;
            width:200px;
            //width:1%;
            //height:15px;
        }
        th{
           background-color: lightblue;
         }
         table,tr,td,th{
           border:2px solid #fff;
           border-collapse: collapse;
         }
        .insize{
            width:200px;
        }
        #submit
        {
        margin:10px;
        }
        input,select{
          width:auto;
        }
        #insnew{
          width:auto;
        }
        #stdate{
          width:150px;
        }
        input[type="button"]{
          width:auto;
        }
        </style>
        
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
                    $('.t_body tr:last').after('<tr id="'+newrid+'">'+htmres+'<td><input type="button" id="remove'+newrid+'" value="Romove" onclick="removeFunction(this.id)"></td></tr>');
                   
                    }
                  }
                  xmlhttp.open("GET","supportfiles/countsheet/retelinsertnewrow.jsp?rowcnt="+newrid,true);
                  xmlhttp.send();      
                   //alert(newrid);
  }
         </script>
         
         <script>
           function removeFunction(id)
           {
             var butid=id;
            // alert(butid);
             var rowid=butid.replace(/[^0-9]+/ig,"");
             //alert(rowid);             
           $('table.t_body #'+rowid).remove();
  }
         </script>
        <script type="text/javascript">
            function getcurrtime(val)
            {
                var dTime = new Date();
                var hours = dTime.getHours();
                if(hours<10)
                {
                    hours="0"+hours;
                }
                else
                    hours;
                var minute = dTime.getMinutes();
                if(minute<10)
                {
                    minute="0"+minute;
                }
                else
                    minute;
                var second = dTime.getSeconds();
                if(second<10)
                {
                    second="0"+second;
                }
                    else
                        second;
                var time = hours + ":" + minute + ":" + second;
                document.getElementById(val).value= time;
             }                    
    </script>
       </head>
<body>
	<%LogBean logbean1=(LogBean) session.getAttribute("currloginsession");%>
           <strong>Retel Count Sheet</strong> 
           
       <form action ="RetelLog" method="POST" enctype="multipart/form-data">
           
       <strong>
         Auditor Name:</strong>&nbsp;&nbsp;&nbsp;
              
                 <%String auditorname=(String) logbean1.getAuditorname();
                 String userid=(String) logbean1.getUserid();
                 %>
                 <%=auditorname%>
                 <%session.setAttribute("username",auditorname);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
             <%
                 int profid=logbean1.getProfileid();
                 String performdate=new AttendanceProcessing().getLoginDate(profid);
                 session.setAttribute("logindate", performdate);
            %>
            <strong> Performing Date:</strong>&nbsp;&nbsp;&nbsp;<%=performdate%>
            
            <div id="filecheck">
              <input type="file" name="file" id="fileid" onchange="nameValidation()" required value="Choose File">
              <div id="hovertext"><p>Please Make Sure This, Before Uploading The File!</p>
              <ul>
                <li>File Should Be Saved As ".xls" Format.</li>
                <li>File Data Should Be Contain What You Have Performed Today.</li>
                <li>Don't Insert Previous Day Performed And/Or Other Auditors Performed.</li>
                <li>Columns Are A->Serial Number;B->Task Number;C->Task Names;D->Start Time;E->End Time;</li>
                <li>File Name Should Be Performed Date In(MMDDYY+"RET"+Numeric Character Of Your RVA ID). EX:010115RET0001</li>
              </ul>
            </div>
    </div>
            
           <input type="submit" id="submit" value="UPLOAD FILE">
           
           <%
String val=null;
  
String uploadfilepath=(String) session.getAttribute("filepathret");
if(uploadfilepath!=null){
  session.setAttribute("filepathret",val);
  %>
  <br><br><label>Your file has been upload to "<%=uploadfilepath%>"</label><%
}
else{
  
}
%>
</form>	
</body>	
</html><script>
           function nameValidation(){
            var x= document.getElementById("fileid").value;
            var filepath=x;
            x=x.split("\\");
            var xa='<%=userid%>';
            var res=xa.split("KPR");
            var date='<%=performdate%>';
            var datesplit=date.split("/");
            var mm=datesplit[0];
            var dd=datesplit[1];
            var yy=datesplit[2];
            yy=yy.split("20");
            yy=yy[1];
            var fdate=mm+dd+yy;
            var filename=fdate+'RET'+res[1]+'.xls';
            var xmlhttp;
            if(filename==x[2]){
              
              if(window.XMLHttpRequest){
                xmlhttp=new XMLHttpRequest();
            }
            else{
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function() 
            { 
              if(xmlhttp.readyState==4&&xmlhttp.status==200)
              {
               var result=xmlhttp.responseText.split('<br>');
               }
            }
              xmlhttp.open("GET","supportfiles/countsheet/retelinsertnewrow.jsp?fname="+filename+"&fpath="+filepath,true);
              xmlhttp.send();
          }
            else{
              document.getElementById("submit").disabled=false;
              document.getElementById("fileid").value="";
              alert("File Name Wrong! Please Use This As Your File Name! "+filename);
            }
            }
         </script>