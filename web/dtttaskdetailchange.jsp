<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head><title>DTT Task Insert/Update</title>
            <link href="cssfiles/default.css" rel="stylesheet" type="text/css">
            <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        </head>
	
<body>
	<div class="main-container">
			
			<div class="body-container">
				<div class="header">
                                    <%LogBean logbean=(LogBean) session.getAttribute("currloginsession");
                                    if(logbean==null||session==null){
                                      response.sendRedirect("index.html");
                                    }
                                    %>
				<div class="logo">
                                    <div class="l-logo">
                                    <img src="images/logo.JPG" /></div>
                              <div class="welcomenote">
                                <h1 class="main-title">KPO - REMOTE VIDEO AUDITING</h1>
                              </div>
                                    <div class="r-uname">
                                        <div class="uname">
                                       </div>
                                    </div></div>
				<div class="head-menu">
				<ul class="menu">
                                    <li><a href="home.jsp"><img src="images/icons/home.png" alt="home" class="icon"/>Home</a></li>
                                    
                                    <li><a href="editprofile.jsp"><img src="images/icons/profile.png" alt="profile" class="cion">Profile</a></li>
                                    <li> <div class="welcomeuser"> <label> Welcome  <%=(String) logbean.getAuditorname()%></label>
                                    
                                    </div> </li>
                                    <li>
                                       <div class="lout">
                                          <a href="logout.jsp">LOGOUT</a>
                                             </div>
                                    </li>
                            </ul>
                              
				</div>
			</div>
			<div class="center-body">
				<div class="left-menu">
                              <div class="lmenu-title"><label><img src="images/icons/insertnew.png" alt="insertnew" class="icon"><strong>Insert Tasks</strong></label></div>
				  <div class="lmenu-list">	
                              <ul class="lmenu">
                                    <%
                                    String accesslevel;
                                    accesslevel=logbean.getAccesslevel();
                                    if(!accesslevel.equalsIgnoreCase("Auditor")){
                                    %>
                                            <li><a href="asqacount.jsp">AS QA Count Sheet</a></li>
                                            <%}%>
                                            <li><a href="envysiontaskinsert.jsp">Envysion Count Sheet</a></li>
                                            <li><a href="reteltaskinsert.jsp">Retel Count Sheet</a></li>
                                             <li><a href="dttcountsheet.jsp">DTT Count Sheet</a></li>
                              </ul></div>
                              <div class="lmenu-title"><label><img src="images/icons/perfrep.png" alt="perfrep" class="icon"><strong>Detailed Performance Report</strong></label></div></h6>
                            <div class="lmenu-list">       
                            <ul class="lmenu">
                              <li><a href="quickresults.jsp">Historical Results</a></li>
                                        <li><a href="aschecklist.jsp">AS Clients</a></li>
                                         <% if(!accesslevel.equalsIgnoreCase("Auditor")){
                                    %>
                                        <li><a href="asqachecklist.jsp">AS QA Clients</a></li>
                                        <%}%>
                                        <li><a href="retshowresults.jsp">Retel Clients</a></li>
                                        <li><a href="envysionchecklist.jsp">Envysion Clients</a></li>
                                        <li><a href="dttchecklist.jsp">DTT Clients</a></li>
                            </ul></div>
                                        <% if((!accesslevel.equalsIgnoreCase("Auditor"))&&(!accesslevel.equalsIgnoreCase("QAAuditor"))){
                                    %>
                            <div class="lmenu-title"><label><img src="images/icons/Admin-icon.png" alt="admin" class="icon"><strong>Administrator</strong></label></div>
                                  <div class="lmenu-list"> 
                                  <ul class="lmenu">
                                       	<li><a href="fileuploading.jsp">AS Report File Upload</a></li>
						<li><a href="asmissedvalues.jsp">AS Missed Data's</a></li>
						 <li><a href="asauditsinsertupdate.jsp">AS Audit Insert/Update</a></li>
                                            <li><a href="asqaauditsupdate.jsp">AS QA Audits Insert</a></li>
					<li><a href="asauditorsloginiddetails.jsp" >AS UserID Update</a></li>
                                <li><a href="userprofilemaintenance.jsp">User Profile Update</a></li>
                                <li><a id="cur" href="dttnewtaskinsert.jsp">DTT New Task Insert</a></li>
                                           <li><a href="envysionnewtaskinsert.jsp">Envy New Task Insert</a></li>
                                           <li><a href="retelnewtaskinsert.jsp">Retel New Task Insert</a></li>
                                  </ul></div>
                                    <%}%>
                                  </div>
				<div class="right-container">
			        <%-- 
    Document   : updateenydetails
    Created on : Jan 20, 2015, 5:57:56 PM
    Author     : RCT-456
