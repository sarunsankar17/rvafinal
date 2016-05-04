<%-- 
    Document   : envynewcafeinsert
    Created on : Jan 20, 2015, 9:05:14 PM
    Author     : RCT-456
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.sql.*"%>
<%
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    PreparedStatement pstm=null;
    int taskrno=0;
    int pt=0;
    ResultSet res=null;
    String process=(String) session.getAttribute("changedetail");
    int stagerowno=0;
    ArrayList<String> lprocessstage=new ArrayList<String>();
      ArrayList<String> lperftime=new ArrayList<String>();
      String[] processstage=null;
       String[] perftime=null;
    if(process.equalsIgnoreCase("taskinsert")){
      String taskname=request.getParameter("taskname");
      processstage=request.getParameterValues("processstage");
      perftime=request.getParameterValues("processstagept");
      
      Collections.addAll(lprocessstage,processstage);
      Collections.addAll(lperftime,perftime);
      
      pstm=con.prepareStatement("INSERT INTO `dtttaskdetails`(`dtttaskname`,timetoperform) values(?,?) ");
      pstm.setString(1,taskname);
      pstm.setInt(2,pt);
      pstm.executeUpdate();
      res=st.executeQuery("SELECT * from dtttaskdetails where dtttaskname like '"+taskname+"' ");
      while(res.next()){
        taskrno=res.getInt("dtttasksid");
      }
      for(int i=0;i<lprocessstage.size();i++){
       res=st.executeQuery("SELECT `dttprocessstageid` FROM `dttprocessstage` WHERE dttprocessstagename like '"+lprocessstage.get(i)+"' ");
       while(res.next()){
         stagerowno=res.getInt("dttprocessstageid");
       }
       pstm=con.prepareStatement("INSERT INTO `dttprocessandpt`(`dtttaskid`, `dttprocessstageid`, `performancetime`) value (?,?,?) ");
       pstm.setInt(1, taskrno);
       pstm.setInt(2, stagerowno);
       pstm.setString(3, lperftime.get(i));
       pstm.executeUpdate();
      }
    }
    else if(process.equalsIgnoreCase("taskupdate")){
      String taskname=request.getParameter("taskname");
      processstage=request.getParameterValues("processstage");
      perftime=request.getParameterValues("processstagept");
      
      Collections.addAll(lprocessstage,processstage);
      Collections.addAll(lperftime,perftime);
      res=st.executeQuery("SELECT * from dtttaskdetails where dtttaskname like '"+taskname+"' ");
      while(res.next()){
        taskrno=res.getInt("dtttasksid");
      }
      st.executeUpdate("DELETE FROM `dttprocessandpt` WHERE dtttaskid like "+taskrno+" ");
      for(int i=0;i<lprocessstage.size();i++){
       res=st.executeQuery("SELECT `dttprocessstageid` FROM `dttprocessstage` WHERE dttprocessstagename like '"+lprocessstage.get(i)+"' ");
       while(res.next()){
         stagerowno=res.getInt("dttprocessstageid");
       }
       pstm=con.prepareStatement("INSERT INTO `dttprocessandpt`(`dtttaskid`, `dttprocessstageid`, `performancetime`) value (?,?,?) ");
       pstm.setInt(1, taskrno);
       pstm.setInt(2, stagerowno);
       pstm.setString(3, lperftime.get(i));
       pstm.executeUpdate();
      }
    }
    else if(process.equalsIgnoreCase("insertnewtaskstage")){
      String stagename=request.getParameter("taskstage");
      pstm=con.prepareStatement("INSERT INTO `dttprocessstage`(`dttprocessstagename`) VALUES (?) ");
      pstm.setString(1,stagename);
      pstm.executeUpdate();
    }
  }
  catch(Exception e){
    e.printStackTrace();
  }
 response.sendRedirect("dttnewtaskinsert.jsp");
%>
