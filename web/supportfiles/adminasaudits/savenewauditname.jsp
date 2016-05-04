<%-- 
    Document   : savenewauditname
    Created on : Dec 17, 2014, 9:29:22 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.dbaccess.*"%>
<%
int noofstops=0;
String auditName=null;
String auditnameSel=null;
String locName=null;
int locationsId=0;
int clientsId=0;
int allauditsid=0;
String auditsgroupName=null;
int auditsid=0;
ArrayList<String> lasallaudits=new ArrayList<String>();
noofstops=Integer.parseInt(request.getParameter("noofstops"));
auditName=request.getParameter("auname");
auditsgroupName=request.getParameter("audgname");
locName=request.getParameter("locname");
auditnameSel=request.getParameter("audnamsel");
Connection con=DBConnect.startConnection();
PreparedStatement pstm=null;
try{
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("Select * from asaudits where auditsname LIKE '"+auditsgroupName+"' ");
  while(res.next()){
    auditsid=res.getInt("auditsid");
  }
  ResultSet res1=st.executeQuery("SELECT * from aslocations where locationsname LIKE '"+locName+"' ");  
  while(res1.next()){
  locationsId=res1.getInt("locationsid");
  clientsId=res1.getInt("clientsid");
  }
 
  if(auditnameSel.equals("")){
    
  pstm=con.prepareStatement("INSERT INTO asallaudits(allauditsname,noofstops,auditsid,locationsid,clientsid) values(?,?,?,?,?)");
  pstm.setString(1,auditName);
  pstm.setInt(2, noofstops);
  pstm.setInt(3, auditsid);
  pstm.setInt(4, locationsId);
  pstm.setInt(5,clientsId);
  pstm.executeUpdate();
  }
  else{
    ResultSet res2=st.executeQuery("SELECT * from asallaudits where allauditsname LIKE '"+auditnameSel+"' ");
    while(res2.next()){
      allauditsid=res2.getInt("allauditsid");
    }
    
    st.executeUpdate("UPDATE asallaudits set allauditsname='"+auditName+"', noofstops="+noofstops+", auditsid="+auditsid+" where allauditsid LIKE "+allauditsid+" ");
   
  }
  
ResultSet res3=st.executeQuery("SELECT * from asallaudits where locationsid LIKE "+locationsId+" ");
while(res3.next())
{
  lasallaudits.add(res3.getString("allauditsname"));
}
}
catch(Exception e){
System.out.println(e);
}
%>
<lable>Audit Name:</lable>
        <select name="auditname" class="audname" id="audname" onchange="getauditDet()">
        <option name="null" value=""></option>
       <% for(int i=0;i<lasallaudits.size();i++){%>
       <option name="<%=lasallaudits.get(i)%>" value="<%=lasallaudits.get(i)%>"><%=lasallaudits.get(i)%></option>  
          <%}%>
      </select>
        <div class="entervalues" id="enteraavalues"></div>
        <div class="allauddet" id="allauddet">     
        </div>
        <input type="button" value="INSERT" id="insertaudit" onclick="insertnewaud()">
        <input type="button" value="UPDATE" id="updateaudit" onclick="updatenewaud()">
                                                                    