--%>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <script>
      function checktavailablity(val){
        var xmlhttp;
        var proc;
        if(val=="stagename"){
        proc="checkstname";
        }
        else{
          proc="checktname";
        }
        var va=document.getElementById(val).value;
        
        if(va!=""){
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
                var result=xmlhttp.responseText.split('<br>');
                 document.getElementById("res").innerHTML=result[0];
                  document.getElementById("butres").innerHTML=result[1];
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/checkdttdata.jsp?name="+va+"&process="+proc,true);
              xmlhttp.send();
          }
          else{
           
            document.getElementById("res").innerHTML="";
            document.getElementById("butres").innerHTML="";
          }
      }
    </script>
    <script>
      function checktsavailablity(val){
        var xmlhttp;
        var proc;
        if(val=="stagename"){
        proc="checkstname";
        }
        else{
          proc="checktname";
        }
        var va=document.getElementById(val).value;
        
        if(va!=""){
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
                var result=xmlhttp.responseText;
                 document.getElementById("res").innerHTML=result;
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/checkdttdata.jsp?name="+va+"&process="+proc,true);
              xmlhttp.send();
          }
          else{
           
            document.getElementById("res").innerHTML="";
          }
      }
    </script>
    <script>
            function insertnewprandpt()
            {
                 // var tab =document.getElementById('table');
                 // var rowcount=chktab.rows.length;
                 // alert(rowcount);
                  var htmres;
                  var lastrowid=$('#chktab tr:last').attr('id');
                 // alert(lastrowid);
                  var rowid=lastrowid.replace(/[^0-9]+/ig,"");
                  var rowidint=parseInt(rowid);
                  var newrid=rowidint+1;
                // alert(newrid);
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
                    
                    $('.chktab tr:last').after('<tr id="'+newrid+'">'+htmres+'<td><input type="button" class="remove" id="remove'+newrid+'" value="Romove" onclick="removeFunction(this.id)"></td></tr>');
                  }
                  }
                  xmlhttp.open("GET","supportfiles/adminasaudits/dttinsertstageandpt.jsp?",true);
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
           $('table.chktab #'+rowid).remove();
             
  }
         </script>
         <script>
           function checkproandpt(){
             var rowcount=chktab.rows.length;
             if(rowcount=="1"){
                alert("Please Enter Process Stage And PT For This Task");
                return false;
             }
             return true;
           }
         </script>
  </head>
  <body>
