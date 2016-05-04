/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

import java.util.ArrayList;

/**
 *
 * @author RCT-456
 */
public class DTTBean {
  private String taskname;
  private String auditorname;
  private int nooftasks;
  private String performdate;
  private String startdatedb;
  private String enddatedb;
  private int processstageno=0;
  private ArrayList<String> tasksname=new ArrayList<String>();
  private ArrayList<String> auditorsname=new ArrayList<String>();
  private ArrayList<String> startDateApp=new ArrayList<String>();
  private ArrayList<String> endDateApp=new ArrayList<String>();
  private ArrayList<Float> performancetime=new ArrayList<Float>();
  private ArrayList<String> taskcount=new ArrayList<String>();
  private ArrayList<String> lprocessStage=new ArrayList<String>();
  private ArrayList<String> logmeinname=new ArrayList<String>();
  private ArrayList<Integer> dttmissedvalrn=new ArrayList<Integer>();
  private int taskid;
  private int timetoperform;
  
  public void setdttmissedvalrn(ArrayList<Integer> dttmissedvalrn){
    this.dttmissedvalrn=dttmissedvalrn;
  }
  public ArrayList<Integer> getdttmissedvalrn(){
    return dttmissedvalrn;
  }
  public void setlogmeinname(ArrayList<String> logmeinname){
    this.logmeinname=logmeinname;
  }
  public ArrayList<String> getlogmeinname(){
    return logmeinname;
  }
  public void setprocessStage(ArrayList<String> lprocessStage){
    this.lprocessStage=lprocessStage;
  }
  public ArrayList<String> getprocessStage(){
    return lprocessStage;
  }
  public void setprocessstageno(int processstageno){
    this.processstageno=processstageno;
  }
  public int getprocessstageno(){
    return processstageno;
  }
   public void settaskId(int taskid){
    this.taskid=taskid;
  }
  public int gettaskid(){
    return taskid;
  }
   public void settimetoperform(int timetoperform){
    this.timetoperform=timetoperform;
  }
  public int timetoperform(){
    return timetoperform;
  }
  
  
  public void setauditorsname(ArrayList<String> auditorsname){
    this.auditorsname=auditorsname;
  }
  public ArrayList<String> getauditorsname(){
    return auditorsname;
  }
  public void setstartDateApp(ArrayList<String> startDateApp){
    this.startDateApp=startDateApp;
  }
  public ArrayList<String> getstartDateApp(){
    return startDateApp;
  }
  
  public void setendDateApp(ArrayList<String> endDateApp){
    this.endDateApp=endDateApp;
  }
  public ArrayList<String> getendDateApp(){
    return endDateApp;
  }
  public void setperformancetime(ArrayList<Float> performancetime){
    this.performancetime=performancetime;
  }
  public ArrayList<Float> getperformancetime(){
    return performancetime;
  }
  public void settaskcount(ArrayList<String> taskcount){
    this.taskcount=taskcount;
  }
  public ArrayList<String> gettaskcount(){
    return taskcount;
  }
  public void settaskname(String taskname){
    this.taskname=taskname;
  }
  public String gettaskname(){
     return taskname;
  }
  public void setauditorname(String auditorname){
    this.auditorname=auditorname;
  }
  public String getauditorname(){
     return auditorname;
  }
  public void setperformdate(String performdate){
    this.performdate=performdate;
  }
  public String getperformdate(){
     return performdate;
  }
  public void setstartdateapp(String startdatedb){
    this.startdatedb=startdatedb;
  }
  public String getstartdateapp(){
     return startdatedb;
  }
  public void setenddateapp(String enddatedb){
    this.enddatedb=enddatedb;
  }
  public String getenddateapp(){
     return enddatedb;
  }
  public void setnooftasks(int nooftasks){
    this.nooftasks=nooftasks;
  }
  public int getnooftasks(){
     return nooftasks;
  }
  public void settasksname(ArrayList<String> tasksname){
    this.tasksname=tasksname;
  }
  public ArrayList<String> gettasksname(){
    return tasksname;
  }
}
