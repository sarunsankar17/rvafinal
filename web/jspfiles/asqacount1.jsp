<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head>
	<title>QA Count Sheet</title>
       <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
       <style>
         table,tr,td,th{
           border:2px solid #fff;
           border-collapse: collapse;
         }
         .datepicker{
           width:100px;
         }
         th{
           background-color: lightblue;
         }
         tr:nth-child(odd){
           background-color: aliceblue;
         }
         tr:last-child{
           background-color: #FFFFFF;
         }
       </style>
       <script>
         function checkvalue(id)
         {
           var x=document.getElementById(id).value;
           var nan=isNaN(x);
           //var empval="";
           if(nan||x<0)
           {
             alert("You have entered wrong value! Please enter correct number");
             document.getElementById(id).value="";
           }
         }
         </script>
         <script>
          $(document).ready(function(){
             var date=new Date();
             var minDate=new Date(date.getFullYear(),date.getMonth(),date.getDate()-1);
            $("#stdate").datepicker({
              
          dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),defaultDate:new Date(),minDate:minDate
            });
          });
            </script>
        </head>
<body>
  <strong>AS QA Count Sheet</strong><br><br>
       <form class="asqacountsheet"method="POST" action="AsQaCountProcess">
            <%LogBean logbean1=(LogBean) session.getAttribute("currloginsession");
            String auditorname=(String) logbean1.getAuditorname();
            session.setAttribute("auditorname",auditorname);
            
            Connection con=DBConnect.startConnection();
            
            ArrayList<String> clientsname=new ArrayList<String>();
            ArrayList<String> auditsname=new ArrayList<String>();
            ResultSet res=null;
            try
            {
              Statement st=con.createStatement();
              res=st.executeQuery("Select a.asqaclientsname, b.qaauditsname from asqaclients as a join asqaauditspt as b on a.asqaclientsid=b.clientsid");
            while(res.next())
            {
              clientsname.add(res.getString("asqaclientsname"));
              auditsname.add(res.getString("qaauditsname"));
            }
            }
            catch(Exception e)
            {
              e.printStackTrace();
            }
            %>
            <strong>Auditor Name:</strong>&nbsp;&nbsp;&nbsp;<%=auditorname%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                      
            <strong>Performed Date:</strong>&nbsp;&nbsp;&nbsp;<input type="text" class="datepicker"id="stdate" autocomplete="off" name="performdate" required/>
          <br><br><table class="asqacount">
            <tr><th>S.No</th><th>Client Name</th><th>Audit Name</th><th># of Audits</th></tr>
           <% for(int i=0;i<clientsname.size();i++)
              {%>
              <tr><td><%=i+1%></td>
                <td width="140px"><%=clientsname.get(i)%></td>
                <td><%=auditsname.get(i)%></td>
                  <td><input type="text" name="auditcount" size="3" placeholder="0" id="<%=i%>" onchange="checkvalue(id)" required autocomplete="off"></td></tr>
                <%}
           session.setAttribute("audname",auditsname);
           %>
        
              <tr><td colspan="4"align="center"><button type="submit" value="submit"/>SAVE</button></td></tr> </table>
       </form>
</body>	
</html>