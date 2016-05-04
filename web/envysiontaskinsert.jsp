<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head><title>Envysion Count Sheet</title>
            <link href="cssfiles/default.css" rel="stylesheet" type="text/css">
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
                                            <li><a id="cur" href="envysiontaskinsert.jsp">Envysion Count Sheet</a></li>
                                            <li><a href="reteltaskinsert.jsp">Retel Count Sheet</a></li>
                                             <li><a  href="dttcountsheet.jsp">DTT Count Sheet</a></li>
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
                                <li><a href="dttnewtaskinsert.jsp">DTT New Task Insert</a></li>
                                           <li><a href="envysionnewtaskinsert.jsp">Envy New Task Insert</a></li>
                                           <li><a href="retelnewtaskinsert.jsp">Retel New Task Insert</a></li>
                                  </ul></div>
                                    <%}%>
                                  </div>
				<div class="right-container">
			        
                              <%@include file="jspfiles/envysiontaskinsert1.jsp" %>
				</div>
				<div class="footer">
					<label id="cr-foot">© 2015. Rapid Care Transcriptions Private Limited.</label>
				</div>
			</div>
		
	</div>
       </div>
</body>	
</html>