<%
String insertdetail=request.getParameter("process");
if(insertdetail.equalsIgnoreCase("insert")){
session.setAttribute("changedetail","taskinsert");
%>
<form name="dtttaskinsert" action="dtttaskinsertupdate.jsp" onsubmit="return checkproandpt()" method="post">
  
  
  <label>Task Name:</label><input type="text" onkeyup="checktavailablity(this.id)" name="taskname" id="taskname" placeholder="Task Name" autocomplete="off" required><br><br>
     <div id="res"></div>
     <div class="prostandpt">
       
       <table class="chktab" id="chktab">
         <tr id="1"><th>Process Stage</th><th>Performance Time</th></tr>
         
       </table><br><br>
       <div id="butres"></div>
       
       </div>
     
</form>
<%}
else if(insertdetail.equalsIgnoreCase("update")){
 session.setAttribute("changedetail","taskupdate");
 String taskname=request.getParameter("taskname");
 //int taskid=0;
 ArrayList<String> lprocessstage=new ArrayList<String>();
 ArrayList<String> lperftime=new ArrayList<String>();
 ArrayList<String> allprocessstage=new ArrayList<String>();
 try{
   Connection con=DBConnect.startConnection();
   Statement st=con.createStatement();
   ResultSet res=null;
   res=st.executeQuery("SELECT dttprocessstagename,`performancetime` FROM `dttprocessandpt` as a join dtttaskdetails as b join dttprocessstage as c on a.`dtttaskid`=b.`dtttasksid` and a.`dttprocessstageid`=c.dttprocessstageid WHERE dtttaskname like '"+taskname+"' ");
 while(res.next()){
   lprocessstage.add(res.getString("dttprocessstagename"));
   lperftime.add(res.getString("performancetime"));
 }
 res=st.executeQuery("SELECT * FROM `dttprocessstage`");
 while(res.next()){
   allprocessstage.add(res.getString("dttprocessstagename"));
 }
 }
 catch(Exception e){
   e.printStackTrace();
 }
 %>
<form name="dtttaskupdate" action="dtttaskinsertupdate.jsp" onsubmit="return checkproandpt()" method="post">
  <label>Task Name:</label><input type="text"  name="taskname" readonly placeholder="Task Name" id="taskname" value="<%=taskname%>" autocomplete="off" required><br><br>
  
  <div id="res">
     <input type="button" value="+" name="addprstandpt" onclick="insertnewprandpt()">
  </div>
   <div class="prostandpt">
         <table class="chktab" id="chktab">
         <tr id="1"><th>Process Stage</th><th>Performance Time</th></tr>
         <%
         for(int i=0;i<lprocessstage.size();i++){%>
         <tr id="<%=i+2%>" >  <td> <select name="processstage" required>
      <option value="">-select-</option>
      <%for(int j=0;j<allprocessstage.size();j++){
      if(lprocessstage.get(i).equalsIgnoreCase(allprocessstage.get(j))){
        %><option value="<%=allprocessstage.get(j)%>" selected><%=allprocessstage.get(j)%></option>
     <%}else{%>
       <option value="<%=allprocessstage.get(j)%>"><%=allprocessstage.get(j)%></option>
<%}}%>
             </select></td><td><input type="text" name="processstagept" required autocomplete="off" value="<%=lperftime.get(i)%>" placeholder="Performance Time"></td>
             <td><input type="button" class="remove" id="remove'<%=i+2%>'" value="Romove" onclick="removeFunction(this.id)"></td>        
         </tr>
         
       <%}
         %>
         
       </table><br><br>
       <div id="butres"><input type="submit" value="SAVE" name="formsub"></div>
       
       </div>
</form>
<%
}
else if(insertdetail.equalsIgnoreCase("insertnewtaskstage")){
session.setAttribute("changedetail","insertnewtaskstage");
%>
<form name="dtttaskinsert" action="dtttaskinsertupdate.jsp" method="post">
  <label>Task Stage Name:</label><input type="text" onkeyup="checktsavailablity(this.id)" name="taskstage" id="stagename" placeholder="Task Stage Name" autocomplete="off" required><br><br>
  <div id="res">  </div>
</form>
<%}
%> 
<a href="dttnewtaskinsert.jsp" style=textcolor:black;>Cancel</a>
  </body>
</html></div>
				<div class="footer">
					<label id="cr-foot">© 2015. Rapid Care Transcriptions Private Limited.</label>
				</div>
			</div>
		
	</div>
       </div>
</body>	
</html>