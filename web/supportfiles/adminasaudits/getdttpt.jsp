<%-- 
    Document   : getdttpt
    Created on : Jan 21, 2015, 3:53:58 PM
    Author     : RCT-456
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%
  try{
    ArrayList<String> ldttprocessstage=new ArrayList<String>();
    ArrayList<Integer> pt=new ArrayList<Integer>();
    String taskname=request.getParameter("task");
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("SELECT b.dtttaskname,c.dttprocessstagename,a.performancetime FROM dttprocessandpt as a join dtttaskdetails as b join dttprocessstage as c on a.dtttaskid=b.dtttasksid and a.dttprocessstageid=c.dttprocessstageid WHERE b.dtttaskname like '"+taskname+"' ");
    while(res.next()){
     ldttprocessstage.add(res.getString("c.dttprocessstagename"));
     pt.add(res.getInt("a.performancetime"));
    }%>
    <table> <tr><th><label>Process Stage</label></th><th><label>Time to Perform in Minutes</label></th></tr>
<%
    for(int i=0;i<ldttprocessstage.size();i++){
    %>
    <tr><td><input type="text" name="processstage" value="<%=ldttprocessstage.get(i)%>" readonly id="dttperftime"></td>
  <td><input type="text" name="perftime" value="<%=pt.get(i)%>" readonly id="dttperftime"></td>
    </tr><%}%></table><%
  }
catch(Exception e){
  e.printStackTrace();
}
%>