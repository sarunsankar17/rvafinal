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
	<strong>DTT Report File Upload</strong>
<br><br>
<form action="DTTRepFileUpload" method="POST" enctype="multipart/form-data">
    <label>Select A File To Upload:</label>
<div id="filecheck"><input type="file" name="file" value="CHOOSE FILE" required>
  <div id="hovertext"><p>Please Make Sure This, Before Uploading The File!</p>
              <ul>
                <li>File Should Be Saved As ".xls" Format.</li>
                <li>Columns Are B->LogMeIn Name;C->Task Name;D->Auditor Name;E->Perform Date;F->Process Till;</li>
                
                </ul></div></div>
<br><br>
<input type="submit" value="UPLOAD FILE">
<%
  String val=null;
  
String uploadfilepath=(String) session.getAttribute("filepathdtt");
if(uploadfilepath!=null){
  session.setAttribute("filepathdtt",val);
  %>
<br><br><label>Your file has been upload to "<%=uploadfilepath%>"</label><%
}
else{
  
}
%>
</form>
				
</body>	
</html>