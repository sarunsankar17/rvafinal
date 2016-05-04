<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="rva.administrator.*"%>
<html>
  <head>
  <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
         <script>
          $(document).ready(function(){
            var date=new Date();
             var minDate=new Date(2015,00,01);
            $("#perdate").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:minDate,defaultDate:new Date()  
            });
          });
            </script>
  </head>
<body>
  <%
    Connection con=DBConnect.startConnection();
  int dttrowno=(Integer.parseInt(request.getParameter("rowno")));
  String logmeinname=null;
  String auditorname=null;
  String performdate=null;
  String taskname=null;
  String taskstage=null;
  ChangeDateFormat cdf=new ChangeDateFormat();
  try{
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("SELECT * from dttmissedvalues where dttmissedvaluesid = "+dttrowno+" ");
    while(res.next()){
      logmeinname=res.getString("logmeinname");
      auditorname=res.getString("auditorname");
      performdate=cdf.dbDatetoAppDate(res.getString("performeddate"));
      taskname=res.getString("taskname");
      taskstage=res.getString("processstage");
    }
  }
  catch(Exception e){
    e.printStackTrace();
  }
  %>
  <strong>DTT Missed Task Update</strong><br><br>
  <form action="savedttupdatedtask.jsp?rowno=<%=dttrowno%>" method="post">
    <table>
      <tr>
        <th>LogMeIn Name:</th>
        <td><input type="text" value="<%=logmeinname%>" required autocomplete="off" name="logmeinname"></td>
      </tr>
      <tr>
        <th>Task Name:</th>
        <td><input type="text" value="<%=taskname%>" required autocomplete="off" name="taskname"></td>
      </tr>
      <tr>
        <th>Auditor Name:</th>
        <td><input type="text"  value="<%=auditorname%>" required autocomplete="off" name="auditorname"></td>
      </tr>
      <tr>
        <th>Performed Date:</th>
        <td><input type="text" id="perdate" value="<%=performdate%>" required autocomplete="off" name="performdate"></td>
      </tr>
      <tr>
        <th>Process Stage:</th>
        <td><input type="text" value="<%=taskstage%>" required autocomplete="off" name="processstage"></td>
      </tr>
      <tr><td colspan="2"><input type="submit" value="SUBMIT"></td></tr>
    </table>  
  </form>
</body>
</html>