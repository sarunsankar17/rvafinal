/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.scheduletasks;


import java.io.File;
import java.util.Calendar;
import java.util.Date;
import rva.administrator.*;
import rva.dbaccess.DBConnect;
import java.sql.*;
import java.util.ArrayList;
public class AutoReportGeneration {
  //private static String fileName="test.xls";
  //private static final String defName="RVA Daily Report - ";
private ArrayList<String> fullname=new ArrayList<String>();
private ArrayList<String> logindate=new ArrayList<String>();
private ArrayList<String> logoutdate=new ArrayList<String>();
private ArrayList<String> workingtime=new ArrayList<String>();
private ArrayList<String> shift=new ArrayList<String>();
private ArrayList<String> attendancestatus=new ArrayList<String>();
private ArrayList<Float> asnonorauditsperformancetime=new ArrayList<Float>();
private ArrayList<Float> asorauditsperformancetime=new ArrayList<Float>();
private ArrayList<Float> asqaaudithours=new ArrayList<Float>();
private ArrayList<Float> envysionperformanceresult=new ArrayList<Float>();
private ArrayList<Float> dttptresults=new ArrayList<Float>();
private ArrayList<Integer> retelcounts=new ArrayList<Integer>();
private String datecheck=null;
private float totaloraudithours=0.0f;
private float totalnonoraudithours=0.0f;
private float totalasqahours=0.0f;
private float totalenvyhours=0.0f;
private float totaldtthours=0.0f;
private int totalretelcount=0;
private float totaloraudithoursflag=0.0f;
private float totalnonoraudithoursflag=0.0f;
private float totalasqahoursflag=0.0f;
private float totalenvyhoursflag=0.0f;
private float totaldtthoursflag=0.0f;
private int totalretelcountflag=0;
private String dbrepDate;
//String ldefdate;
  ChangeDateFormat cdf=new ChangeDateFormat();
  AutoReportBean arb=new AutoReportBean();
  AutoRepInfo arf=new AutoRepInfo();
  ResultSet res=null;
  Connection con=DBConnect.startConnection(); 
 String ldefdate=arf.attendanceDate().concat(" 00:00:00");
  public AutoReportBean getAttendanceDet(){
    
    try{
      Statement st=con.createStatement();
      res=st.executeQuery("SELECT `rvaattandanceid`,b.fullname,`logindate`,`logoutdate`,timediff(`logoutdate`,`logindate`),`todayshift`,`attendancestatus` FROM `rvaattandance` as a join userprofilepersonal as b on a.profid=b.profileid WHERE `logindate` like concat(date_sub(curdate(), interval 1 day),'%') orDER BY `profid` ASC");
      while(res.next()){
        fullname.add(res.getString("b.fullname"));
        datecheck=res.getString("logindate");
        if(datecheck!=null){
        logindate.add(cdf.toAppDateTime(datecheck));
        }
        else{
          logindate.add(ldefdate);
        }
        datecheck=res.getString("logoutdate");
        if(datecheck!=null){
        logoutdate.add(cdf.toAppDateTime(datecheck));
        }
        else{
          logoutdate.add(ldefdate);
        }
        datecheck=res.getString("timediff(`logoutdate`,`logindate`)");
        if(datecheck!=null){
        workingtime.add(datecheck);
        }
        else{
          workingtime.add("00:00:00");
        }
        shift.add(res.getString("todayshift"));
        attendancestatus.add(res.getString("attendancestatus"));
      }
      arb.setEmployeeName(fullname);
      arb.setSignintime(logindate);
      arb.setSignouttime(logoutdate);
      arb.setWorkingtime(workingtime);
      arb.setShift(shift);
      arb.setAttstatus(attendancestatus);
    }
    catch(Exception e){
    e.printStackTrace();
    }
    return arb;
  }
  public AutoReportBean getPerformanceReport(){
    try{
        Statement st=con.createStatement();
      res=st.executeQuery("select * from auditors where auditorsname not like 'Nill' ");
      while(res.next()){
          fullname.add(res.getString("auditorsname"));
      }
      //System.out.println(fullname.size()+"FULL NAME");
      for(int i=0;i<fullname.size();i++){
          dbrepDate=cdf.toDbDate(arf.reportDate());
         // dbrepDate="2015-03-31";
          ResultSet res1=st.executeQuery("select sum(timetoperform),auditorsname from asauditsreportfinal as a join auditors as b on a.auditorsid=b.auditorsid where performdate between '"+dbrepDate+"' and '"+dbrepDate+"' and`locationsid` NOT IN("+3+","+4+") and clientsid NOT in("+12+") and auditorsname LIKE '"+fullname.get(i)+"' ");
    if(res1.next())
    {
    totalnonoraudithours=res1.getFloat("sum(timetoperform)")/3600;
    asnonorauditsperformancetime.add(totalnonoraudithours);
    totalnonoraudithoursflag=totalnonoraudithoursflag+totalnonoraudithours;
    }
    ResultSet res4=st.executeQuery("select sum(timetoperform),auditorsname from asauditsreportfinal as a join auditors as b on a.auditorsid=b.auditorsid where performdate between '"+dbrepDate+"' and '"+dbrepDate+"' and `locationsid` IN("+3+","+4+","+69+") and clientsid in("+3+","+12+") and auditorsname LIKE '"+fullname.get(i)+"'  ");
    if(res4.next())
    {
    totaloraudithours=res4.getFloat("sum(timetoperform)")/3600;
    asorauditsperformancetime.add(totaloraudithours);
    totaloraudithoursflag=totaloraudithoursflag+totaloraudithours;
    }
    ResultSet res2=st.executeQuery("select sum(qaperformancetime) from asqafinal where qaperformeddate between '"+dbrepDate+"' and '"+dbrepDate+"' and qaauditorname LIKE '"+fullname.get(i)+"' ");
    if(res2.next())
    {
    totalasqahours=res2.getFloat("sum(qaperformancetime)")/3600;
    asqaaudithours.add(totalasqahours);
    totalasqahoursflag=totalasqahoursflag+totalasqahours;
    }
    ResultSet res3=st.executeQuery("SELECT COUNT(`auditorname`) FROM  `retellog` WHERE performdate BETWEEN  '"+dbrepDate+"' AND  '"+dbrepDate+"' AND  `auditorname` LIKE '"+fullname.get(i)+"' ");
    if(res3.next())
    {
    totalretelcount=res3.getInt("COUNT(`auditorname`)");
    retelcounts.add(totalretelcount);
    System.out.println(totalretelcount);
    totalretelcountflag=totalretelcountflag+totalretelcount;
    }
    ResultSet res5=st.executeQuery("SELECT sum(`performancetime`) FROM  `dttfinal` WHERE performdate BETWEEN  '"+dbrepDate+"' AND  '"+dbrepDate+"' AND  `auditorname` LIKE '"+fullname.get(i)+"' ");
    if(res5.next())
    {
    totaldtthours=res5.getFloat("sum(`performancetime`)")/60;
    dttptresults.add(totaldtthours);
    totaldtthoursflag=totaldtthoursflag+totaldtthours;
    }
    ResultSet res6=st.executeQuery("SELECT sum(`timetoperform`) FROM  `envysionperformancefinal` WHERE performeddate BETWEEN  '"+dbrepDate+"' AND  '"+dbrepDate+"' AND  `auditorname` LIKE '"+fullname.get(i)+"' ");
    if(res6.next())
    {
    totalenvyhours=res6.getFloat("sum(`timetoperform`)")/60;
    envysionperformanceresult.add(totalenvyhours);
    totalenvyhoursflag=totalenvyhoursflag+totalenvyhours;
    }
    }
      arb.setEmployeeName(fullname);
      arb.setAsorauditsperformancetime(asorauditsperformancetime);
      arb.setAsnonorauditsperformancetime(asnonorauditsperformancetime);
      arb.setAsqaaudithours(asqaaudithours);
      arb.setEnvysionperformanceresult(envysionperformanceresult);
      arb.setDttptresults(dttptresults);
      arb.setRetelcounts(retelcounts);
      arb.setTotaloraudithours(totaloraudithoursflag);
      arb.setTotalnonoraudithours(totalnonoraudithoursflag);
      arb.setTotalasqahours(totalasqahoursflag);
      arb.setTotalenvyhours(totalenvyhoursflag);
      arb.setTotaldtthours(totaldtthoursflag);
      arb.setTotalretelcount(totalretelcountflag);
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return arb;
  }
}
