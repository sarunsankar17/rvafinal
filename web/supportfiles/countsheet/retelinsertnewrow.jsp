<%-- 
    Document   : retelinsertnewrow
    Created on : Oct 23, 2014, 11:12:35 PM
    Author     : RCT-456
--%>
<%@page import="java.util.*"%>
<%@page import="rva.taskinsert.RetelTasks"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>  
<%
  String filename=request.getParameter("fname");
  String filepath=request.getParameter("fpath");
  File file=new File("D:\\Datas\\uploadedfiles\\Retel");
  File fnamep[]=file.listFiles();
    for(int i=0;i<fnamep.length;i++){
      if(fnamep[i].isFile()){
      String fname=fnamep[i].getName();
      if(fname.equalsIgnoreCase(filename))
      {
        System.out.println(fname+"File Name Match");
        %>
        
        <script>
          $("#submit").attr("disabled",true);
          $("#fileid").val("");
        </script>
        
        <%
      }
      else{
        System.out.println(fname+"File Name Not Match");
          %>
        <script>
          $("#submit").attr("disabled",false);
          //$("#fileid").val("");
        </script>
        <%
          }
      }
    }
%> 
  
  </body>
</html>
