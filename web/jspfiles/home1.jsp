<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head>
	<title>RVA Home</title>
       
        <link href="cssfiles/jqueryuidtp.css" rel="stylesheet" type="text/css">
             <script src="jsfiles/jquedp.js"></script>
             <script src="jsfiles/jquedpui.js"></script>
              <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
            <style>
              #quires{
           text-decoration:underline;
         }
    .quicksearch
    {
        margin-bottom: 10px;
    }
    .image-slider ul{
			overflow: hidden;
		}
		.image-slider ul li{
			float: left;
			list-style: none;
                        height:500px;
		}
		.right-container-content{
			float: left;
			width: 100%;
			overflow: hidden;
			//border: 1px solid #000;
		}
   .image-slider img {
      
width: 960px;
height: 500px;
}
                
table{
    margin-bottom:15px; 
}
.topperformers{
  width:100%;
}
.topperformers td{
  width:25%;
}
.innertable {
  margin:0px;
 padding:0px;
 width:100%;
}
.innertable tr:nth-child(odd){
   background-color: aliceblue;
}

                th{
                    background-color: lightblue;
                    text-align: left;
                }  
                .ttables{
                  vertical-align: top;
                }
                #ttables1{
                  width:19%;
                }
                #ttables2{
                  width:20%;
                }
                 #ttables3{
                  width:22%;
                }
                 #ttables4{
                  width:24%;
                }
                
                
</style>
        <script type="text/javascript">
$(function(){
  $('#keywords4').tablesorter(); 
});
</script>
<script type="text/javascript">
$(function(){
  $('#keywords1').tablesorter(); 
});
</script>
<script type="text/javascript">
$(function(){
  $('#keywords2').tablesorter(); 
});
</script>
<script type="text/javascript">
$(function(){
  $('#keywords3').tablesorter(); 
});
</script>
        </head>
<body>
  <%
             SimpleDateFormat stf=new SimpleDateFormat("HH:mm:ss");
             //String startdate="2014-01-01 00:00:00";
             SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
             DecimalFormat dc=new DecimalFormat("0.00");
             Calendar cal=Calendar.getInstance();
  SimpleDateFormat newsdf=new SimpleDateFormat("MM/dd/yyyy");
  //Date date=new Date();
  int taskcnt=0;
  //System.out.println(cal.getTime());
  int year=cal.get(Calendar.YEAR);
  int month=cal.get(Calendar.MONTH);
  int day=cal.get(Calendar.DATE)-2;
  cal.set(year,month,day);
  
  int syear=cal.get(Calendar.YEAR);
  int smonth=cal.get(Calendar.MONTH);
  //int sday=01;
  cal.set(syear,smonth,01);
  String sperformeddate=newsdf.format(cal.getTime());
  cal.set(year,month,day);
  String eperformeddate=newsdf.format(cal.getTime());
             String spertime="00:00:00";
             String epertime="23:59:59";
