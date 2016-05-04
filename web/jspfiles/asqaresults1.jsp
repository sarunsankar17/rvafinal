<%-- 
    Document   : asqareults1
    Created on : Nov 4, 2014, 12:14:09 PM
    Author     : Arun-S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rva.showperformance.ASQAChecklistBean"%>
<%@page import="rva.showperformance.ASQAChecklistProcessing"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
  <head>
  <style>
       
        
    </style>
  </head>
<%
ArrayList<String> lauditorName=new ArrayList<String>();
ArrayList<String> lclientName=new ArrayList<String>();
String sappDate;
String eappDate;
ArrayList<Float> lqaperformanceTime =new ArrayList<Float>();
ASQAChecklistBean asqaclb=(ASQAChecklistBean) session.getAttribute("asqachecklistres");
lauditorName=asqaclb.getlauditorName();
lclientName=asqaclb.getlclientName();
sappDate=asqaclb.getstartDate();
eappDate=asqaclb.getendDate();
lqaperformanceTime=asqaclb.getlAsQAResults();
DecimalFormat df=new DecimalFormat("0.00");
float total=0.00f;
if(lauditorName.size()>0)
{
    %>
    <table class="asqares" name="asqares">
      <tr><th>S. No</th><th>Auditor Name</th><th>Client Name</th><th>Performance Time in Hrs</th></tr>
        <%
        for(int i=0;i<lauditorName.size();i++)
        {
        total=total+lqaperformanceTime.get(i);
        %>
        <tr>
          <td><%=i+1%></td>
            <td><%=lauditorName.get(i)%></td>
            <td><%=lclientName.get(i)%></td>
            
            <td><%=df.format(lqaperformanceTime.get(i))%></td>
        </tr>  
        <%}
        %>
        <tr><td colspan="3">Total</td><td><%=df.format(total)%></td></tr>
    </table>
    <%}
else
{
    %>
    <p>No results available for this selection.</p><%
}
%>    
</html>
