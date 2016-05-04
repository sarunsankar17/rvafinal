/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;
import java.util.*;
/**
 *
 * @author RCT-456
 */
public class EnvysionBean {
 //private String taskname;
// private String cafename;
// private String taskcount;
 private String performdate;
 private String auditorname;
 private ArrayList<String> ltaskname=new ArrayList<String>();
 private ArrayList<String> lcafename=new ArrayList<String>();
 private ArrayList<String> ltaskcount=new ArrayList<String>();
 private ArrayList<String> lauditorsname=new ArrayList<String>();
 private ArrayList<String> ldatadate=new ArrayList<String>();
 private ArrayList<String> ltasksrowno=new ArrayList<String>();
 private ArrayList<Float>  lpt=new ArrayList<Float>();
 private String taskname;
 private String cafename;
 private int taskid;
 private int cafeid;
 private int timetoperform;
 private String startDate;
 private String endDate;
 private String dataDate;
 ArrayList<String> lstartDate=new ArrayList<String>();
 ArrayList<String> lendDate=new ArrayList<String>();
 
 
 public void setDataDate(String dataDate){
 this.dataDate=dataDate;    
 }
 public String getDatadate()
 {
     return dataDate;
 }
 public void setRowno(ArrayList<String> ltasksrowno){
   this.ltasksrowno=ltasksrowno;
 }
 public ArrayList<String> getRowno(){
   return ltasksrowno;
 }
 public void setlDatadate(ArrayList<String> ldatadate){
   this.ldatadate=ldatadate;
 }
 public ArrayList<String> getlDatadate(){
   return ldatadate;
 }
 
 public void setstartDate(String startDate){
   this.startDate=startDate;
 }
 public String getstartDate(){
   return startDate;
 }
 public void setendDate(String endDate){
   this.endDate=endDate;
 }
 public String getendDate(){
   return endDate;
 }
 public void setauditorsname(ArrayList<String> lauditorsname){
   this.lauditorsname=lauditorsname;
 }
 public ArrayList<String> getauditorsname(){
   return lauditorsname;
 }
 public void setlStartdate(ArrayList<String> lstartDate){
   this.lstartDate=lstartDate;
 }
 public ArrayList<String> getlStartdate(){
   return lstartDate;
 }
 public void setlEnddate(ArrayList<String> lendDate){
   this.lendDate=lendDate;
 }
 public ArrayList<String> getlEnddate(){
   return lendDate;
 }
 public void setperformancetime(ArrayList<Float> lpt){
   this.lpt=lpt;
 }
 public ArrayList<Float> getperformancetime(){
   return lpt;
 }
 public void setTimetoperform(int timetoperform){
   this.timetoperform=timetoperform;
 }
 public int getTimetoperform(){
   return timetoperform;
 }
 public void settaskName(String taskname){
   this.taskname=taskname;
 }
 public String gettaskName(){
   return taskname;
 }
 public void setcafeName(String cafename){
   this.cafename=cafename;
 }
 public String getcafeName(){
   return cafename;
 }
 public void settaskId(int taskid){
   this.taskid=taskid;
 }
 public int gettaskId(){
   return taskid;
 }
 public void setcafeId(int cafeid){
   this.cafeid=cafeid;
 }
 public int getcafeId(){
   return cafeid;
 }
 
 public void settasksName(ArrayList<String> ltaskname){
 this.ltaskname=ltaskname;
 }
 public ArrayList<String> gettasksName(){
   return ltaskname;
 }
 public void setcafesName(ArrayList<String> lcafename){
 this.lcafename=lcafename;
 }
 public ArrayList<String> getcafesName(){
   return lcafename;
 }
 public void settaskCount(ArrayList<String> ltaskcount){
 this.ltaskcount=ltaskcount;
 }
 public ArrayList<String> gettaskCount(){
   return ltaskcount;
 }
 public void setauditorName(String auditorname){
 this.auditorname=auditorname;
 }
 public String getauditorName(){
   return auditorname;
 }
 public void setperformDate(String performdate){
 this.performdate=performdate;
 }
 public String geperformDate(){
   return performdate;
 } 
}