Connection con=DBConnect.startConnection();
ArrayList<String> lastopthree=new ArrayList<String>();
ArrayList<String> lasqatopthree=new ArrayList<String>();
ArrayList<String> lreteltopthree=new ArrayList<String>();
ArrayList<String> lenvytopthree=new ArrayList<String>();
ArrayList<String> ldtttopthree=new ArrayList<String>();
ArrayList<Float> lasthree=new ArrayList<Float>();
ArrayList<Float> lasqathree=new ArrayList<Float>();
ArrayList<Float> ldttthree=new ArrayList<Float>();
ArrayList<Float> lenvythree=new ArrayList<Float>();
ArrayList<Integer> lretelthree=new ArrayList<Integer>();
 try
           {
             Date date=null;
             date=newsdf.parse(sperformeddate);
             String sdbformat=sdf2.format(date);
             date=newsdf.parse(eperformeddate);
             String edbformat=sdf2.format(date);
             
Statement st=con.createStatement();
 ResultSet res6=null;
ResultSet res=st.executeQuery("SELECT SUM(timetoperform) FROM `asauditsreportfinal` WHERE performdate between '"+sdbformat+"' and '"+edbformat+"' and performtime between '"+spertime+"' and '"+epertime+"'  ");
if(res.next())
{
   float asperformanceres=res.getFloat("sum(timetoperform)")/3600; %>
    <strong>Home</strong>
		<%LogBean lb=(LogBean) session.getAttribute("currloginsession");%>
      <div class="rbodytitle"><h3>Total Performance:-(<%=sperformeddate%>-<%=eperformeddate%>)</h3></div>
					<div class="right-container-content">
						<table width="100%">
							<tr>
								<th>ArrowSight</th>
                                                        <th>ArrowSight QA</th>
                                                        <th>DTT</th>
                                                        <th>Envysion</th>
                                                        <th>ReTel</th>
							</tr>
							<tr>
<td>
   <%=dc.format(asperformanceres)%>    &nbsp;Hours
<%}
else
{
out.println("No Task Available");
}%></td><td><%
  ResultSet res4=st.executeQuery("SELECT sum(qaperformancetime) from asqafinal where qaperformeddate between '"+sdbformat+"' and '"+edbformat+"' ");
if(res4.next()){
  float asqafinal=res4.getFloat("sum(qaperformancetime)")/3600;%>
  <%=dc.format(asqafinal)%>&nbsp; Hours
<%}else{
out.println("No Tasks available");}%>
</td>

<td><%
ResultSet res2=st.executeQuery("SELECT sum(performancetime) from dttfinal where performdate between '"+sdbformat+"' and '"+edbformat+"' ");
if(res2.next()){
  float dttres=res2.getFloat("sum(performancetime)")/60;%>
  <%=dc.format(dttres)%> &nbsp;Hours </td>
<%}
else
{
out.println("No Task Available");
}
%>
<td><%
ResultSet res3=st.executeQuery("SELECT sum(timetoperform) from envysionperformancefinal where performeddate between '"+sdbformat+"' and '"+edbformat+"' ");
if(res3.next()){
  float envyres=res3.getFloat("sum(timetoperform)")/60;%>
  <%=dc.format(envyres)%> &nbsp;Hours </td>
<%}
else
{
out.println("No Task Available");
}
           %>
<td><%  


       ResultSet res1=st.executeQuery("SELECT COUNT(taskno) from retellog where performdate between '"+sdbformat+"' and '"+edbformat+"' ");
       if(res1.next())
       {      
  taskcnt=res1.getInt("COUNT(taskno)");
%>
         <%=taskcnt%> &nbsp; #
      <% }
       else
       {
         out.println("No Tasks available");
       }
       %></td>
	</tr>
       </table>
       <div class="topthree">
         <div class="rbodytitle"><h3>Top Performers In Each Project:-(<%=sperformeddate%>-<%=eperformeddate%>)</h3></div>
         <%
         res6=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform) from auditors as a join asauditsreportfinal as b on a.auditorsid=b.auditorsid where b.performdate between '"+sdbformat+"' and '"+edbformat+"' group by a.auditorsname order by sum(b.timetoperform) desc ");
         while(res6.next()){
           lastopthree.add(res6.getString("a.auditorsname"));
           lasthree.add(res6.getFloat("sum(b.timetoperform)")/3600);
         }
         res6=st.executeQuery("SELECT auditorname, sum(performancetime) from dttfinal where performdate between '"+sdbformat+"' and '"+edbformat+"' group by auditorname order by sum(performancetime) desc ");
         while(res6.next()){
           ldtttopthree.add(res6.getString("auditorname"));
           ldttthree.add(res6.getFloat("sum(performancetime)")/60);
         }
         res6=st.executeQuery("SELECT auditorname, count(auditorname) from retellog where performdate between '"+sdbformat+"' and '"+edbformat+"' group by auditorname order by count(auditorname) desc ");
         while(res6.next()){
           lreteltopthree.add(res6.getString("auditorname"));
           lretelthree.add(res6.getInt("count(auditorname)"));
         }
         res6=st.executeQuery("SELECT auditorname, sum(timetoperform) from envysionperformancefinal where performeddate between '"+sdbformat+"' and '"+edbformat+"' group by auditorname order by sum(timetoperform) desc ");
         while(res6.next()){
           lenvytopthree.add(res6.getString("auditorname"));
           lenvythree.add(res6.getFloat("sum(timetoperform)")/60);
         }%>
         <table class="topperformers">
        <tr><td class="ttables" id="ttables1">
               <div id="wrapper">
               <table class="innertable" id="keywords4" style="float:left;margin-top:0px;">
              <thead>
              <th>Name<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th><th>AS PT<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th>
                 </thead><tbody>
               <%
         for(int i=0;i<lastopthree.size();i++){%><tr>
         <td><%=lastopthree.get(i)%></td>
         <td><%=dc.format(lasthree.get(i))%></td></tr><%}%></tbody></table></div></td>
         <td class="ttables" id="ttables2"><div id="wrapper1">
           <table class="innertable" id="keywords1" style="float:left;margin-top:0px;">
             <thead> <th>Name<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th><th>DTT PT<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th>
             </thead><tbody>
               <%
         for(int i=0;i<ldtttopthree.size();i++){%><tr>
               <td><%=ldtttopthree.get(i)%></td>
               <td><%=dc.format(ldttthree.get(i))%></td></tr><%}%></tbody></table></div></td>
                <td class="ttables" id="ttables3"><div id="wrapper2">
                  <table class="innertable" id="keywords2" style="float:left;margin-top:0px;">
                    <thead>
                    <th>Name<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th><th>Envyion PT<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th></thead><tbody>
               <%
         for(int i=0;i<lenvytopthree.size();i++){%><tr>
               <td><%=lenvytopthree.get(i)%></td>
               <td><%=dc.format(lenvythree.get(i))%></td></tr><%}%></tbody></table></div></td>
                <td class="ttables" id="ttables4"><div id="wrapper3"><table class="innertable" id="keywords3" style="float:left;margin-top:0px;">    
                      <thead>  
                      <th>Name<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th><th>ReTel Count<img src="images/icons/tabsorter.png" alt="ts" width="10px" height="20px"></th></thead><tbody>
                     <%
         for(int i=0;i<lreteltopthree.size();i++){%><tr>
               <td><%=lreteltopthree.get(i)%></td>
               <td><%=lretelthree.get(i)%></td></tr><%}%>
                      </tbody>
                    </table></div></td>
             </tr>
         </table>
       </div></div>
       <%}
       catch(Exception e)
       {
       e.printStackTrace();
       }%>
</body>
</html>
