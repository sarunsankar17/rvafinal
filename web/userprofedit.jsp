<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.userlogin.UserInfo"%>
<html>
	<head><title>User Profile Maintenance</title>
            <link href="cssfiles/default.css" rel="stylesheet" type="text/css">
            <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
            <style>
  input,select,textarea{
    width:350px;
  }
  .genrad,#submit{
    width:auto;
  }
  
  
</style>
<script>
          $(document).ready(function(){
            $("#doj").datepicker({
          dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),defaultDate:new Date(),minDate:new Date(1995,00,01)
            });
          });
            </script>
            <script>
          $(document).ready(function(){
            $("#dor").datepicker({
          dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),defaultDate:new Date(),minDate:new Date(2010,00,01)
            });
          });
            </script>
            <script>
          $(document).ready(function(){
            $("#dob").datepicker({
          dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),defaultDate:new Date(),minDate:new Date(1970,00,01)
            });
          });
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
					<li><a href="asauditorsloginiddetails.jsp" >AS UserID Update</a></li>
                                <li><a id="cur" href="userprofilemaintenance.jsp">User Profile Update</a></li>
                                <li><a href="dttnewtaskinsert.jsp">DTT New Task Insert</a></li>
                                           <li><a href="envysionnewtaskinsert.jsp">Envy New Task Insert</a></li>
                                           <li><a href="retelnewtaskinsert.jsp">Retel New Task Insert</a></li>
                                  </ul></div>
                                    <%}%>
                                  </div>
                                  
                                  <%
  try {
    String profileId = (String) request.getParameter("profid");
    session.setAttribute("profileid", profileId);
    String fullname = null;
    String userid = null;
    String fathername = null;
    String commaddress = null;
    String mobno = null;
    String emermobno = null;
    String emailid = null;
    String dob = null;
    String gender = null;
    String bgroup = null;
    String useraccesslevel = null;
    String doj = null;
    String dedicatedproj = null;
    String department = null;
    String empid = null;
    String designation = null;
    String profstatus = null;
    String marritalstatus=null;
    int target = 0;
    String team=null;
    String relievingdate = null;
    Connection con = DBConnect.startConnection();
    Statement st = con.createStatement();
    SimpleDateFormat appsdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat dbsdf=new SimpleDateFormat("yyyy-MM-dd");
    Date date=null;
    String appdob=null;
    String appdoj=null;
    String apprelivingdate=null;
    UserInfo uinfo=new UserInfo();
    ArrayList<String> ldesignation=new ArrayList<String>();
    ArrayList<String> lrvaproject=new ArrayList<String>();
    ldesignation=uinfo.getDesignation();
    lrvaproject=uinfo.getrvaprojects();
    ResultSet res = st.executeQuery("SELECT * from userprofilepersonal as a join userprofileofficial as b on a.profileid=b.profileid where a.profileid=" + profileId + " ");
    while (res.next()) {
      fullname = res.getString("fullname");
      userid = res.getString("username");
      fathername = res.getString("fathername");
      commaddress = res.getString("address");
      mobno = res.getString("mobno");
      emermobno = res.getString("emergencymobno");
      emailid = res.getString("mailid");
      dob = res.getString("dob");
      gender = res.getString("gender");
      bgroup = res.getString("bloodgroup");
      marritalstatus=res.getString("marritalstatus");
      useraccesslevel = res.getString("accesslevel");
      doj = res.getString("doj");
      dedicatedproj = res.getString("dedicatedproject");
      department = res.getString("department");
      empid = res.getString("kpoempid");
      designation = res.getString("designation");
      profstatus = res.getString("profilestatus");
      target = res.getInt("targetpermonth");
      relievingdate = res.getString("relievingdate");
      team=res.getString("team");
    }
    date=dbsdf.parse(dob);
    appdob=appsdf.format(date);
    if(doj!=null){
    date=dbsdf.parse(doj);
    appdoj=appsdf.format(date);
    }
    else{
      appdoj=null;
    }
    if(relievingdate!=null){
    date=dbsdf.parse(relievingdate);
    apprelivingdate=appsdf.format(date);
    }
    else{
      relievingdate=null;
    }
%>  
				<div class="right-container">
                              <strong>User Profile Edit:</strong><br>
                              
                              
                              
<div class="userprofdiv" id="userprofdiv">
  <form name="profmaintenance" id="profform" action="saveuserprofile.jsp" method="post">
    <table id="userprofedit"><tr><td>
          <label>Full Name:</label></td><td><input type="text" name="fname" value="<%=fullname%>" required readOnly placeholder="Full Name" autocomplete="off"></td></tr>
      <tr><td>    
          <label>User Id:</label></td><td><input type="text" name="uid" required value="<%=userid%>" readonly autocomplete="off" placeholder="User Id"></td><td><a href="changepassword.jsp?profid=<%=profileId%>&empid=<%=userid%>">Change Login Password</a></td></tr>
   
   <tr><td> 
      <label>Father Name:</label></td><td><input type="text" name="fathername" value="<%=fathername%>" required autocomplete="off" placeholder="Father Name"></td></tr>
   <tr><td> 
      <label>Communication Address:</label></td><td><textarea cols="40" rows="4" name="caddress" required autocomplete="off" placeholder="Commucation Address"><%=commaddress%></textarea></td></tr>
    <tr><td> 
      <label>Mobile Number:</label></td><td><input type="text" pattern="[7-9]{1}[0-9]{9}"  name="mobno" value="<%=mobno%>" required autocomplete="off" placeholder="Enter 10 Digit Mobile Number"></td></tr>
   <tr><td> 
      <label>Emergency Contact Number:</label></td><td><input type="text" pattern="[7-9]{1}[0-9]{9}" value="<%=emermobno%>" name="emermobno" required autocomplete="off" placeholder="Enter 10 Digit Mobile Number"></td></tr>
   <tr><td> 
      <label>Mail Address:</label></td><td><input type="email" name="email" value="<%=emailid%>" required autocomplete="off" placeholder="Mail Address"></td></tr>
    <tr><td> 
      <label>Date of Birth:</label></td><td>
        <input type="text" class="datepicker" id="dob" value="<%=appdob%>"  name="dob" class="datepicker" required autocomplete="off" placeholder="MM/DD/YYYY">
        </td></tr>
    <tr><td> 
      <label>Gender:</label></td><td>
      <%if(gender.equalsIgnoreCase("male")){
      %>
      <input type="radio" name="gender" value="Male" class="genrad" required  checked autocomplete="off"><label>Male</label>
      <input type="radio" name="gender" value="Female" class="genrad" required  autocomplete="off"><label>Female</label>
      <%}
      else if(gender.equalsIgnoreCase("female")){%>
      <input type="radio" name="gender" value="Male" required class="genrad"  autocomplete="off"><label>Male</label>
      <input type="radio" name="gender" value="Female" required class="genrad"  checked autocomplete="off"><label>Female</label>
      <%}%></td></tr>
    <tr><td><label>Marital Status:</label></td>
      <td>
        <select name="marstatus" required>
          <option value="">-select-</option>
        <%if(marritalstatus.equalsIgnoreCase("Married")){
        %>
          <option value="Married" selected>Married</option>
          <option value="Unmarried">Unmarried</option>
      <%}
        else{%>
          <option value="Married">Married</option>
          <option value="Unmarried" selected>Unmarried</option>
  <%}%> </select></td>
   <tr><td> 
      <label>Blood Group:</label></td><td><input type="text" name="bgroup" value="<%=bgroup%>" required autocomplete="off" placeholder="Blood Group"></td></tr>
    <tr><td> 
      <label>Date of Join:</label></td><td><%
      if(appdoj==null){%>
        <input type="text" class="datepicker" id="doj" name="doj" class="datepicker" required autocomplete="off" placeholder="MM/DD/YYYY">
    <%}
      else{
      %>
      <input type="text" class="datepicker" id="doj" name="doj" value="<%=appdoj%>" class="datepicker" required autocomplete="off" placeholder="MM/DD/YYYY">
      </td></tr>
      <%}%>
   <tr><td> 
      <label>Department:</label></td><td>
      <input type="text" name="department" value="<%=department%>" required autocomplete="off" placeholder="Department"></td></tr>
    <tr><td> 
      <label>Team:</label></td><td><input type="text" name="team" value="<%=team%>" required autocomplete="off" placeholder="Team"></td></tr>
   <tr><td> 
      <label>Dedicated Project:</label></td><td>
      <select name="dedicatedproj" id="dedicatedproject">
       <%if(dedicatedproj==null){%>
         <option value="" selected>-select-</option><%
         for(int i=0;i<lrvaproject.size();i++){%>
         <option value="<%=lrvaproject.get(i)%>"><%=lrvaproject.get(i)%></option>
         <%}
       }else{%><option value="">-select-</option>
<%for(int i=0;i<lrvaproject.size();i++){
  if(lrvaproject.get(i).equalsIgnoreCase(dedicatedproj)){%>
    <option value="<%=lrvaproject.get(i)%>" selected><%=lrvaproject.get(i)%></option>
  <%}else{%>
    <option value="<%=lrvaproject.get(i)%>"><%=lrvaproject.get(i)%></option>
<%}
}}%>
      
      </select></td></tr>
    <tr><td> 
      <label>KPO Employee Id:</label></td><td><%
      if(empid!=null){%>
        <input type="text" name="kpoid" required value="<%=empid%>" autocomplete="off" placeholder="Employee Id">
      <%}else{%>
       <input type="text" name="kpoid" required autocomplete="off" placeholder="Employee Id">
       <%}%></td></tr>
   <tr><td> 
      <label>Designation:</label></td><td>
       <select name="designation" required id="designation">
      <%if(designation==null){%>
      <option value="" selected>-select-</option>
      <%for(int i=0;i<ldesignation.size();i++){%>
      <option value="<%=ldesignation.get(i)%>"><%=ldesignation.get(i)%></option>
      <%}
     }else{
        %><option value="">-select-</option><%
        for(int i=0;i<ldesignation.size();i++){
        if(ldesignation.get(i).equalsIgnoreCase(designation)){%>
          <option value="<%=ldesignation.get(i)%>" selected><%=ldesignation.get(i)%></option>
       <%}else{%>
          <option value="<%=ldesignation.get(i)%>"><%=ldesignation.get(i)%></option>
        <%}
  }}%></select></td></tr>
      
    <tr><td> 
      <label>User Access Level:</label></td><td>
      <select name="acclevel" required > 
      <%
      if(useraccesslevel.equalsIgnoreCase("Auditor")){
        %>
        <option value=""></option>
        <option value="Auditor" selected>Auditor</option>
         <option value="QAAuditor">QA Auditor</option>
          <option value="Manager">Manager</option>
        <%
      }
      else if(useraccesslevel.equalsIgnoreCase("QAAuditor")){
      %>
        <option value=""></option>
        <option value="Auditor" >Auditor</option>
        <option value="QAAuditor" selected>QA Auditor</option>
          <option value="Manager">Manager</option>
          <%}
      else if(useraccesslevel.equalsIgnoreCase("Manager")){%>
        <option value=""></option>
        <option value="Auditor" >Auditor</option>
        <option value="QAAuditor">QA Auditor</option>
        <option value="Manager" selected>Manager</option>
      <%}
      else{%>
      <option value="" selected></option>
        <option value="Auditor" >Auditor</option>
        <option value="QAAuditor">QA Auditor</option>
        <option value="Manager">Manager</option>
      <%}%>
      </select></td></tr>
    <tr><td> 
      <label>Target Per Day In Hours:</label></td><td>
      <%if(target==0){%>
      <input type="number" name="target" autocomplete="off" placeholder="Target Per Day In Hours">
     <%}
      else{%>
      <input type="text" name="target" value="<%=target%>" autocomplete="off" placeholder="Target Per Day In Hours">
      <%}%></td></tr>
    <tr><td> 
      <label>Profile Status:</label></td><td>
      <select name="profstatus" required >
      <%
      if(profstatus.equalsIgnoreCase("Active")){%>
      <option value="Active" selected>Active</option>
      <option value="Deactivate">Deactivate</option>
      <%}
      else{%>
      <option value="Active">Active</option>
      <option value="Deactivate"selected>Deactivate</option>
      <%}%>
      </select></td></tr>
   <tr><td> 
      <label>Relieving Date:</label></td><td>
      <%if(relievingdate==null){%>
        
         <input type="text" class="datepicker" id="dor"  name="relievedate" class="datepicker" autocomplete="off" placeholder="MM/DD/YYYY">
    <%}
      else{
   %>
   <input type="text" class="datepicker" id="dor"  name="relievedate" value="<%=apprelivingdate%>" class="datepicker" autocomplete="off" placeholder="MM/DD/YYYY"> <%}%></td></tr>
   
   <tr><td> 
      <input type="submit" id="submit" name="submit" value="Save Changes"></td><td>
      <a href="userprofilemaintenance.jsp">Cancel</a></td></tr>
    </table>
  </form>
</div>
<%
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
		 	
				</div>
				<div class="footer">
					<label id="cr-foot">© 2015. Rapid Care Transcriptions Private Limited.</label>
				</div>
			</div>
		
	</div>
       </div>
</body>	
</html>