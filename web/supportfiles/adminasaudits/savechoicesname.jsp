<%-- 
    Document   : savechoicesname
    Created on : Dec 17, 2014, 5:26:15 PM
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
  
int auditsid=0;
int choicesid=0;
ArrayList<Integer> laudperftime=new ArrayList<Integer>();
ArrayList<String> lchoicesname=new ArrayList<String>();
String auditgroupName=request.getParameter("agname");
String choicesName=request.getParameter("choicesname");
Connection con=DBConnect.startConnection();
PreparedStatement pstm=null;
try{
  Statement st=con.createStatement();
//if(auditgroupName.equals("")){
pstm=con.prepareStatement("INSERT INTO aschoices(choicesname) VALUES (?)");
pstm.setString(1,choicesName);
pstm.executeUpdate();
ResultSet res=st.executeQuery("Select * from aschoices");
while(res.next()){
  lchoicesname.add(res.getString("choicesname"));
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
            for(int j=0;j<lchoicesname.size();j++){
              %>
              <option name="<%=lchoicesname.get(j)%>" id="allaudchops" class="allaudchops"><%=lchoicesname.get(j)%></option>
<%}%>
          </select>
          <div class="entervalues" id="entercnvalues"></div>
          <input type="button" value="INSERT CHOICE NAME" id="insertchoice" onclick="getInput(this.id)">
          
        </div>
  </div><%
//}
}
catch(Exception e){
  e.printStackTrace();
}

%>