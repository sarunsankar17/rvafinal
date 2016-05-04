<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head>
	<title>File Uploading</title>
       <link rel="stylesheet" href="cssfiles/stydp.css">
        </head>
<body>
	<strong>AS Report File Upload</strong>
<br><br>
<form action="ASRepFileUpload" method="POST" enctype="multipart/form-data">
    <label>Select A File To Upload:</label>
<div id="filecheck"><input type="file" name="file" value="CHOOSE FILE" required>
  <div id="hovertext"><p>Please Make Sure This, Before Uploading The File!</p>
              <ul>
                <li>File Should Be Saved As ".xls" Format.</li>
                <li>Remove Column I(Camera/Device).</li>
                <li>Columns Are C->Audit Name;D->Location Name;E->Client Name;L->Audit Choice;O->Original Auditor;R->Date/Time Instance Added To Queue;</li>
                <li>File Name Should Be Performed Date In(MMDDYY). EX.(010115)</li>
                </ul></div></div>
<br><br>
<input type="submit" value="UPLOAD FILE">
<%
  String val=null;
  
String uploadfilepath=(String) session.getAttribute("filepathas");
if(uploadfilepath!=null){
  session.setAttribute("filepathas",val);
  %>
  <br><br><label>Your file has been upload to "<%=uploadfilepath%>"</label><%
}
else{
  
}
%>
</form>
				
</body>	
</html>