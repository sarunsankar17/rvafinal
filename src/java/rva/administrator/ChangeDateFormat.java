/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
/**
 *
 * @author RCT-456
 */
public class ChangeDateFormat {
  private String appdate=null;
  private String dbdate=null;
  private String appdt=null;
  private String my=null;
  private String time=null;
  private String repdate=null;
  Date date=null;
  SimpleDateFormat appsdf=new SimpleDateFormat("MM/dd/yyyy");
  SimpleDateFormat dbsdf=new SimpleDateFormat("yyyy-MM-dd");
  SimpleDateFormat appsdfdt=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
  SimpleDateFormat dbsdfdt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  SimpleDateFormat monyear=new SimpleDateFormat("MMM/yyyy");
  SimpleDateFormat dbtime=new SimpleDateFormat("HH:mm:ss");
  SimpleDateFormat repsdf=new SimpleDateFormat("MM-dd-yyyy");
  public String toTime(String time){
    try{
      date=dbsdfdt.parse(time);
      time=dbtime.format(date);
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return time;
  }
  public String toAppDate(String dbDate){
    try{
   date=repsdf.parse(dbDate);
   //System.out.println("toAppDate\t"+date);
   appdate=appsdf.format(date);
  }
catch(Exception e){
e.printStackTrace();
}
return appdate;
}
public String toDbDate(String appDate){
    try{
   date=appsdf.parse(appDate);
   dbdate=dbsdf.format(date);
   //System.out.println(dbdate);
  }
catch(Exception e){
  //System.out.println(date);
e.printStackTrace();
}
return dbdate;
}
public String toAppDateTime(String dbDateTime){
    try{
   date=dbsdfdt.parse(dbDateTime);
   appdt=appsdfdt.format(date);
  // System.out.println(appdt);
  }
catch(Exception e){
 // System.out.println(appdt);
e.printStackTrace();
}
return appdt;
}
public String todbDateTimeAttend(Date date){
  try{
    appdt=dbsdfdt.format(date);
  }
  catch(Exception e){
    System.out.println(e);
  }
  return appdt;
}
public String todbdateformat(String my){
  try{
    date= monyear.parse(my);
    dbdate=dbsdf.format(date);
  }
  catch(Exception e){
    e.printStackTrace();
  }
  return dbdate;
}
public String setEndDate(String startDate){
  try{
    date=dbsdf.parse(startDate);
    Calendar cal=Calendar.getInstance();
    cal.setTime(date);
    cal.add(Calendar.MONTH, 1);
    cal.set(Calendar.DAY_OF_MONTH,1);
    cal.add(Calendar.DATE, -1);
    dbdate=dbsdf.format(cal.getTime());
  }
  catch(Exception e){
    e.printStackTrace();
  }
  return dbdate;
}
public String setRepDate(Date date){
  repdate=repsdf.format(date);
  //System.out.println("SetRepDate\t"+repdate);
  return repdate;
}
public Date toRepDateTime(String appdt){
  try{
  date=appsdfdt.parse(appdt);
  }
  catch(Exception e){
    e.printStackTrace();
  }
  return date;
}
public String todbDate(Date date){
  try{
    dbdate=dbsdf.format(date);
  }
  catch(Exception e){
    e.printStackTrace();
  }
  return dbdate;
}
public String dbDatetoAppDate(String dbdate){
  try{
    date=dbsdf.parse(dbdate);
    appdate=appsdf.format(date);
  }
  catch(Exception e){
    e.printStackTrace();
  }
  return appdate;
}
}
