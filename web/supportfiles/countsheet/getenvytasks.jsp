<%-- 
    Document   : getenvytasks
    Created on : Feb 24, 2015, 4:25:55 PM
    Author     : RCT-456
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.administrator.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 
Connection con=DBConnect.startConnection();
            ArrayList<String> taskname=new ArrayList<String>();
            String rowcount=request.getParameter("rowcount");
            String cafename=request.getParameter("cname");
            String dtdate=request.getParameter("dtdate");
            String dbdtdate=null;
            ChangeDateFormat cdf=new ChangeDateFormat();
            ResultSet res=null;
            try
            {
              dbdtdate=cdf.toDbDate(dtdate);
              Statement st=con.createStatement();
             // out.println(dbdtdate+cafename);
              res=st.executeQuery("SELECT envysiontaskname FROM `envysiontasks` WHERE envysiontasksid not in(select envysiontaskid from envysionperformancefinal as a join envysioncafes as b on a.`envysioncafesid`=b.`envysioncafesid` where datadate like '"+dbdtdate+"' and b.`envysioncafesname` like '"+cafename+"')");
              while(res.next())
            {
              taskname.add(res.getString("envysiontaskname"));
            }%>
            <select name="taskname" id="taskname" required>
                     <option name="null" value="">-select-</option>
                <%
            for(int i=0;i<taskname.size();i++){%>
            <option name="task" value="<%=taskname.get(i)%>"><%=taskname.get(i)%></option>
          <%}
            %>
                </select><br><input type="number" placeholder="# Tasks" name="nooftasks" required autocomplete="off"><br>
            <%
            }
            catch(Exception e)
            {
              e.printStackTrace();
            }
            %>



