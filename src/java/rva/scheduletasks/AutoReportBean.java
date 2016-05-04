/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.scheduletasks;

import java.util.ArrayList;

/**
 *
 * @author RCT-456
 */
public class AutoReportBean {
  
private String reportName=null;
private String attendanceDate=null;
private ArrayList<String> employeeName=new ArrayList<String>();
private ArrayList<String> signintime=new ArrayList<String>();
private ArrayList<String> signouttime=new ArrayList<String>();
private ArrayList<String> workingtime=new ArrayList<String>();
private ArrayList<String> shift=new ArrayList<String>();
private ArrayList<String> attendancedate=new ArrayList<String>();
private ArrayList<String> newjoinees=new ArrayList<String>();
private ArrayList<String> releivedemployees=new ArrayList<String>();
private ArrayList<Float> asnonorauditsperformancetime=new ArrayList<Float>();
private ArrayList<Float> asorauditsperformancetime=new ArrayList<Float>();
private ArrayList<Float> asqaaudithours=new ArrayList<Float>();
private ArrayList<Float> envysionperformanceresult=new ArrayList<Float>();
private ArrayList<Float> dttptresults=new ArrayList<Float>();
private ArrayList<Integer> retelcounts=new ArrayList<Integer>();
private ArrayList<String> attstatus=new ArrayList<String>();
private float totaloraudithours;
private float totalnonoraudithours;
private float totalasqahours;
private float totalenvyhours;
private float totaldtthours;
private int totalretelcount;

public void setReportName(String reportName){
  this.reportName=reportName;
}
  public String getReportName(){
    return reportName;
  }
public void setAttendanceDate(String attendanceDate){
  this.attendanceDate=attendanceDate;
}
  public String getAttendanceDate(){
    return attendanceDate;
  }

  public ArrayList<String> getEmployeeName() {
    return employeeName;
  }

  public void setEmployeeName(ArrayList<String> employeeName) {
    this.employeeName = employeeName;
  }

  public ArrayList<String> getSignintime() {
    return signintime;
  }

  public void setSignintime(ArrayList<String> signintime) {
    this.signintime = signintime;
  }

  public ArrayList<String> getSignouttime() {
    return signouttime;
  }

  public void setSignouttime(ArrayList<String> signouttime) {
    this.signouttime = signouttime;
  }

  public ArrayList<String> getWorkingtime() {
    return workingtime;
  }

  public void setWorkingtime(ArrayList<String> workingtime) {
    this.workingtime = workingtime;
  }

  public ArrayList<String> getShift() {
    return shift;
  }

  public void setShift(ArrayList<String> shift) {
    this.shift = shift;
  }

  public ArrayList<String> getAttendancedate() {
    return attendancedate;
  }

  public void setAttendancedate(ArrayList<String> attendancedate) {
    this.attendancedate = attendancedate;
  }

  public ArrayList<String> getNewjoinees() {
    return newjoinees;
  }

  public void setNewjoinees(ArrayList<String> newjoinees) {
    this.newjoinees = newjoinees;
  }

  public ArrayList<String> getReleivedemployees() {
    return releivedemployees;
  }

  public void setReleivedemployees(ArrayList<String> releivedemployees) {
    this.releivedemployees = releivedemployees;
  }

  public ArrayList<Float> getAsnonorauditsperformancetime() {
    return asnonorauditsperformancetime;
  }

  public void setAsnonorauditsperformancetime(ArrayList<Float> asnonorauditsperformancetime) {
    this.asnonorauditsperformancetime = asnonorauditsperformancetime;
  }

  public ArrayList<Float> getAsorauditsperformancetime() {
    return asorauditsperformancetime;
  }

  public void setAsorauditsperformancetime(ArrayList<Float> asorauditsperformancetime) {
    this.asorauditsperformancetime = asorauditsperformancetime;
  }

  public ArrayList<Float> getAsqaaudithours() {
    return asqaaudithours;
  }

  public void setAsqaaudithours(ArrayList<Float> asqaaudithours) {
    this.asqaaudithours = asqaaudithours;
  }

  public ArrayList<Float> getEnvysionperformanceresult() {
    return envysionperformanceresult;
  }

  public void setEnvysionperformanceresult(ArrayList<Float> envysionperformanceresult) {
    this.envysionperformanceresult = envysionperformanceresult;
  }

  public ArrayList<Float> getDttptresults() {
    return dttptresults;
  }

  public void setDttptresults(ArrayList<Float> dttptresults) {
    this.dttptresults = dttptresults;
  }

  public ArrayList<Integer> getRetelcounts() {
    return retelcounts;
  }

  public void setRetelcounts(ArrayList<Integer> retelcounts) {
    this.retelcounts = retelcounts;
  }

  public float getTotaloraudithours() {
    return totaloraudithours;
  }

  public void setTotaloraudithours(float totaloraudithours) {
    this.totaloraudithours = totaloraudithours;
  }

  public float getTotalnonoraudithours() {
    return totalnonoraudithours;
  }

  public void setTotalnonoraudithours(float totalnonoraudithours) {
    this.totalnonoraudithours = totalnonoraudithours;
  }

  public float getTotalasqahours() {
    return totalasqahours;
  }

  public void setTotalasqahours(float totalasqahours) {
    this.totalasqahours = totalasqahours;
  }

  public float getTotalenvyhours() {
    return totalenvyhours;
  }

  public void setTotalenvyhours(float totalenvyhours) {
    this.totalenvyhours = totalenvyhours;
  }

  public float getTotaldtthours() {
    return totaldtthours;
  }

  public void setTotaldtthours(float totaldtthours) {
    this.totaldtthours = totaldtthours;
  }

  public int getTotalretelcount() {
    return totalretelcount;
  }

  public void setTotalretelcount(int totalretelcount) {
    this.totalretelcount = totalretelcount;
  }

  public ArrayList<String> getAttstatus() {
    return attstatus;
  }

  public void setAttstatus(ArrayList<String> attstatus) {
    this.attstatus = attstatus;
  }
}
