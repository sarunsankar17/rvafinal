<%-- 
    Document   : test
    Created on : Jul 15, 2014, 3:27:29 AM
    Author     : RCT-456
--%>

<%@page import="rva.administrator.ChangeDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.userlogin.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="rva.showperformance.ASChecklistBean"%>
<%@page import="rva.showperformance.ASInfo"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv ="Content-Type" content="text/html; charset=UTF-8">
  <title>AS Performance Report</title>
  <script src="jsfiles/jquedp.js"></script>
  <script src="jsfiles/jquedpui.js"></script>
  <link rel="stylesheet" href="cssfiles/stydp.css">
  <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
  <script type="text/javascript" src="jsfiles/gridviewScroll.min.js"></script>
  
  <script type="text/javascript"> 
    $(document).ready(function () { 
        gridviewScroll(); 
    }); 
    function gridviewScroll() { 
        $("#keywords").gridviewScroll({ 
            width:900, 
            height:540 
        }); 
    } 
</script> 

        <style>
    #aschecklist{
            //margin-left: 60px;
            width:315px;
            //align:center;
            background-color: aliceblue;
        }
        
       #aschecklist th
        {
           text-align: left; 
           width:110px;
           //width:1%;
        }
        #submit,#mod{
          width:80px;
          //margin-top:10px;
        }
        input, select{
          width:130px;
        }
       #aschecklist td:nth-child(){
           // text-align:left;
            //width:295px;
            //width:1%;
            //height:15px;
        }
        #aschecklist ,#aschecklist th,#aschecklist tr,#aschecklist td
        
         {
             
            border-collapse: collapse;
            //border: 1px solid black;
        } 
        .insize{
            width:290px;
        }
        
        #asresults,#asresults tr,#asresults th,#asresults td{
            border:1px solid #fff;
            border-collapse: collapse;
        }
        #asresults{
            width:99%;
            margin:2px 2px 5px 2px;
        }
      #asresults  th
        {
            background-color: lightblue;
        }
       #asresults td,#asresults th{
            margin:2px;
        }
       #asresults tr:nth-child(odd){
            background-color : aliceblue;
        }
       #asresults tr:nth-child(even){
            background-color : ffffff;
        }
        #asresults td:last-child{
          text-align: right;
        }
        #repgen{
          margin:3px;
        }
    </style>
    <script>
      function genrateReport(){
        var xmlhttp;
        if(window.XMLHttpRequest){
          xmlhttp=new XMLHttpRequest();
        }
        else{
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
        }
        xmlhttp.onreadystatechange=function(){
          if(xmlhttp.readyState==4&&xmlhttp.status==200){
            alert("welcome1");
            var x=xmlhttp.responseText;
            window.open("\ASReportGen","_blank");
          }
           }
          xmlhttp.open("GET","\ASReportGen",true);
          xmlhttp.send();
      }
    </script>
    <script>
      function modifysearch(){
        //alert("welcome");
        var cn=document.getElementById("cliname").value;
       //alert(cn);
        document.getElementById("stdate").disabled=false;
        document.getElementById("endate").disabled=false;
        document.getElementById("cliname").disabled=false;
        if(cn!="-selectall-"){
        document.getElementById("locationname").disabled=false;
      }
      document.getElementById("submit").disabled=false;
        document.getElementById("shift").disabled=false;
        document.getElementById("auditorname").disabled=false;
      }
      </script>
           <script>
          
        function myfunction(client)
        {
          if(!(client=="-selectall-"))
          {
            var xmlhttp;
            if(window.XMLHttpRequest)
            {
              xmlhttp=new XMLHttpRequest();
            }
            else
            {
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function() 
            { 
              if(xmlhttp.readyState==4&&xmlhttp.status==200)
              {
                var x=xmlhttp.responseText.split('<br>')
                document.getElementById("aslnlable").innerHTML=x[0];
                document.getElementById("aslnval").innerHTML=x[1];
              }
            }
              xmlhttp.open("GET","supportfiles/asaudchecklist/getlocations.jsp?cli="+client,true);
              xmlhttp.send();
          }
          else
          {
            document.getElementById("aslnlable").innerHTML="";  
            document.getElementById("aslnval").innerHTML="";
          }
        }
  </script> 
  <script>
          $(document).ready(function(){
            var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            $("#stdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: maxDate,minDate:new Date(2014,00,01),
              onSelect: function(selected){
                $("#endate").datepicker("option","minDate",selected)
              }
            });
             var date=new Date();
            var maxDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-2);
            $("#endate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: maxDate,minDate:new Date(2014,00,01),
            onSelect: function(selected){
              $("#stdate").datepicker("option","maxDate",selected)
            }           
            });
          });
          </script>
          <script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
  </head>
  
  
  <body>  
    <%try
        {
    String setasres=null;
    %>
   <strong>AS Performance Report</strong>
   
       <%
      ArrayList<String> ascleints=new ArrayList<String>();
      ArrayList<String> aslocations=new ArrayList<String>();
      ArrayList<String> asauditors=new ArrayList<String>();
      ArrayList<String> aslshift=new ArrayList<String>();
      ASInfo asinfo=new ASInfo();
        Connection con=DBConnect.startConnection();
        LogBean lb=(LogBean) session.getAttribute("currloginsession");
        String accessl=lb.getAccesslevel();
        ascleints=asinfo.getasclientName();
        asauditors=asinfo.getasauditorsName();
          aslshift=asinfo.getasshiftTime();
          %>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%
  // ChecklistBean cklBean=new ChecklistBean();
   ArrayList<String> laudName=new ArrayList<String>();
   ArrayList<String> lcliName=new ArrayList<String>();
   ArrayList<String> llocateName=new ArrayList<String>();
   ArrayList<String> lstartDate=new ArrayList<String>();
   ArrayList<String> lendDate=new ArrayList<String>();
   ArrayList<Float> ltimetoPerform=new ArrayList<Float>();
   ArrayList<String> lshiftTime=new ArrayList<String>();
   float totalResult=0.00f;
   ChangeDateFormat cdf=new ChangeDateFormat();
   ASChecklistBean clb=(ASChecklistBean) session.getAttribute("currentasclvalues");
   session.setAttribute("currentasclvalues1",clb);
    if(!accessl.equalsIgnoreCase("Auditor")&&(!accessl.equalsIgnoreCase("QAAuditor"))){%>
   <a href="asbillinghours.jsp"><button>Add Billing Hours</button></a>
  <% }%>
    <form action="ASCheckList" method="POST">
  <% if(clb==null){
   %>
   <table id="aschecklist">
            <tr><th> Start Date</th><th> End Date</th><th>Client Name</th><th id="aslnlable"></th><th>Select Shift</th><th>Auditor Name</th><td><input type="button" onclick="modifysearch()" id="mod" value="MODIFY"></td></tr>
            <tr><td><input type="text" class="datepicker" id="stdate" autocomplete="off" name="performdate" required/></td>
        <td><input type="text" class="datepicker" id="endate" autocomplete="off" name="enddate" required></td>
        <td><select name="cliname" onchange="myfunction(this.value)" class="selsize" id="cliname">
                  
          <%
          for(int i=0;i<ascleints.size();i++)
         {%>
              <option name="<%=(ascleints.get(i))%>" value="<%=(ascleints.get(i))%>"  >
              <%=(ascleints.get(i))%></option>
        <%
      } %>
                      </select></td><td id="aslnval"></td>
              <td><select name="shift" class="selsize" id="shift">
             <%
             for(int i=0;i<aslshift.size();i++){%>
               <option name="<%=aslshift.get(i)%>" value="<%=aslshift.get(i)%>"><%=aslshift.get(i)%>
               </option>
           <%  }
             %>
              </select></td>
          <% 
          String audAccesslevel;
          String auditorName;
          
          audAccesslevel=(String) lb.getAccesslevel();
          auditorName=(String) lb.getAuditorname();
          %>
          <br>
          <td>
            <select name="auditorname" class="selsize" id="auditorname" required>
                 
                  <%for(int j=0;j<asauditors.size();j++){
                    if(!asauditors.get(j).equalsIgnoreCase("nill")){
                    %>
                      <option name="<%=asauditors.get(j)%>" value="<%=asauditors.get(j)%>">
                      <%=asauditors.get(j)%></option>
                      <%}
                    else{
                      
                    }                  
}%>
                  </select>
             </td>
                
    <td colspan="2" align="center"><input type="submit" id="submit" value="SUBMIT"></td></tr></table>
    
    
         <% }
   else
   {
            laudName=clb.getlauditorName();
            lcliName=clb.getlclientName();
            llocateName=clb.getllocationName();
            lstartDate=clb.getlstartDate();
            lendDate=clb.getlendDate();
            lshiftTime=clb.getlshiftTime();
           ltimetoPerform=clb.getltimetoPerform();
           
           String startdate=cdf.dbDatetoAppDate(clb.getstartDate());
           String enddate=cdf.dbDatetoAppDate(clb.getendDate());
           String cname=clb.getcleintName();
           String lname=clb.getlocationName();
           String stime=clb.getshiftTime();
           String auditorname=clb.getauditorName();
     %>
   
   <table id="aschecklist">
       <tr><th> Start Date</th><th> End Date</th><th>Client Name</th><th id="aslnlable"><%if(!cname.equalsIgnoreCase("-selectall-")){%>Location Name<%}else{}%></th><th>Select Shift</th><th>Auditor Name</th><td><input type="button" id="mod" onclick="modifysearch()" value="MODIFY"></td></tr>
            <tr><td><input type="text" class="datepicker" id="stdate" autocomplete="off" disabled value="<%=startdate%>" name="performdate" required/></td>
        <td><input type="text" class="datepicker" id="endate" autocomplete="off" value="<%=enddate%>" disabled name="enddate" required></td>
        <td><select name="cliname" onchange="myfunction(this.value)" disabled class="selsize" id="cliname">
        <%  for(int i=0;i<ascleints.size();i++)
         {
        if(ascleints.get(i).equals(cname)){
        %>
         
        <option name="<%=(ascleints.get(i))%>" value="<%=(ascleints.get(i))%>" selected  >
              <%=(ascleints.get(i))%></option>
        <%
      }
        else{%>
          <option name="<%=(ascleints.get(i))%>" value="<%=(ascleints.get(i))%>"  >
              <%=(ascleints.get(i))%></option>
<%}}%></select></td>
        <%
        if(cname.equalsIgnoreCase("-selectall-")){%>
           <td id="aslnval"></td>
                   
<%}
        else{%>
        <td id="aslnval">
        <%
          ArrayList<String> llocationname=new ArrayList<String>();
        llocationname=asinfo.getaslocationName(cname);
        %>
        <select id="locationname" disabled name="locationname" width="150px">
          <%
        for(int i=0;i<llocationname.size();i++){
          if(llocationname.get(i).equalsIgnoreCase(lname)){%>
            <option name="<%=llocationname.get(i)%>" id="locationname" value="<%=llocationname.get(i)%>" selected> 
            <%=llocationname.get(i)%>
        </option>
         <%}
          else{%>
             <option name="<%=llocationname.get(i)%>" id="locationname" value="<%=llocationname.get(i)%>"> 
            <%=llocationname.get(i)%>
        </option>
        <%  }
        }
        %></select></td><%
}%>
        <td><select name="shift" class="selsize" disabled id="shift">
             <%
             for(int i=0;i<aslshift.size();i++){
             if(stime.equalsIgnoreCase(aslshift.get(i))){
             %>
             <option name="<%=aslshift.get(i)%>" value="<%=aslshift.get(i)%>" selected><%=aslshift.get(i)%>
               </option>
           <%  }
             else{%>
               <option name="<%=aslshift.get(i)%>" value="<%=aslshift.get(i)%>"><%=aslshift.get(i)%>
               </option>
            <% }}
             %>
              </select></td>
          <% 
          String audAccesslevel;
          String auditorName;
         
          audAccesslevel=(String) lb.getAccesslevel();
          auditorName=(String) lb.getAuditorname();
          
          %>
          <br>
          <td>
            <select name="auditorname" disabled class="selsize" id="auditorname" required>
                  
                  <%for(int j=0;j<asauditors.size();j++){
                    if(asauditors.get(j).equalsIgnoreCase(auditorname)){
                    %>
                    <option name="<%=asauditors.get(j)%>" value="<%=asauditors.get(j)%>" selected>
                      <%=asauditors.get(j)%></option>
                      <%}
                    else{%>
                       <option name="<%=asauditors.get(j)%>" value="<%=asauditors.get(j)%>">
                      <%=asauditors.get(j)%></option>
                   <% }                  
}%>
                  </select>
             </td>
                
    <td><input type="submit" id="submit" disabled value="SUBMIT"></td></tr></table>
   </form>      
 <%if(laudName.size()>0){
   %> <input type="button" value="Generate Report" id="repgen" onclick="genrateReport()">
          <div id="wrapper">
           <table id="keywords" class="GridviewScrollHeader">
             <thead>
               <tr><th><span>S.No</span></th><th><span>Client Name</span></th><th><span>Location name</span></th><th><span>Shift</span></th><th><span>Auditor Name</span></th><th><span>Performance Time in hrs</span></th></tr></thead>
               <tbody><%
           DecimalFormat dc=new DecimalFormat("0.00");
           for(int i=0;i<laudName.size();i++)
           {  %>
               <tr class="GridviewScrollItem">
                 <td><%=i+1%></td>
                   <td><%=lcliName.get(i)%></td>
                   <td><%=llocateName.get(i)%></td>
                   
                   <td><%=lshiftTime.get(i)%></td>
                   <td><%=laudName.get(i)%></td>
                   <td><%=dc.format(ltimetoPerform.get(i))%>
                   </td></tr>
               <%
               totalResult=ltimetoPerform.get(i)+totalResult;
           }
           %></tbody>
               <tr class="GridviewScrollItem"><td colspan="5" style="text-align: right"><strong>Total</strong></td><td><strong><%=dc.format(totalResult)%></strong></td></tr>
           </table></div>
  <% }
   else{
  %>
   
     <p>No Results Available For Your Selection.</p>
   <%}
   session.setAttribute("currentasclvalues", setasres);
   }
    }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    %>
  </body>
</html>