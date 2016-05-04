<%-- 
    Document   : insernewtagdet
    Created on : Dec 15, 2014, 4:15:21 PM
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
int noofchoices=0;
ArrayList<String> lallaudchoices=new ArrayList<String>();
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
<div class="noofchoices" id="noofchoices"><label>No of choices:</label><input type="text" id="inpnoofchoices" autocomplete="off" required></div>
<div class="choicesandpt" id="choicesandpt">
  <table class="tabchpt" id="tabchpt">
     <tr><th>Choice Name</th><th>Performance Time in Sec</th></tr>
  </table>
  <div class="inschptbut" id="inschptbut" name="inschptbut">
    <input type="button" id="insaudchoandpt" class="insaudchoandpt" onclick="insnewchoiceandpt()" value="INSERT CHOICES AND PT">
    <input type="button" id="removechoices" class="removechoices" onclick="removechoices()" value="REMOVE CHOICE">
  </div>
  <div class="choicesdiv" id="choicesdiv">
            <label>Choices:</label><select name="allaudchoices" id="allaudchoices">
            <option name="null" id="null" value=""></option>
            <%
            for(int j=0;j<lallaudchoices.size();j++){
              %>
              <option name="<%=lallaudchoices.get(j)%>" id="allaudchops" class="allaudchops"><%=lallaudchoices.get(j)%></option>
<%}%>
          </select>
          <div class="entervalues" id="entercnvalues"></div>
          <input type="button" value="INSERT CHOICE NAME" id="insertchoice" onclick="getInput(this.id)">
          
        </div>
  </div>