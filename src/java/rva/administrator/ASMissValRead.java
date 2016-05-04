/*w
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import jxl.Workbook;
import jxl.Sheet;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import jxl.DateCell;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.TimeZone;
import java.sql.*;
import rva.dbaccess.DBConnect;
public class ASMissValRead {
    static Connection conn=null;
    static PreparedStatement pstm=null;
        public static void readMissVal() throws Exception
{
  try{
    int auditsid=0, stops=0, locationsid=0, clientsid=0, auditorsloginid=0, auditorsid=0, 
choicesid=0;
int noofstops=0;
int noofChoices=0;
int timetoperform=0;

String performid;
String audit_Name;
String client_Name;
String location_Name;
String auditor_Name;
Date performed_DTime;
String audit_Choice;
DateCell performed_DT;
String forDate;
String dbdauditName;
String dbdauditorName;
String dbdperformDate;

String currentauditName;
String currentauditorName;
String currentforDate;
String dbperDate;
String dbperTime;

ArrayList<String> currentauditChoice=new ArrayList<String>();



conn=DBConnect.startConnection();
Statement st=conn.createStatement();
ResultSet res;


ArrayList<String> auditName=new ArrayList<String>();
ArrayList<String> clientName=new ArrayList<String>();
ArrayList<String> locationName=new ArrayList<String>();
ArrayList<String> auditorName=new ArrayList<String>();
ArrayList<String> performedDate=new ArrayList<String>();
ArrayList<String> auditChoice=new ArrayList<String>();
String insertrecord=null;
SimpleDateFormat dbdateformat=new SimpleDateFormat("yyyy-MM-dd");
dbdateformat.setTimeZone(TimeZone.getTimeZone("UST"));
SimpleDateFormat dbtimeformat=new SimpleDateFormat("HH:mm:ss");
dbtimeformat.setTimeZone(TimeZone.getTimeZone("UST"));
SimpleDateFormat dateformat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
dateformat.setTimeZone(TimeZone.getTimeZone("UST"));
ASMissValuesBean as=new ASMissValuesBean();
ASMissedValDAO asd=new ASMissedValDAO();
as=asd.getValues();

auditName=as.getlAuditName();
auditorName=as.getlAuditorName();
clientName=as.getlClientName();
locationName=as.getlLocationName();
performedDate=as.getlPerformDate();
auditChoice=as.getlChoiceName();
for(int i=0;i<auditorName.size();i++){
    System.out.println(auditorName.get(i));
}
st.executeUpdate("TRUNCATE asmismatcheddatas");
for(int i=0; i<=auditName.size()-1;i++)
{
audit_Name=(auditName.get(i)).replace("'","");
auditor_Name=auditorName.get(i);
forDate=performedDate.get(i);
audit_Choice=auditChoice.get(i);
location_Name=locationName.get(i);
client_Name=clientName.get(i);
currentauditChoice.add(audit_Choice);
//System.out.println(auditorName.get(i));
int auditsrowCount=0, choicesrowCount=0, auditorsrowCount=0;
res=st.executeQuery("SELECT a.noofchoices,b.auditsid,b.noofstops,b.locationsid,b.clientsid FROM `asaudits` as a JOIN asallaudits as b on a.auditsid = b.auditsid WHERE b.allauditsname LIKE '"+audit_Name+"'");
while(res.next())
{
auditsid=res.getInt("auditsid");
locationsid=res.getInt("locationsid");
clientsid=res.getInt("clientsid");
stops=res.getInt("noofstops");
noofChoices=res.getInt("noofchoices");
noofstops=i+stops;
auditsrowCount=res.getRow();
//System.out.println("AuditsId\t"+auditsid);
//System.out.println("auditsrowCount\t"+auditsrowCount);
}
//System.out.println("auditsrowcount"+auditsrowCount);
if(auditsrowCount==0)
{
    try
    {
        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
    }
    catch(SQLException e)
    {
        System.out.println(e);
    }
}
else
{
String currentChoice[]=new String[noofChoices];
ArrayList<String> choiceList=new ArrayList<String>(noofChoices);
String currenttimetoperformid[]=new String[noofChoices];
ArrayList<String> timetoperformid=new ArrayList<String>(noofChoices);
res=st.executeQuery("SELECT a.choicesname,b.timetoperformid FROM `aschoices` AS a JOIN `asauditstimetoperform` AS b ON a.choicesid = b.choicesid WHERE b.auditsid LIKE "+auditsid+"");

while(res.next())
{
 auditsrowCount=res.getRow();
 choiceList.add(res.getString("choicesname").toLowerCase());
 timetoperformid.add(res.getString("timetoperformid"));
 currentChoice=choiceList.toArray(currentChoice);
 choicesrowCount=res.getRow();
 currenttimetoperformid=timetoperformid.toArray(currenttimetoperformid);
 //System.out.println("Choices"+choicesrowCount);
}
res=st.executeQuery("SELECT a.auditorsid FROM `asauditorslogin` AS a JOIN `auditors` AS b ON a.auditorsid = b.auditorsid WHERE a.auditorsloginname LIKE '"+auditor_Name+"'");

while(res.next())
{
    auditorsrowCount=res.getRow();
    auditorsid=res.getInt("a.auditorsid");
    //System.out.println("Auditors"+auditorsrowCount);
}
if(auditorsrowCount==0)
{
    try
    {
        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
       // System.out.println("Auditors not Available"+auditorsrowCount);
    }
    catch(SQLException e)
    {
        System.out.println(e);
    }
}
else
{
//Condition 2.2: Enters here if auditorsname is available in database.
  //System.out.println(choicesflag+"\t"+audit_Choice);
  if(!choiceList.contains(audit_Choice)){
    try{
      
        //System.out.println("BEFORE REMOVE IN"+audit_Choice);

        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
    // System.out.println("AFTER REMOVE IN"+audit_Choice);
    for(int j=i-1;j>=0;j--){
    currentauditName=auditName.get(j);
    currentauditorName=auditorName.get(j);
    currentforDate=performedDate.get(j);
    audit_Choice=auditChoice.get(j);
   // System.out.println("BEFORE REMOVE IN --"+audit_Choice);
    //check whether the current and previous values are same
    if((currentauditName.equals(audit_Name))&&(currentauditorName.equals(auditor_Name))&&(currentforDate.equals(forDate)))
    {
      audit_Name=currentauditName;
      auditor_Name=currentauditorName;
      forDate=currentforDate;
        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
       // i=j;
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
     //  System.out.println("AFTER REMOVE IN --"+audit_Choice);
    }
    else{
      j=-1;
    }
    } 
    audit_Name=auditName.get(i);
      auditor_Name=auditorName.get(i);
      forDate=performedDate.get(i);
    for(int j=i+1;j<=noofstops;j++){
    currentauditName=auditName.get(j);
    currentauditorName=auditorName.get(j);
    currentforDate=performedDate.get(j);
    audit_Choice=auditChoice.get(j);
  //  System.out.println("BEFORE REMOVE IN ++"+audit_Choice);
    //check whether the current and previous values are same
    if((currentauditName.equals(audit_Name))&&(currentauditorName.equals(auditor_Name))&&(currentforDate.equals(forDate)))
    {
      audit_Name=currentauditName;
      auditor_Name=currentauditorName;
      forDate=currentforDate;
        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
        i=j;
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
       // System.out.println("AFTER REMOVE IN ++"+audit_Choice);
    }
    else{
      j=noofstops+1;
    }
    }
     
    }
    catch(SQLException e){
      System.out.println(e);
    }
  }
   
  else{
  
  if(i!=noofstops)
{
for(int j=i+1;j<=noofstops;j++)
{//Loop for check all stops refers same audit.
    try
    {
    currentauditName=auditName.get(j);
    currentauditorName=auditorName.get(j);
    currentforDate=performedDate.get(j);
    audit_Choice=auditChoice.get(j);  
   
  
    //check whether the current and previous values are same
    if((audit_Name.equals(currentauditName))&&(auditor_Name.equals(currentauditorName))&&(forDate.equals(currentforDate)))
    {//Condition 2.2.1.1: assign the current value to the flag value and store the chioce name in arrays.
        //System.out.println("Stops"+stops); 
      if(!choiceList.contains(audit_Choice)){
        try{
        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
        for(int s=j-1;s>=0;s--){
    currentauditName=auditName.get(s);
    currentauditorName=auditorName.get(s);
    currentforDate=performedDate.get(s);
    audit_Choice=auditChoice.get(s);
    //System.out.println("BEFORE REMOVE IN --"+audit_Choice+"\t"+audit_Name+"\t"+forDate+"s:\t"+s+"j:\t"+j);
    //check whether the current and previous values are same
    if((currentauditName.equals(audit_Name))&&(currentauditorName.equals(auditor_Name))&&(currentforDate.equals(forDate)))
    {
      audit_Name=currentauditName;
      auditor_Name=currentauditorName;
      forDate=currentforDate;
        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
       // i=j;
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
       //System.out.println("AFTER REMOVE IN --"+audit_Choice+"\t"+audit_Name+"\t"+forDate);
    }
    else{
      s=-1;
      //j=noofstops+1;
    }
    }
     audit_Name=auditName.get(j);
      auditor_Name=auditorName.get(j);
      forDate=performedDate.get(j);   
    for(int s=j+1;s<=noofstops;s++){
    currentauditName=auditName.get(s);
    currentauditorName=auditorName.get(s);
    currentforDate=performedDate.get(s);
    audit_Choice=auditChoice.get(s);
    //System.out.println("BEFORE REMOVE IN ++"+audit_Choice+"\t"+audit_Name+"\t"+forDate);
    //check whether the current and previous values are same
    if((currentauditName.equals(audit_Name))&&(currentauditorName.equals(auditor_Name))&&(currentforDate.equals(forDate)))
    {
      audit_Name=currentauditName;
      auditor_Name=currentauditorName;
      forDate=currentforDate;
        pstm=conn.prepareStatement("INSERT INTO `asmismatcheddatas`(auditname, locationname, clientname, performeddate, auditorname, choicename)  VALUES (?, ?, ?, ?, ?, ?)");
        pstm.setString(1, audit_Name);
        pstm.setString(2, location_Name);
        pstm.setString(3, client_Name);
        pstm.setString(4, forDate);
        i=s;
        pstm.setString(5, auditor_Name);
        pstm.setString(6, audit_Choice);
        pstm.executeUpdate();
       // System.out.println("AFTER REMOVE IN ++"+audit_Choice+"\t"+audit_Name+"\t"+forDate);
    }
    else{
      s=noofstops+1;
      j=noofstops+1;
    }
    }
    }
        catch(Exception e){
          System.out.println(e);
    }
    }
      else{
        audit_Name=currentauditName;
        auditor_Name=currentauditorName;
        i=j;
        forDate=currentforDate;
        currentauditChoice.add(audit_Choice);
      }
    }
    else
    {//Condition 2.2.1.2: Enters here if the current and previous values are not same.
       
    for(int k=0;k<currentChoice.length;k++)
    {//Loop for get audit choice for this audit.
      
      
     if(currentauditChoice.contains(currentChoice[k]))
     {//Condition sub: Enter here if audit choice is matched with the audit.
        performid=currenttimetoperformid[k];
        currentauditChoice.clear();       
        
        k=currentChoice.length+1;
        res=st.executeQuery("SELECT timetoperforminsec,choicesid FROM`asauditstimetoperform` WHERE timetoperformid LIKE "+performid+"");
        //get performance time for this audit choice
        while(res.next())
        {
            timetoperform=res.getInt("timetoperforminsec");
            
            choicesid=res.getInt("choicesid");
            try
    {
      performed_DTime=dateformat.parse(forDate);
      dbperDate=dbdateformat.format(performed_DTime);
      dbperTime=dbtimeformat.format(performed_DTime);
      //Insert the final required result into rvafinal table
       j=noofstops+1;
        pstm=conn.prepareStatement("INSERT INTO `asauditsreportfinal`(auditsid, locationsid, clientsid, performdate, performtime, auditorsid, choicesid, timetoperform)  VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        pstm.setInt(1, auditsid);
        pstm.setInt(2, locationsid);
        pstm.setInt(3, clientsid);
        pstm.setString(4, dbperDate);
        pstm.setString(5, dbperTime);
        pstm.setInt(6, auditorsid);
        pstm.setInt(7, choicesid);
        pstm.setInt(8,timetoperform);
        pstm.executeUpdate();
    }
    catch(SQLException e)
    {
        System.out.println(e);
    }
        }
        }
     
    }
    }
    
}
    catch(IndexOutOfBoundsException e)
    {
        System.out.println(e);
    }
  }
}
else
{
    for(int k=0;k<currentChoice.length;k++)
    {//Loop for get audit choice for this audit.
     if(currentauditChoice.contains(currentChoice[k]))
     {//Condition sub: Enter here if audit choice is matched with the audit.
        performid=currenttimetoperformid[k];
        currentauditChoice.clear();       
        
        k=currentChoice.length+1;
        res=st.executeQuery("SELECT timetoperforminsec,choicesid FROM`asauditstimetoperform` WHERE timetoperformid LIKE "+performid+"");
        //get performance time for this audit choice
        while(res.next())
        {
            timetoperform=res.getInt("timetoperforminsec");
            
            choicesid=res.getInt("choicesid");
            try
    {
      performed_DTime=dateformat.parse(forDate);
      dbperDate=dbdateformat.format(performed_DTime);
      dbperTime=dbtimeformat.format(performed_DTime);
      //Insert the final required result into rvafinal table
        pstm=conn.prepareStatement("INSERT INTO `asauditsreportfinal`(auditsid, locationsid, clientsid, performdate, performtime, auditorsid, choicesid, timetoperform)  VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        pstm.setInt(1, auditsid);
        pstm.setInt(2, locationsid);
        pstm.setInt(3, clientsid);
        pstm.setString(4, dbperDate);
        pstm.setString(5, dbperTime);
        pstm.setInt(6, auditorsid);
        pstm.setInt(7, choicesid);
        pstm.setInt(8,timetoperform);
        pstm.executeUpdate();
    }
    catch(SQLException e)
    {
        System.out.println(e);
    }
        }
        }
     }
    }
}
}
}
}
}   
catch(Exception e){
  System.out.println(e);
}
}
}
