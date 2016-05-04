<%-- 
    Document   : envysioninsertnewrow
    Created on : Jan 5, 2015, 4:58:04 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<!DOCTYPE html>
<%
Connection con=DBConnect.startConnection();
            
            ArrayList<String> cafename=new ArrayList<String>();
            ArrayList<String> taskname=new ArrayList<String>();
            String rowcount=request.getParameter("rowcnt");
            ResultSet res=null;
            try
            {
              Statement st=con.createStatement();
              res=st.executeQuery("SELECT * FROM envysioncafes");
              while(res.next())
            {
              cafename.add(res.getString("envysioncafesname"));
            }
              res=st.executeQuery("SELECT * FROM envysiontasks");
              while(res.next())
            {
              taskname.add(res.getString("envysiontaskname"));
            }%>
             <script>
          $(document).ready(function(){
            var date=new Date();
             var minDate=new Date(2015,00,01);
            $('#dtdate<%=rowcount%>').datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),minDate:minDate,defaultDate:new Date()
            });
      });
    </script>
            <td><input type="text" id="dtdate<%=rowcount%>" autocomplete="off" name="datadate" required/></td>
<td>
                <select name="cafename" id="cname<%=rowcount%>" onchange="myfunction(this.id)" required>
                  <option name="null" value="">-select-</option>
                <%
            for(int i=0;i<cafename.size();i++){%>
            <option name="cafe" value="<%=cafename.get(i)%>"><%=cafename.get(i)%></option>
          <%  }
            %>
                </select></td><td id="tn<%=rowcount%>"></td><td id="tc<%=rowcount%>"></td>
                  
            <%
            }
            catch(Exception e)
            {
              e.printStackTrace();
            }
            %>
            
            