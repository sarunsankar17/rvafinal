/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.File;
import java.io.FileOutputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import rva.administrator.ChangeDateFormat;
import rva.dbaccess.DBConnect;


public class RetFileRead {
    
    private static String filepath;
    static Connection con=null;
    static PreparedStatement pstm=null;
    private final static String tn140store="Demography through the store";
    private final static String radcon="140 store";
    //private final static String non140="";
    public static void readExcels(String filePath, String empname, String appperformdate) throws Exception
{
    filepath=filePath;
   ChangeDateFormat cdf=new ChangeDateFormat();
File file=new File(filepath);
String auditorName=empname;
Workbook wb=Workbook.getWorkbook(file);

Sheet sheet=wb.getSheet(0);

int noRows=sheet.getRows()-1;

con=DBConnect.startConnection();
Statement st=con.createStatement();
ResultSet res;

ArrayList<String> ltaskno=new ArrayList<String>();
ArrayList<String> ltaskname=new ArrayList<String>();
ArrayList<String> lstartTime=new ArrayList<String>();
ArrayList<String> lendTime=new ArrayList<String>();
String performdate=cdf.toDbDate(appperformdate);
int tasknameid=0;
String taskname;
String taskno;
String stime;
String etime;

//Read Excel values using JXL
for(int e=1; e<=noRows;e++)
{
   // System.out.println(e);
taskno=sheet.getCell(1,e).getContents();
taskname=sheet.getCell(2,e).getContents();
stime=sheet.getCell(3,e).getContents();
etime=sheet.getCell(4,e).getContents();


ltaskno.add(taskno);
ltaskname.add(taskname);
lstartTime.add(stime);
lendTime.add(etime);

}
//Get Arraylist values and check with database

for(int i=0; i<=noRows-1;i++)
{
  taskname=ltaskname.get(i);
  if(taskname.equalsIgnoreCase("Demography through 140 store")){
    res=st.executeQuery("SELECT tasknameid from reteltaskname where taskname LIKE '"+tn140store+"' ");
       while(res.next())
       {
       tasknameid=res.getInt("tasknameid");
       }
 pstm=con.prepareStatement("INSERT INTO `retellog`(taskno,tasknameid,performdate,starttime,endtime,auditorname,140store) VALUES(?,?,?,?,?,?,?)");
 pstm.setString(1,ltaskno.get(i));
 pstm.setInt(2,tasknameid);
 pstm.setString(3,performdate);
 pstm.setString(4,lstartTime.get(i));
 pstm.setString(5,lendTime.get(i));
 pstm.setString(6,auditorName);
 pstm.setString(7,radcon);
 pstm.executeUpdate();
  }
  else{
    
       res=st.executeQuery("SELECT tasknameid from reteltaskname where taskname LIKE '"+ltaskname.get(i)+"' ");
       while(res.next())
       {
       tasknameid=res.getInt("tasknameid");
       }
 pstm=con.prepareStatement("INSERT INTO `retellog`(taskno,tasknameid,performdate,starttime,endtime,auditorname,140store) VALUES(?,?,?,?,?,?,?)");
 pstm.setString(1,ltaskno.get(i));
 pstm.setInt(2,tasknameid);
 pstm.setString(3,performdate);
 pstm.setString(4,lstartTime.get(i));
 pstm.setString(5,lendTime.get(i));
 pstm.setString(6,auditorName);
 pstm.setString(7,"");
 pstm.executeUpdate(); 
  }
}
}
}    
