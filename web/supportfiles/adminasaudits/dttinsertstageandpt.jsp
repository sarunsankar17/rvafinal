<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="rva.dbaccess.DBConnect"%>

<%
 // int rcnt=Integer.parseInt(request.getParameter("rowcnt"));
  ArrayList<String> lprocessstage=new ArrayList<String>();
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=null;
    res=st.executeQuery("SELECT * FROM `dttprocessstage` ");
    while(res.next()){
      lprocessstage.add(res.getString("dttprocessstagename"));
    }
    %>
    <td> <select name="processstage" required>
      <option value="">-select-</option>
      <%for(int i=0;i<lprocessstage.size();i++){%>
       <option value="<%=lprocessstage.get(i)%>"><%=lprocessstage.get(i)%></option>
<%}%>
      </select></td><td><input type="text" name="processstagept" required autocomplete="off" placeholder="Performance Time"></td>
 <% }
  catch(Exception e)
  {
    e.printStackTrace();
  }
%>