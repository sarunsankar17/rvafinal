<%-- 
    Document   : insertnewid1
    Created on : Jan 30, 2015, 1:51:14 PM
    Author     : RCT-456
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
  #entervalues{
    visibility:hidden;
  }
  #serdata{
    width:auto;
    height:auto;
  }
 .entervalues{
    margin:2px;
  }
  #newasid, #saveid{
    margin:2px;
  }
        table, tr, th, td{
            border:1px solid #fff;
            border-collapse: collapse;
        }
        table{
            width:99%;
            margin:2px 2px 5px 2px;
        }
        th
        {
            background-color: lightblue;
        }
        td,th{
            margin:2px;
        }
        tr:nth-child(odd){
            background-color : aliceblue;
        }
        tr:nth-child(even){
            background-color : ffffff;
        }
        #insasidhref{
          color: #000;
          width:100px;
          height: 3px;
          background-color: lightblue; 
        }
        #updlink{
          color: #449d44;
          text-decoration: underline;
        }
        .asiddetails{
          height: auto;
          width:100%;
          overflow-x: scroll;
            overflow-y: scroll;    
        }
    </style>
  </head>
<%
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=null;
  ArrayList<String> asloginid=new ArrayList<String>();
  ArrayList<Integer> asloginidrowno=new ArrayList<Integer>();
  ArrayList<String> auditorsname=new ArrayList<String>();
  res=st.executeQuery("SELECT a.auditorsloginid,a.auditorsloginname,b.auditorsname from asauditorslogin as a join auditors as b on a.auditorsid=b.auditorsid where auditorsloginname LIKE 'TID%' ");
  while(res.next()){
    asloginid.add(res.getString("a.auditorsloginname"));
    asloginidrowno.add(res.getInt("a.auditorsloginid"));
    auditorsname.add(res.getString("b.auditorsname"));
  }
  %>
<strong>AS Login Id Insert/Update</strong><br><br>
<div class="asiddetails">
  <form name="asloginid" id="asloginid" class="asloginid" action="" method="">
    <table id="logidtable" name="logidtable" class="logidtable">
      <tr><th>S.No</th><th>Auditors Login ID</th><th>Auditors Name</th><th>ID Assign</th></tr>
<%
    for(int i=0;i<asloginid.size();i++){
      %>
     
        <tr>
          <td><%=i+1%></td>
          <td>
            
             <label name="auditorsid" id="auditorsid" class="auditorsid">
               <%=asloginid.get(i)%></label>
          </td>
          <td>
           
              <label name="auditorsname" id="auditorsname" class="auditorsname">
                <%=auditorsname.get(i)%></label>
              </label>
          </td>
         <td><a id="updlink" href="insertnewid.jsp?action=<%="changeassignedid"%>&asauditorsrowno=<%=asloginidrowno.get(i)%>">Assign to Another</a></td>
        </tr>
    <%
    }
  %>
   </table>
  </form>
</div>
</html>

<%
}
catch(Exception e){
  e.printStackTrace();
}
%>
