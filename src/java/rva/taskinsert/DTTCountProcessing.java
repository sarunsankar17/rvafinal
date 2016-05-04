/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

import java.util.ArrayList;
import java.sql.*;
import rva.dbaccess.DBConnect;

/**
 *
 * @author RCT-456
 */
public class DTTCountProcessing {
  
  private String auditorName;
  private int taskid;
  private int taskcount=1;
  private int performancetime;
  private String performdatedb;
  private String logmenin=null;
  private String process=null;
  private int processstage;
  ArrayList<String> ltaskname=new ArrayList<String>();
  ArrayList<String> ltaskcount=new ArrayList<String>();
  ArrayList<String> lprocessStage=new ArrayList<String>();
  ArrayList<String> logmeinid=new ArrayList<String>();
  GettingDTTTaskId gettid=new GettingDTTTaskId();
  
  DTTBean InsertdttCount(DTTBean dttbean){
    try{
    auditorName=dttbean.getauditorname();
    performdatedb=dttbean.getperformdate();
    ltaskname=dttbean.gettasksname();
    ltaskcount=dttbean.gettaskcount();
    lprocessStage=dttbean.getprocessStage();
    logmeinid=dttbean.getlogmeinname();
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    PreparedStatement pstm=null;
    for(int i=0;i<ltaskname.size();i++){
      //taskcount=Integer.parseInt(ltaskcount.get(i));
      dttbean=gettid.getTaskid(ltaskname.get(i),lprocessStage.get(i));
      taskid=dttbean.gettaskid();
      processstage=dttbean.getprocessstageno();
      performancetime=(dttbean.timetoperform())*taskcount;
      pstm=con.prepareStatement("INSERT INTO dttfinal(logmeinname,`dtttaskid`, `auditorname`, `performdate`,processstageno, `nooftasksperformed`, `performancetime`) VALUES(?,?,?,?,?,?,?) ");
      pstm.setString(1, logmeinid.get(i));
      pstm.setInt(2, taskid);
      pstm.setString(3,auditorName);
      pstm.setString(4, performdatedb);
      pstm.setInt(5, processstage);
      pstm.setInt(6, taskcount);
      pstm.setInt(7, performancetime);
      pstm.executeUpdate();
    }
    }
    catch(Exception e){
      System.out.println(e);
    }
    return dttbean;
  }
}
