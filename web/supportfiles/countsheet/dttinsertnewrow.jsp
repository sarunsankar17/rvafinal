<%-- 
    Document   : envysioninsertnewrow
    Created on : Jan 5, 2015, 4:58:04 PM
    Author     : RCT-456
--%>

<%@page import="rva.taskinsert.GettingDTTTaskId"%>
<%@page import="rva.taskinsert.DTTBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<!DOCTYPE html>
<%
Connection con=DBConnect.startConnection();
                       
           DTTBean dttbean=new GettingDTTTaskId().getdttcltname();
            ArrayList<String> taskname=dttbean.gettasksname();
            ArrayList<String> processstage=dttbean.getprocessStage();
            %>

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
                </select></td>