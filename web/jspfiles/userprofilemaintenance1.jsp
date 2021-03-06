<%-- 
    Document   : userprofilemaintanence
    Created on : Dec 23, 2014, 7:13:15 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Profile Maintenance</title>
    <style>
      #profilediv{
        //width:auto;
       // overflow-x: scroll;
       // overflow-y: scroll;
      //  height: auto;
        //max-height: 800px;
      }
      td, th{
        overflow: no-content;
        //width:auto;
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
        td{
          align:center;
        }
        .fixcol{
          position: relative;
          //position: relative;
        }
        td:nth-child{
          position:  static;
        }
        /*.fixcol:before{
          content: 'Row';
        }*/
    </style>
  </head>
  <%
  int profileid=0;
  String fullname=null;
  String userid=null;
  String fathername=null;
  String mailid=null;
  String address=null;
  String mobNo=null;
  String emergencyMobno=null;
  String dob=null;
  String gender=null;
  String bloodgroup=null;
  String profileStatus=null;
  String dept=null;
  String dedicatedProject=null;
  String empId=null;
  String acclevel=null;
  String marritalstatus=null;
  int target=0;
  String team=null;
  String doj=null;
  String releiveDate=null;
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
  SimpleDateFormat sdfapp=new SimpleDateFormat("MM/dd/yyyy");
  Date dobdate;
  Date dojdate;
  Date dordate;
  ArrayList<String> lappdob=new ArrayList<String>();
  ArrayList<String> lappdoj=new ArrayList<String>();
  ArrayList<String> lappdor=new ArrayList<String>();
  
  ArrayList<String> lfullname=new ArrayList<String>();
  ArrayList<Integer> lprofileid=new ArrayList<Integer>();
  ArrayList<String> luserid=new ArrayList<String>();
  ArrayList<String> lfathername=new ArrayList<String>();
  ArrayList<String> lmailid=new ArrayList<String>();
  ArrayList<String> laddress=new ArrayList<String>();
  ArrayList<String> ldob=new ArrayList<String>();
  ArrayList<String> lgender=new ArrayList<String>();
  ArrayList<String> lbloodgroup=new ArrayList<String>();
  ArrayList<String> lprofileStatus=new ArrayList<String>();
  ArrayList<String> ldept=new ArrayList<String>();
  ArrayList<String> ldedicatedProject=new ArrayList<String>();
  ArrayList<String> lempId=new ArrayList<String>();
  ArrayList<String> laccesslevel=new ArrayList<String>();
  ArrayList<String> lreleiveDate=new ArrayList<String>();
  ArrayList<String> lmobNo=new ArrayList<String>();
  ArrayList<String> lemergencyMobno=new ArrayList<String>();
  ArrayList<String> ldoj=new ArrayList<String>();
  ArrayList<String> lteam=new ArrayList<String>();
  ArrayList<Integer> ltarget=new ArrayList<Integer>();
  ArrayList<String> lmarritalstatus=new ArrayList<String>();
  ArrayList<String> ldesignation=new ArrayList<String>();
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("select * from userprofilepersonal as a join userprofileofficial as b on a.profileid=b.profileid");
  while(res.next()){
   lfullname.add(res.getString("a.fullname"));
   lprofileid.add(res.getInt("a.profileid"));
   luserid.add(res.getString("a.username"));
   lfathername.add(res.getString("a.fathername"));
   lmailid.add(res.getString("a.mailid"));
   laddress.add(res.getString("a.address"));
   ldob.add(res.getString("a.dob"));
   lgender.add(res.getString("a.gender"));
   lmobNo.add(res.getString("a.mobno"));
   lemergencyMobno.add(res.getString("a.emergencymobno"));   
   lbloodgroup.add(res.getString("a.bloodgroup"));
   lprofileStatus.add(res.getString("a.profilestatus"));
   ldept.add(res.getString("b.department"));
   ldedicatedProject.add(res.getString("b.dedicatedproject"));
   lempId.add(res.getString("b.kpoempid"));
   laccesslevel.add(res.getString("b.accesslevel"));
   lreleiveDate.add(res.getString("b.relievingdate"));
   ldesignation.add(res.getString("b.designation"));
   lteam.add(res.getString("b.team"));
   ldoj.add(res.getString("b.doj"));
   ltarget.add(res.getInt("b.targetpermonth"));
   lmarritalstatus.add(res.getString("a.marritalstatus"));
  }
  %>
  <body>
    <strong>User Profile Update</strong>
    <div class="profilediv" id="profilediv">
      <a href="register.jsp">Create Account</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="resignedemployees.jsp">Resigned Employees</a>
      <table class="proftab" id="proftab">
        <tr><th>S.No</th><th>Full Name</th><th>User ID</th><th>Father Name</th><th>Mail Address</th><th>Address</th><th>Mob No</th><th>Emergency No</th><th>DOB</th><th>Gender</th><th>Marital Status</th><th>Blood Group</th><th>DOJ</th><th>Department</th><th>Team</th><th>Dedicated Project</th><th>Target</th><th>Emp ID</th><th>Designation</th><th>Access Level</th><th>Profile Status</th><th></th></tr>
        <%
        for(int i=0;i<lfullname.size();i++){
           dobdate=sdf.parse(ldob.get(i));
        lappdob.add(sdfapp.format(dobdate));
          if(ldoj.get(i)!=null){
        dojdate=sdf.parse(ldoj.get(i));
        lappdoj.add(sdfapp.format(dojdate));
          }
          else{
            //lappdob.add("");
            lappdoj.add(null);
          }
          if(lreleiveDate.get(i)!=null){
            dordate=sdf.parse(lreleiveDate.get(i));
            lappdor.add(sdfapp.format(dordate));
          }
          else{
            lappdor.add(null);
          }
        %>
        <tr>
          <td class="fixcol"><%=i+1%>
          <td class="fixcol"><%=lfullname.get(i)%></td>
          <td><%=luserid.get(i)%></td>
          <td><%=lfathername.get(i)%></td>
          <td><%=lmailid.get(i)%></td>
          <td><%=laddress.get(i)%></td>
          <td><%=lmobNo.get(i)%></td>
          <td><%=lemergencyMobno.get(i)%></td>
          <td><%=lappdob.get(i)%></td>
          <td><%=lgender.get(i)%></td>
          <td><%=lmarritalstatus.get(i)%></td>
          <td><%=lbloodgroup.get(i)%></td>
          <td>
            <%if(lappdoj.get(i)!=null){%><%=lappdoj.get(i)%><%}else{}%></td>
          <td><%=ldept.get(i)%></td>
          <td><%=lteam.get(i)%></td>
          <td>
          <%if(ldedicatedProject.get(i)!=null){%><%=ldedicatedProject.get(i)%><%}else{}%>
          </td>
          <td>
            <%if(ltarget.get(i)!=0){%><%=ltarget.get(i)%><%}else{}%>
          </td>
          <td><%if(lempId.get(i)!=null){%><%=lempId.get(i)%><%}else{}%></td>
          <td><%if(ldesignation.get(i)!=null){%><%=ldesignation.get(i)%><%}else{}%></td>          
          <td><%=laccesslevel.get(i)%></td>
          <td><%=lprofileStatus.get(i)%></td>     
          <td><a href="userprofedit.jsp?profid=<%=lprofileid.get(i)%>" method="post">Update</a>
        </tr>
     <% }
        }
  catch(Exception e){ 
  }
        %>
      </table>
    </div>
   
  </body>
</html>
