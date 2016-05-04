<%-- 
    Document   : inschosandpt
    Created on : Dec 15, 2014, 5:04:02 PM
    Author     : RCT-456
--%>

<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>

<%
int noofstops=0;
int noofchoices=0;
int auditsid=0;
ArrayList<String> laudnameGroup=new ArrayList<String>();
ArrayList<String> laudchoices=new ArrayList<String>();
ArrayList<String> lallaudchoices=new ArrayList<String>();
ArrayList<Integer> laudperformTime=new ArrayList<Integer>();
String allaudName=null;
String audgroupName=null;
allaudName=request.getParameter("allaudname");
Connection con=DBConnect.startConnection();
try{
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("Select * from aschoices");
  while(res.next()){
  lallaudchoices.add(res.getString("choicesname"));
}
}
catch(Exception e){
  e.printStackTrace();
}

%>
<tr><td>
  <select name="allaudchoices" class="allaudchoices" id="audchoices" required>
                  <option name="null" id="null" value=""></option>
                  <%
                 for(int i=0;i<lallaudchoices.size();i++){
                  %>
                 <option name="<%=lallaudchoices.get(i)%>" id="allaudchops" class="allaudchops" value="<%=lallaudchoices.get(i)%>"><%=lallaudchoices.get(i)%></option>

<%}%>
  </select>            
  </td><td><input type="text" value='' name="perftime" class="performtime" id="performtime" required autocomplete="off"></td>