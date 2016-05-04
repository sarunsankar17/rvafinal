<%@page import="rva.showperformance.ASInfo"%>
<%@page import="rva.administrator.ChangeDateFormat"%>
<%@page import="rva.showperformance.EnvyInfo"%>
<%@page import="rva.userlogin.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="rva.taskinsert.RetelTasks"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.taskinsert.EnvysionBean"%>
<%@page import="rva.showperformance.EnvyptProcessing"%>
<%@page import="rva.showperformance.EnvyInfo"%>
<%@page import="rva.administrator.ChangeDateFormat"%>
<%
  ChangeDateFormat cdf=new ChangeDateFormat();
  String process=request.getParameter("process");
String rowno=(String) session.getAttribute("envyrn");
String cafename=request.getParameter("cname");
String taskname=request.getParameter("tname");
String auditorname=request.getParameter("audname");
String startdate=cdf.toDbDate(request.getParameter("performdate"));
String datadate=cdf.toDbDate(request.getParameter("datadate"));
String taskcount=request.getParameter("taskcount");
int cafeid=0;
int taskid=0;
String performancetime=request.getParameter("pt");
Connection con=DBConnect.startConnection();
ResultSet res=null;
try{
  Statement st=con.createStatement();
  res=st.executeQuery("SELECT * FROM `envysioncafes` where envysioncafesname like '"+cafename+"' ");
  while(res.next()){
    cafeid=res.getInt("envysioncafesid");
  }
  res=st.executeQuery("SELECT * FROM `envysiontasks` where envysiontaskname like '"+taskname+"' ");
  while(res.next()){
    taskid=res.getInt("envysiontasksid");
  }
  if(process.equalsIgnoreCase("update")){
    st.executeUpdate("UPDATE `envysionperformancefinal` SET envysioncafesid='"+cafeid+"',envysiontaskid= '"+taskid+"',auditorname= '"+auditorname+"',performeddate='"+startdate+"',datadate='"+datadate+"',takscount='"+taskcount+"',timetoperform='"+performancetime+"' where envysionperformancefinalid like '"+rowno+"' ");
}
  else{
    PreparedStatement pstm=con.prepareStatement("INSERT INTO envysionperformancefinal(envysioncafesid,envysiontaskid,auditorname,performeddate,datadate,takscount,timetoperform) values(?,?,?,?,?,?,?)");
    pstm.setInt(1, cafeid);
    pstm.setInt(2, taskid);
    pstm.setString(3, auditorname);
    pstm.setString(4, startdate);
    pstm.setString(5, datadate);
    pstm.setString(6, taskcount);
    pstm.setString(7, performancetime);
    pstm.executeUpdate();
  }}
catch(Exception e){
  e.printStackTrace();
}
response.sendRedirect("envyperformanceupdate.jsp");
%>
