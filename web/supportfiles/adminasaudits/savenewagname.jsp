<%-- 
    Document   : savenewagname
    Created on : Dec 16, 2014, 6:08:27 PM
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
  int noofChoices=0;
  int asagnameid=0;
  int auditchoicesid=0;
  PreparedStatement pstm=null;
  String auditGroupName=null;
  String choicesName=null;
  String perfTime=null;
  String chonamearr[]=null;
  String perftimearr[]=null;
  String audgroupnamesel=null;
  audgroupnamesel=request.getParameter("audgselname");
  noofChoices=Integer.parseInt(request.getParameter("noofchoices"));
  auditGroupName=request.getParameter("agname");
  choicesName=request.getParameter("chonames");
  perfTime=request.getParameter("perftimes");
  chonamearr=choicesName.split(",");
  perftimearr=perfTime.split(",");
  ArrayList<String> lauditgName=new ArrayList<String>();
  int[] perftimeintarr=new int[noofChoices];

  Connection con=DBConnect.startConnection();
  try{
      for(int i=0;i<chonamearr.length;i++){
perftimeintarr[i]=Integer.parseInt(perftimearr[i]);
}
      Statement st=con.createStatement();
      if(audgroupnamesel.equals("")){
     pstm=con.prepareStatement("INSERT INTO asaudits(auditsname,noofchoices) values(?,?) ");
     pstm.setString(1,auditGroupName);
     pstm.setInt(2,noofChoices);
     pstm.executeUpdate();
     ResultSet res=st.executeQuery("SELECT * from asaudits where auditsname LIKE '"+auditGroupName+"' ");
     while(res.next()){
         asagnameid=res.getInt("auditsid");
     }
     for(int i=0;i<chonamearr.length;i++){
         ResultSet res1=st.executeQuery("Select * from aschoices where choicesname LIKE '"+chonamearr[i]+"' ");
         while(res1.next()){
          auditchoicesid=res1.getInt("choicesid");   
         }
         pstm=con.prepareStatement("INSERT INTO asauditstimetoperform(auditsid,choicesid,timetoperforminsec) values(?,?,?)");
         pstm.setInt(1, asagnameid);
         pstm.setInt(2,auditchoicesid);
         pstm.setInt(3,perftimeintarr[i]);
         pstm.executeUpdate();
     }
     ResultSet res2=st.executeQuery("Select * from asaudits");
     while(res2.next()){
       lauditgName.add(res2.getString("auditsname")); 
     }
    }
      else{
        ResultSet res=st.executeQuery("SELECT * from asaudits where auditsname LIKE '"+audgroupnamesel+"' ");
        while(res.next()){
          asagnameid=res.getInt("auditsid");
        }
        st.executeUpdate("UPDATE asaudits set noofchoices="+noofChoices+" where auditsid LIKE "+asagnameid+" ");
        st.executeUpdate("Delete from asauditstimetoperform where auditsid LIKE "+asagnameid+" ");
        for(int i=0;i<chonamearr.length;i++){
         ResultSet res1=st.executeQuery("Select * from aschoices where choicesname LIKE '"+chonamearr[i]+"' ");
         while(res1.next()){
          auditchoicesid=res1.getInt("choicesid");   
         }
         pstm=con.prepareStatement("INSERT INTO asauditstimetoperform(auditsid,choicesid,timetoperforminsec) values(?,?,?)");
         pstm.setInt(1, asagnameid);
         pstm.setInt(2,auditchoicesid);
         pstm.setInt(3,perftimeintarr[i]);
         pstm.executeUpdate();
     }
     ResultSet res2=st.executeQuery("Select * from asaudits");
     while(res2.next()){
       lauditgName.add(res2.getString("auditsname")); 
     }
        
   }
  }
  catch(Exception e){
      e.printStackTrace();
  }

%>

<div class="audgroupname" id="audgroupname">
          <label><b>Audit group name:</b></label>
          <select class="audgsel" id="audgsel" onchange="audgnSel()">
            <option name="audgop" value=""></option>
            <%
            for(int i=0;i<lauditgName.size();i++){%>
            <option name="<%=lauditgName.get(i)%>" id="<%=lauditgName.get(i)%>" value="<%=lauditgName.get(i)%>"><%=lauditgName.get(i)%></option>
            <% }
            %>
  </select>
            <div class="entervalues" id="enteragvalues">
              
            </div>
 <input type="button" id="insnewagname" value="INSERT NEW AUDIT GROUP NAME" name="insnewagname" onclick="insertnewAGName()">
         
        </div>
            <div class="choandptdet" id="choandptdet">
            </div>