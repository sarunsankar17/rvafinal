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
  ResultSet res=st.executeQuery("SELECT a.noofstops,b.noofchoices,b.auditsname,b.auditsid from asallaudits as a JOIN asaudits as b ON a.auditsid=b.auditsid where a.allauditsname LIKE '"+allaudName+"' ");
  while(res.next()){
    noofstops=res.getInt("noofstops");
    noofchoices=res.getInt("noofchoices");
    audgroupName=res.getString("auditsname");
    auditsid=res.getInt("auditsid");
  }
  ResultSet res1=st.executeQuery("SELECT a.choicesname,b.timetoperforminsec from aschoices as a JOIN asauditstimetoperform as b on a.choicesid=b.choicesid where b.auditsid LIKE "+auditsid+" ");
  while(res1.next())
  {
  laudchoices.add(res1.getString("a.choicesname"));
  laudperformTime.add(res1.getInt("b.timetoperforminsec"));
  }
  ResultSet res2=st.executeQuery("SELECT auditsname from asaudits");
  while(res2.next()){
    laudnameGroup.add(res2.getString("auditsname"));
  }
  ResultSet res3=st.executeQuery("SELECT choicesname from aschoices");
  while(res3.next()){
    lallaudchoices.add(res3.getString("choicesname"));
  }
  %>

<div class="noofstops" id="noofstops"><label>No of stops:</label>
  <input type="text" id="inpnoofstops" value='<%=noofstops%>' readonly autocomplete="off" required> 
  
</div>
      <div class="auditgroupdet" id="auditgroupdet">
        <div class="audgroupname" id="audgroupname">
          
          <label><b>Audit group name:</b></label>
          <select class="audgsel" id="audgsel" onchange="audgnSel()" disabled>
            <option name="audgop" value=""></option>
            <%
            for(int i=0;i<laudnameGroup.size();i++){
              if(laudnameGroup.get(i).equals(audgroupName))
              {%>
            <option name="<%=laudnameGroup.get(i)%>" id="<%=laudnameGroup.get(i)%>" value="<%=laudnameGroup.get(i)%>" selected><%=laudnameGroup.get(i)%></option>
            <%}
              else{%>
                <option name="<%=laudnameGroup.get(i)%>" id="<%=laudnameGroup.get(i)%>" value="<%=laudnameGroup.get(i)%>"><%=laudnameGroup.get(i)%></option>
 <% }}%>
 </select>
                      <div class="entervalues" id="enteragvalues"></div>
 <input type="button" id="insnewagnamebut" value="INSERT NEW AUDIT GROUP NAME" name="insnewagnamebut" onclick="insertnewAGName()" disabled>
          
        </div>

 <div class="choandptdet" id="choandptdet">
    <div class="noofchoices" id="noofchoices"><label>No of choices:</label><input type="text" id="inpnoofchoices" value='<%=noofchoices%>' readonly autocomplete="off" required></div>
        <div class="choicesandpt" id="choicesandpt">
         
          <table class="tabchpt" id="tabchpt">
            <tr><th>Choice Name</th><th>Performance Time in Sec</th></tr>
            <%
          for(int i=0;i<laudchoices.size();i++){
            %>
            <tr><td>
                <select name="allaudchoices" class="allaudchoices" id="allaudchoices" disabled>
                  <option name="null" id="null" value=""></option>
                  <%for(int j=0;j<lallaudchoices.size();j++){
                  if(lallaudchoices.get(j).equals(laudchoices.get(i))){
                    %>
                    <option name="<%=lallaudchoices.get(j)%>" id="allaudchops" class="allaudchops" selected><%=lallaudchoices.get(j)%></option>
                 <% }
                  else{
                    %>
                    <option name="<%=lallaudchoices.get(j)%>" id="allaudchops" class="allaudchops"><%=lallaudchoices.get(j)%></option>
                 <%
                  }
                }%></select></td>
              <td><input type="text" value='<%=laudperformTime.get(i)%>' name="perftime" class="performtime" id="performtime" required autocomplete="off" readonly></td></tr>
          <%
          }
          %></table>
        </div>
   <div class="inschptbut" id="inschptbut" name="inschptbut">
      <input type="button" id="insaudchoandpt" class="insaudchoandpt" onclick="insnewchoiceandpt()" value="INSERT CHOICES AND PT" disabled>
    <input type="button" id="removechoices" class="removechoices" onclick="removechoices()" value="REMOVE CHOICE" disabled>
   </div>
        
      
 
        <div class="choicesdiv" id="choicesdiv">
            <label>Choices:</label><select name="allaudchoices" class="allaudchoices" id="allaudchoices" disabled>
            <option name="null" id="null" value=""></option>
            <%
            for(int j=0;j<lallaudchoices.size();j++){
              %>
              <option name="<%=lallaudchoices.get(j)%>" id="allaudchops" class="allaudchops"><%=lallaudchoices.get(j)%></option>
<%}%>
          </select>
          <div class="entervalues" id="entercnvalues"></div>
          <input type="button" value="INSERT CHOICE NAME" id="insertchoice" onclick="getInput(this.id)" disabled>
          
        </div>
        </div>
      </div>
<%
}
catch(Exception e){
  e.printStackTrace();
}
%>

