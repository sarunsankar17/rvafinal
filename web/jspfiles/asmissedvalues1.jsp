
<%-- 
    Document   : test
    Created on : Jul 15, 2014, 3:27:29 AM
    Author     : RCT-456
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.administrator.ASMissValuesBean"%>
<%@page import="rva.administrator.ASMissedValDAO"%>


<!DOCTYPE html>
<%
ArrayList<String> lauditName=new ArrayList<String>();
ArrayList<String> llocationName=new ArrayList<String>();
ArrayList<String> lperformDate=new ArrayList<String>();
ArrayList<String> lauditorName=new ArrayList<String>();
ArrayList<String> lclientName=new ArrayList<String>();
ArrayList<String> lchoiceName=new ArrayList<String>();
ASMissValuesBean as=new ASMissValuesBean();
ASMissedValDAO asd=new ASMissedValDAO();
as=asd.getValues();
lauditName=as.getlAuditName();
lauditorName=as.getlAuditorName();
lclientName=as.getlClientName();
llocationName=as.getlLocationName();
lperformDate=as.getlPerformDate();
lchoiceName=as.getlChoiceName();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AS Missed Data's</title>
        <style>
          .asmisdatas{
            width:100%;
            //height:1000px;
           // overflow-x: scroll;
            //overflow-y: scroll;
          }
         table,tr,td,th{
           border:2px solid #fff;
           border-collapse: collapse;
         }
         table{
           width:900px;
         }
         .datepicker{
           width:100px;
         }
         th{
           background-color: lightblue;
           //position:absolute;
         }
         
         tr:nth-child(odd){
           background-color: aliceblue;
         }
         tr:last-child{
           background-color: #FFFFFF;
         }
       </style>
    </head>
    <body>
       <strong>AS Missed Datas</strong> 
        <form action="ASMissValues" method="POST">
        <input type="submit" name="submit" value="READ VALUES">
    </form>
       <div class="asmisdatas">
        <table>
            <tr><th>Count</th><th>Audit Name</th><th>Location Name</th><th>Client Name</th><th>Choice Name</th><th>Performed Date</th><th>Auditor Name</th>
            </tr>
            <%if(lauditName.size()>0)
            {
            for(int i=0;i<lauditName.size();i++)
            {
                %>
                <tr><td><%=i+1%></td><td><%=lauditName.get(i)%></td><td><%=llocationName.get(i)%></td><td><%=lclientName.get(i)%></td><td><%=lchoiceName.get(i)%></td>
                    <td><%=lperformDate.get(i)%></td><td><%=lauditorName.get(i)%></td>
                
                
            <%}
            }
            else%><tr><td colspan="6" align="center"/>No Values Found</td></tr>
        
        </table>
       </div>
    </body>
</html>
