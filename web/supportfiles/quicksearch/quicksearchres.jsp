<%@page import="rva.userlogin.LogBean"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="rva.userlogin.UserInfo"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" media="all" href="cssfiles/tablesorting.css">  
  <script type="text/javascript" src="jsfiles/jquery.tablesorter.min.js"></script>
  <script type="text/javascript">
$(function(){
  $('#keywords').tablesorter(); 
});
</script>
<%
    String auditorName;
    String clientName;
    String apstDate;
    String apenDate;
    Date date;
    Date edate;
    String dbsdate;
    String dbedate;
    
    int audprofid;
    int retcnt;
    float asqaaudres;
    float asaudres;
    float asoraudres;
    float dttres;
    float envyres;
    float totalasorhours=0.00f;
    float totalasnonorhours=0.00f;
    float totalasqahours=0.00f;
    float totalashours=0.00f;
    float totaldtthours=0.00f;
    float totalenvyhours=0.00f;
    int totalretelcount=0;
    String empcategory;
    int profid=0;
    ArrayList<String> lempcategory=new ArrayList<String>();
    ArrayList<String> laudName=new ArrayList<String>();
    ArrayList<String> lcName=new ArrayList<String>();
    ArrayList<String> lsdate=new ArrayList<String>();
    ArrayList<String> ledate=new ArrayList<String>();
    ArrayList<Float> lasoraudres=new ArrayList<Float>();
    ArrayList<Float> lastotaudres=new ArrayList<Float>();
    ArrayList<Float> lenvyres=new ArrayList<Float>();
    ArrayList<Float> ldttres=new ArrayList<Float>();
    ArrayList<String> lauditorName=new ArrayList<String>();
    ArrayList<Integer> lprofid=new ArrayList<Integer>();
    ArrayList<Float> lasaudres =new ArrayList<Float>();
    ArrayList<String> lshift=new ArrayList<String>();
    ArrayList<Float> lasqaaudres =new ArrayList<Float>();
    //ArrayList<Float> ldttres =new ArrayList<Float>();
    //ArrayList<Float> lenvyres =new ArrayList<Float>();
    ArrayList<Integer> lretres =new ArrayList<Integer>();
    //ArrayList<Integer> lretcount=new ArrayList<Integer>();
    DecimalFormat dc=new DecimalFormat("0.00");
    auditorName=(String) request.getParameter("aname");
    clientName=(String) request.getParameter("clname");
    apstDate=(String) request.getParameter("sdate");
    apenDate=(String) request.getParameter("edate");
    SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
    date=sdf.parse(apstDate);
    dbsdate=sdf1.format(date);
    edate=sdf.parse(apenDate);
    dbedate=sdf1.format(edate);
    UserInfo uinfo=new UserInfo();
    LogBean lb1=new LogBean();
    Connection con=DBConnect.startConnection();
    try
    {
     Statement st=con.createStatement();   
    if(auditorName.equalsIgnoreCase("-selectall-")&&clientName.equalsIgnoreCase("-selectall-"))
    {
//    lb1=uinfo.getrvaauditors(dbsdate, dbedate);
//      laudName=lb1.getlAuditorname();
//      lempcategory=lb1.getldesignation();
      ResultSet res=st.executeQuery("select * from auditors where auditorsname not like 'Nill' ");
        while(res.next())
        {
          lprofid.add(res.getInt("auditorsid"));
          laudName.add(res.getString("auditorsname"));
          lempcategory.add(res.getString("empcategory"));
        }
        lauditorName=laudName;
        laudName.remove("Nill");
    for(int i=0;i<laudName.size();i++)
    {
//     profid=uinfo.getauditorid(laudName.get(i));
      /*
ResultSet rs=st.executeQuery("SELECT `todayshift` FROM `rvaattandance` WHERE `logindate` between '"+dbsdate+"%' and '"+dbedate+"%' and `profid` ="" group by `todayshift` order by count(todayshift) desc limit 1 ");      
if(rs.next()){
  lshift.add(res.getString("todayshift"));
}
else{
  lshift.add("General");
} */
    ResultSet res1=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where performdate between '"+dbsdate+"' and '"+dbedate+"' and`locationsid` NOT IN("+3+","+4+") and clientsid NOT in("+12+") and auditorsid LIKE "+lprofid.get(i)+" ");
    if(res1.next())
    {
    asaudres=res1.getFloat("sum(timetoperform)")/3600;
    lasaudres.add(asaudres);
    }
    ResultSet res4=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where auditorsid LIKE "+lprofid.get(i)+" and  performdate between '"+dbsdate+"' and '"+dbedate+"' and `locationsid` IN("+3+","+4+","+69+") and clientsid in("+3+","+12+")  ");
    if(res4.next())
    {
    asoraudres=res4.getFloat("sum(timetoperform)")/3600;
    lasoraudres.add(asoraudres);
    }
    ResultSet res2=st.executeQuery("select sum(qaperformancetime) from asqafinal where qaperformeddate between '"+dbsdate+"' and '"+dbedate+"' and qaauditorname LIKE '"+laudName.get(i)+"' ");
    if(res2.next())
    {
    asqaaudres=res2.getFloat("sum(qaperformancetime)")/3600;
    lasqaaudres.add(asqaaudres);
    }
    ResultSet res3=st.executeQuery("SELECT COUNT(`auditorname`) FROM  `retellog` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+laudName.get(i)+"' ");
    if(res3.next())
    {
    retcnt=res3.getInt("COUNT(`auditorname`)");
    lretres.add(retcnt);
    }
    ResultSet res5=st.executeQuery("SELECT sum(`performancetime`) FROM  `dttfinal` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+laudName.get(i)+"' ");
    if(res5.next())
    {
    dttres=res5.getFloat("sum(`performancetime`)")/60;
    ldttres.add(dttres);
    }
    ResultSet res6=st.executeQuery("SELECT sum(`timetoperform`) FROM  `envysionperformancefinal` WHERE performeddate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+laudName.get(i)+"' ");
    if(res6.next())
    {
    envyres=res6.getFloat("sum(`timetoperform`)")/60;
    lenvyres.add(envyres);
    }
    }
    }
    else if(!auditorName.equalsIgnoreCase("-selectall-")&&clientName.equalsIgnoreCase("-selectall-"))
    {
        lauditorName.add(auditorName);
        ResultSet res4=st.executeQuery("select * from auditors where auditorsname LIKE '"+auditorName+"' ");
        while(res4.next())
        {
            empcategory=res4.getString("empcategory");
            profid=res4.getInt("auditorsid");
            lempcategory.add(empcategory);
        }
        
    
    ResultSet res1=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where performdate between '"+dbsdate+"' and '"+dbedate+"' and `locationsid` NOT IN("+3+","+4+") and clientsid not in("+12+") and auditorsid LIKE "+profid+" ");
    if(res1.next())
    {
    asaudres=res1.getFloat("sum(timetoperform)")/3600;
    lasaudres.add(asaudres);
    }
    ResultSet res5=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where performdate between '"+dbsdate+"' and '"+dbedate+"' and `locationsid` IN("+3+","+4+","+69+") and clientsid in("+3+","+12+") and auditorsid LIKE "+profid+" ");
    if(res5.next())
    {
    asoraudres=res5.getFloat("sum(timetoperform)")/3600;
    lasoraudres.add(asoraudres);
    }
    ResultSet res2=st.executeQuery("select sum(qaperformancetime) from asqafinal where qaperformeddate between '"+dbsdate+"' and '"+dbedate+"' and qaauditorname LIKE '"+auditorName+"' ");
    if(res2.next())
    {
    asqaaudres=res2.getFloat("sum(qaperformancetime)")/3600;
    lasqaaudres.add(asqaaudres);
    }
    ResultSet res3=st.executeQuery("SELECT COUNT(`auditorname`) FROM  `retellog` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+auditorName+"' ");
    if(res3.next())
    {
    retcnt=res3.getInt("COUNT(`auditorname`)");
    lretres.add(retcnt);
    }
    ResultSet res7=st.executeQuery("SELECT sum(`performancetime`) FROM  `dttfinal` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+auditorName+"' ");
    if(res7.next())
    {
    dttres=res7.getFloat("sum(`performancetime`)")/60;
    ldttres.add(dttres);
    }
    ResultSet res6=st.executeQuery("SELECT sum(`timetoperform`) FROM  `envysionperformancefinal` WHERE performeddate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+auditorName+"' ");
    if(res6.next())
    {
    envyres=res6.getFloat("sum(`timetoperform`)")/60;
    lenvyres.add(envyres);
    }
    }
    else if(auditorName.equalsIgnoreCase("-selectall-")&&!clientName.equalsIgnoreCase("-selectall-"))
    {
      /*
      lb1=uinfo.getrvaauditors(dbsdate, dbedate);
      laudName=lb1.getlAuditorname();
      lempcategory=lb1.getldesignation();*/
        ResultSet res=st.executeQuery("select * from auditors where auditorsname not like 'Nill' ");
        while(res.next())
        {
          lprofid.add(res.getInt("auditorsid"));
          laudName.add(res.getString("auditorsname"));
          lempcategory.add(res.getString("empcategory"));
        }
        lauditorName=laudName;
        laudName.remove("Nill");
    for(int i=0;i<laudName.size();i++)
    {
      //profid=uinfo.getauditorid(laudName.get(i));
   /* 
      ResultSet rs=st.executeQuery("SELECT `todayshift` FROM `rvaattandance` WHERE `logindate` between '"+dbsdate+"%' and '"+dbedate+"%' and `profid` =1 group by `todayshift` order by count(todayshift) desc limit 1 ");      
if(rs.next()){
  lshift.add(res.getString("todayshift"));
}
else{
  lshift.add("General");
}
      */
        if(clientName.equalsIgnoreCase("Arrowsight"))
        {
    ResultSet res1=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where performdate between '"+dbsdate+"' and '"+dbedate+"' and `locationsid` NOT IN("+3+","+4+") and clientsid  not in("+12+") and auditorsid LIKE "+lprofid.get(i)+" ");
    if(res1.next())
    {
    asaudres=res1.getFloat("sum(timetoperform)")/3600;
    lasaudres.add(asaudres);
    }
    ResultSet res4=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where performdate between '"+dbsdate+"' and '"+dbedate+"' and `locationsid` IN("+3+","+4+","+69+") and clientsid in("+3+","+12+") and auditorsid LIKE "+lprofid.get(i)+" ");
    if(res4.next())
    {
    asoraudres=res4.getFloat("sum(timetoperform)")/3600;
    lasoraudres.add(asoraudres);
    }
    ResultSet res2=st.executeQuery("select sum(qaperformancetime) from asqafinal where qaperformeddate between '"+dbsdate+"' and '"+dbedate+"' and qaauditorname LIKE '"+laudName.get(i)+"' ");
    if(res2.next())
    {
    asqaaudres=res2.getFloat("sum(qaperformancetime)")/3600;
    lasqaaudres.add(asqaaudres);
    }   
    }
    else if(clientName.equalsIgnoreCase("Retel"))
    {
    ResultSet res3=st.executeQuery("SELECT COUNT(`auditorname`) FROM  `retellog` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+laudName.get(i)+"' ");
    if(res3.next())
    {
    retcnt=res3.getInt("COUNT(`auditorname`)");
    lretres.add(retcnt);
    }
    }
    else if(clientName.equalsIgnoreCase("Envysion"))
    {
      ResultSet res4=st.executeQuery("SELECT sum(`timetoperform`) FROM  `envysionperformancefinal` WHERE performeddate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+laudName.get(i)+"' ");
    if(res4.next()){
      envyres=res4.getFloat("sum(`timetoperform`)")/60;
      lenvyres.add(envyres);
    }
    }
     else if(clientName.equalsIgnoreCase("DTT"))
    {
      ResultSet res5=st.executeQuery("SELECT sum(`performancetime`) FROM  `dttfinal` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+laudName.get(i)+"' ");
    if(res5.next()){
      dttres=res5.getFloat("sum(`performancetime`)")/60;
      ldttres.add(dttres);
    }
    }   
    }
    }
    else if(!auditorName.equalsIgnoreCase("-selectall-")&&!clientName.equalsIgnoreCase("-selectall-"))
    {
        lauditorName.add(auditorName);
        ResultSet res4=st.executeQuery("select * from auditors where auditorsname LIKE '"+auditorName+"' ");
        while(res4.next())
        {
            empcategory=res4.getString("empcategory");
            profid=res4.getInt("auditorsid");
            lempcategory.add(empcategory);
        }    
        if(clientName.equalsIgnoreCase("Arrowsight"))
        {
    ResultSet res1=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where performdate between '"+dbsdate+"' and '"+dbedate+"' and `locationsid` NOT IN("+3+","+4+") and clientsid not in("+12+") and auditorsid LIKE "+profid+" ");
    if(res1.next())
    {
    asaudres=res1.getFloat("sum(timetoperform)")/3600;
    lasaudres.add(asaudres);
    }
    ResultSet res5=st.executeQuery("select sum(timetoperform) from asauditsreportfinal where performdate between '"+dbsdate+"' and '"+dbedate+"' and `locationsid` IN("+3+","+4+","+69+") and clientsid in("+3+","+12+") and auditorsid LIKE "+profid+" ");
    if(res5.next())
    {
    asoraudres=res5.getFloat("sum(timetoperform)")/3600;
    lasoraudres.add(asoraudres);
    }
    ResultSet res2=st.executeQuery("select sum(qaperformancetime) from asqafinal where qaperformeddate between '"+dbsdate+"' and '"+dbedate+"' and qaauditorname LIKE '"+auditorName+"' ");
    if(res2.next())
    {
    asqaaudres=res2.getFloat("sum(qaperformancetime)")/3600;
    lasqaaudres.add(asqaaudres);
    }   
    }
    else if(clientName.equalsIgnoreCase("Retel"))
    {
    ResultSet res3=st.executeQuery("SELECT COUNT(`auditorname`) FROM  `retellog` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+auditorName+"' ");
    if(res3.next())
    {
    retcnt=res3.getInt("COUNT(`auditorname`)");
    lretres.add(retcnt);
    }
    }
    else if(clientName.equalsIgnoreCase("DTT"))
    {
    ResultSet res3=st.executeQuery("SELECT sum(`performancetime`) FROM  `dttfinal` WHERE performdate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+auditorName+"'");
    if(res3.next())
    {
    dttres=res3.getFloat("sum(`performancetime`)")/60;
    ldttres.add(dttres);
    }
    }
    else if(clientName.equalsIgnoreCase("Envysion"))
    {
    ResultSet res3=st.executeQuery("SELECT sum(`timetoperform`) FROM  `envysionperformancefinal` WHERE performeddate BETWEEN  '"+dbsdate+"' AND  '"+dbedate+"' AND  `auditorname` LIKE '"+auditorName+"' ");
    if(res3.next())
    {
    envyres=res3.getFloat("sum(`timetoperform`)")/60;
    lenvyres.add(envyres);
    }
    }
    }
    if(lauditorName.size()>0)
    {
       %><div id="wrapper">
       <table class="quickres" id="keywords" name="quickrestable">
         <thead><tr><th><span>S.No</span></th><th><span>Name</span></th><!--<th><span>Shift</span></th>--><%if(lasaudres.size()>0){%><th><span>AS Non OR Hours</span></th><th><span>AS OR Hours</span></th><th><span>AS QA Hours</span></th><th><span>AS Total Hours</span></th><%}%><%if(ldttres.size()>0){%><th><span>DTT Hours</span></th><%}%><%if(lenvyres.size()>0){%><th><span>Envysion Hours</span></th><%}%><%if(lretres.size()>0){%><th><span>Retel Counts</span></th><%}%></tr></thead>
           <tbody><%for(int i=0;i<lauditorName.size();i++)
           {%>
           <tr>
               <td><%=i+1%></td>
               <td><%=lauditorName.get(i)%></td>
               <!--<td>
               **/
               </td>-->
               
               <%if(lasaudres.size()>0){%><td><%=dc.format(lasaudres.get(i))%></td>
               <td><%=dc.format(lasoraudres.get(i))%></td>
               <td><%=dc.format(lasqaaudres.get(i))%></td>
               <td><%=dc.format(lasaudres.get(i)+(lasoraudres.get(i)*2)+lasqaaudres.get(i))%></td>
               <%
               totalasnonorhours=totalasnonorhours+lasaudres.get(i);
               totalasorhours=totalasorhours+lasoraudres.get(i);
               totalasqahours=totalasqahours+lasqaaudres.get(i);
               }%>
               <%if(ldttres.size()>0){%><td><%=dc.format(ldttres.get(i))%></td><%
                totaldtthours=totaldtthours+ldttres.get(i);               
}%>
               <%if(lenvyres.size()>0){%><td><%=dc.format(lenvyres.get(i))%></td><%
                totalenvyhours=totalenvyhours+lenvyres.get(i);               
}%>
               <%if(lretres.size()>0){%><td><%=lretres.get(i)%></td><%
                totalretelcount=totalretelcount+lretres.get(i);               
}%></tr>    
           <%}
           %></tbody>
           <tr><td colspan='2' id='last' style="text-align: center"><strong>Total</strong></td><%if(lasaudres.size()>0){%><td><strong><%=dc.format(totalasnonorhours)%></strong></td><td><strong><%=dc.format(totalasorhours)%></strong></td>
       <td><strong><%=dc.format(totalasqahours)%></strong></td><td><strong><%=dc.format(totalasnonorhours+(totalasorhours*2)+totalasqahours)%></strong></td><%}%>
       <%if(ldttres.size()>0){%><td><strong><%=dc.format(totaldtthours)%></strong></td><%}%>
       <%if(lenvyres.size()>0){%><td><strong><%=dc.format(totalenvyhours)%></strong></td><%}%>
       <%if(lretres.size()>0){%><td><strong><%=totalretelcount%></strong></td><%}%></tr>
       </table></div>
       <%
    }
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
%>