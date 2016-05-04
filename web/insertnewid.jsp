<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head><title>AS Auditors Login Details</title>
            <link href="cssfiles/default.css" rel="stylesheet" type="text/css">
            <style>
              input,select{
               width: 200px;
              }
              .subbut{
                width:auto;
              }
            </style>
            <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
            <script>
          $(document).ready(function(){
            
            $("#stdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:new Date(2014,00,01),
              onSelect: function(selected){
                $("#endate").datepicker("option","minDate",selected)
              }
            });
            $("#endate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:new Date(2014,00,01),
            onSelect: function(selected){
              $("#stdate").datepicker("option","maxDate",selected)
            }           
            });
          });
          </script>
          <script>
            function checkdetails(){
              auditorname=document.getElementById("auditorsname").value;
              startdate=document.getElementById("stdate").value;
              enddate=document.getElementById("endate").value;
              if(auditorname=="Nill"){
                if(startdate!=""&&enddate!=""){
                  return true;
                }else{
                  alert("Please Select Assigned and Reassigned Date!");
                  return false;
                }
              }
              else{
                if(startdate==""||enddate!=""){
                  alert("Assigned Date Should Not be Null and Reassigned Date Should be Null");
                return false;  
              }  
              else{
                return true;
              }
    }   
    }
          </script>
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
					<li><a id="cur" href="asauditorsloginiddetails.jsp" >AS UserID Update</a></li>
                                <li><a href="userprofilemaintenance.jsp">User Profile Update</a></li>
                                <li><a href="dttnewtaskinsert.jsp">DTT New Task Insert</a></li>
                                           <li><a href="envysionnewtaskinsert.jsp">Envy New Task Insert</a></li>
                                           <li><a href="retelnewtaskinsert.jsp">Retel New Task Insert</a></li>
                                  </ul></div>
                                    <%}%>
                                  </div>
				<div class="right-container">
                               <strong>AS Login Id Insert/Update</strong><br><br>
			          <%
                                         ArrayList<String> lauditorsname=new ArrayList<String>();
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("SELECT * from auditors");
    while(res.next()){
      lauditorsname.add(res.getString("auditorsname"));
    }
//int rowcount=Integer.parseInt(request.getParameter("allauditorsrowno"));
  String action=request.getParameter("action");
  if(action.equalsIgnoreCase("insert")){%>
  <div class="insertnewid" id="insertnewid">
    <form action="saveasdetails.jsp" name="insertid" method="post">
    <label>AS Auditors ID:</label><input name="insasid" type="text" id="insasid" autocomplete="off" required placeholder="AS Auditors ID"><br><br>
    <label>Auditor's Name:</label><select name="auditorsname" id="auditorsname" class="auditorsname" required>
      <option name="null" value=""></option>
     <%
     for(int i=0;i<lauditorsname.size();i++){%>
     <option name="auditorsname" value="<%=lauditorsname.get(i)%>"><%=lauditorsname.get(i)%></option>
<%} %>
    </select><br><br>
    
    <input type="submit" value="SUBMIT" id="insertid">
    </form>
  </div>
 <% //response.sendRedirect("asauditorsloginiddetails.jsp");
  }
  else{
    String auditorsname=null;
    int asauditorsidrowno=0;
    int auditorsnamerowno=0;
    String asauditorsid=null;
    String appassigndate=null;
    String appenddate=null;
    String dbsdate=null;
    String dbedate=null;
    Date date=null;
    asauditorsidrowno=Integer.parseInt(request.getParameter("asauditorsrowno"));
    session.setAttribute("asidrowno", asauditorsidrowno);
    ResultSet res1=st.executeQuery("SELECT a.auditorsloginname,b.auditorsname from asauditorslogin as a JOIN auditors as b on a.auditorsid=b.auditorsid where a.auditorsloginid LIKE "+asauditorsidrowno+" ");
    while(res1.next()){
      asauditorsid=res1.getString("a.auditorsloginname");
      auditorsname=res1.getString("b.auditorsname");
    }
    SimpleDateFormat appdate=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat dbdate=new SimpleDateFormat("yyyy-MM-dd");
 if(!auditorsname.equalsIgnoreCase("nill")){
  
   ResultSet res2=st.executeQuery("SELECT * from astidassigndetails where auditorname like '"+auditorsname+"' and tidname LIKE '"+asauditorsid+"' ");
 while(res2.next()){
   dbsdate=res2.getString("assigndate");
   //dbedate=res2.getString("enddate");
 }
 date=dbdate.parse(dbsdate);
 appassigndate=appdate.format(date);
 //date=dbdate.parse(dbedate);
 //appenddate=appdate.format(date);
 }
 
 %> 
    <div class="updateid" id="updateid">
      <form id="updateasid" name="updateasid" action="updateasid.jsp" onsubmit="return checkdetails()" method="post">
        
        <label>AS Auditors ID:</label><input type="text" name="asauditorsloginid" id="asauditorsloginid" value="<%=asauditorsid%>" autocomplete="off" required placeholder="AS Auditors ID" readonly>
        <br><br>
        <label>Auditors Name:</label>
        <select name="auditorsname" id="auditorsname" class="auditorsname" required>
          <option name="null" value=""></option>
          <%for(int i=0;i<lauditorsname.size();i++){
            if(lauditorsname.get(i).equals(auditorsname)){%>
            <option name="<%=lauditorsname.get(i)%>" value="<%=lauditorsname.get(i)%>" selected> <%=lauditorsname.get(i)%>  </option> 
           <% }
            else{
              %>
           <option name="<%=lauditorsname.get(i)%>" value="<%=lauditorsname.get(i)%>"> <%=lauditorsname.get(i)%>  </option> 
            <%
            }
          }
          %>
        </select>
          <br><br>
          
          <label>Assigned Date:</label>
          <%if(!auditorsname.equalsIgnoreCase("nill")){
          session.setAttribute("oldaudname",auditorsname);
          %>
          <input type="text" class="datepicker" id="stdate" placeholder="MM/DD/YYYY" value="<%=appassigndate%>" autocomplete="off" name="performdate"/>
          <%}
          else{%>
          <input type="text" class="datepicker" id="stdate" placeholder="MM/DD/YYYY" autocomplete="off" name="performdate"/>
        <%  }%>
          <br><br>
          <label>Reassigned Date:</label><input type="text" class="datepicker" id="endate" placeholder="MM/DD/YYYY" autocomplete="off" name="enddate"><br><br>
          <input type="submit" name="updateid" class="subbut" value="SAVE">
      </form>
    </div>
         
 <% }
  }
  catch(Exception e){
    e.printStackTrace();
  }
%>
                             <a href="asauditorsloginiddetails.jsp">Cancel</a> 
				</div>
				<div class="footer">
					<label id="cr-foot">© 2015. Rapid Care Transcriptions Private Limited.</label>
				</div>
			</div>
		
	</div>
       </div>
</body>	
</html>