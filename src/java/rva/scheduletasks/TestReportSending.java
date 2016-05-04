/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.scheduletasks;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.io.*;
import jxl.*;
import jxl.format.Alignment;
import jxl.format.BoldStyle;
import jxl.format.UnderlineStyle;
import jxl.write.DateTime;
import jxl.write.Label;
import jxl.write.WritableCell;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import rva.administrator.ChangeDateFormat;
import jxl.write.Number;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
/**
 *
 * @author RCT-456
 */
public class TestReportSending implements Job {
  
   public void execute(JobExecutionContext context) throws JobExecutionException
   {
      
      // Recipient's email ID needs to be mentioned.
      String to = "sarunsankar17@gmail.com";

      // Sender's email ID needs to be mentioned
      String from = "ayan.sankar10@gmail.com";

      // Assuming you are sending email from localhost
      String host = "localhost";

      // Get system properties
  Properties properties = new Properties();
  properties.put("mail.smtp.host", "smtp.gmail.com");  
  properties.put("mail.smtp.socketFactory.port", "465");  
  properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
  properties.put("mail.smtp.auth", "true");  
  properties.put("mail.smtp.port", "465"); 
      // Get the default Session object.
      Session session = Session.getInstance(properties,
              new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication(){
                  return new PasswordAuthentication("ayan.sankar10@gmail.com","msdhoni04oct");
                }
});
try{
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(to));

         // Set Subject: header field
         message.setSubject("This is the Subject Line!");

         // Create the message part 
         BodyPart messageBodyPart = new MimeBodyPart();

         // Fill the message
         messageBodyPart.setText("This is message body");
         
         // Create a multipar message
         Multipart multipart = new MimeMultipart();

         // Set text message part
         multipart.addBodyPart(messageBodyPart);

         // Part two is attachment
         messageBodyPart = new MimeBodyPart();
         
           //String fileName="test.xls";
  AutoRepInfo arf=new AutoRepInfo();
  String filename=arf.getReportName();
  AutoReportBean arb=new AutoReportGeneration().getAttendanceDet();
  AutoReportBean arbpt=new AutoReportGeneration().getPerformanceReport();
  
  ArrayList<String> employeeName=arb.getEmployeeName();
  ArrayList<String> signinTime=arb.getSignintime();
  ArrayList<String> signoutTime=arb.getSignouttime();
  ArrayList<String> WorkingTime=arb.getWorkingtime();
  ArrayList<String> Shift=arb.getShift();
  ArrayList<String> attendanceStatus=arb.getAttstatus();
  ArrayList<String> newjoinees=new ArrayList<String>();
  ArrayList<String> relievedemp=new ArrayList<String>();
  int currow=0;
  int newjoineesrow=1;
  int relievedemps=1;
  
 ArrayList<String> auditorName=arbpt.getEmployeeName();
 ArrayList<Float> asnonorauditsperformancetime=arbpt.getAsnonorauditsperformancetime();
 ArrayList<Float> asorauditsperformancetime=arbpt.getAsorauditsperformancetime();
 ArrayList<Float> asqaaudithours=arbpt.getAsqaaudithours();
 ArrayList<Float> envysionperformanceresult=arbpt.getEnvysionperformanceresult();
 ArrayList<Float> dttptresults=arbpt.getDttptresults();
 ArrayList<Integer> retelcounts=arbpt.getRetelcounts();
 float totaloraudithours=arbpt.getTotaloraudithours();
 float totalnonoraudithours=arbpt.getTotalnonoraudithours();
 float totalasqahours=arbpt.getTotalasqahours();
 float totalenvyhours=arbpt.getTotalenvyhours();
 float totaldtthours=arbpt.getTotaldtthours();
 int totalretelcount=arbpt.getTotalretelcount();
 
String ptreportName="Performance Report - ".concat(arf.reportDate());  
Number nb=null;
String repname="RVA Attendance - ".concat(arf.attendanceDate());
File file=new File(filename);
FileOutputStream fout=new FileOutputStream(file);
JXLCellFormatting jcf=new JXLCellFormatting();
DateTime dt=null;
WritableWorkbook wb=Workbook.createWorkbook(fout);
System.out.println(wb);
WritableSheet s=wb.createSheet("RVA Attendance Info", 0);
WritableCellFormat wcf=null;
s.mergeCells(1, 0, 4, 0);
wcf=jcf.getHeadFormat();
CellView cv=new CellView();
cv.setAutosize(true);

s.addCell(new Label(1,0,repname,wcf));
wcf=jcf.getTitleFormat();
wcf.setAlignment(Alignment.CENTRE);
s.addCell(new Label(0,2,"S.No",wcf));
s.addCell(new Label(1,2,"Name",wcf));
s.addCell(new Label(2,2,"Sign In Time",wcf));
s.addCell(new Label(3,2,"Sign Out Time",wcf));
s.addCell(new Label(4,2,"Working Time",wcf));
s.addCell(new Label(5,2,"Shift",wcf));
s.addCell(new Label(6,2,"Attendance Status",wcf));
System.out.println("Employee Size:\t"+employeeName.size());
//wcf.setAlignment(Alignment.RIGHT);
for(int i=3;i<employeeName.size()+3;i++){
for(int j=0;j<=6;j++){
  if(j==0){
    s.setColumnView(j,cv);
    nb=jcf.getIntNumFormat(j,i,i-2);
    s.addCell(nb);
  }
  if(j==1){
  s.setColumnView(j,cv);
  WritableCellFormat wcf1=jcf.getNameFormat();
    s.addCell(new Label(j,i,employeeName.get(i-3),wcf1));
  }
  if(j==2){
    s.setColumnView(j,cv);
   dt=jcf.getDTFormat(j,i,signinTime.get(i-3));
    s.addCell(dt);
  }
  if(j==3){
    s.setColumnView(j,cv);
    dt=jcf.getDTFormat(j,i,signoutTime.get(i-3));
    s.addCell(dt);
  }
  
  if(j==4){   
    s.setColumnView(j,cv);
  WritableCellFormat wcf2=jcf.getlabelFormat();
    s.addCell(new Label(j,i,WorkingTime.get(i-3),wcf2));
  }
  if(j==5){
    s.setColumnView(j,cv);
    WritableCellFormat wcf3=jcf.getlabelFormat();
    if(Shift.get(i-3)==null){
      s.addCell(new Label(j,i,"NA",wcf3));
    }
    else{
      s.setColumnView(j,cv);
      wcf=jcf.getlabelFormat();
    s.addCell(new Label(j,i,Shift.get(i-3),wcf3));
  }
  }
  if(j==6){
    s.setColumnView(j,cv);
 WritableCellFormat  wcf4=jcf.getlabelFormat();
    s.addCell(new Label(j,i,attendanceStatus.get(i-3),wcf4));
}
}
}
newjoinees=arf.getNewJoinees();
if(newjoinees.size()>0){
  currow=employeeName.size()+5;
  s.mergeCells(0, currow, 1, currow);
  wcf=jcf.getHeadFormat();
  s.addCell(new Label(0,currow,"New Joinees",wcf));
  currow=currow+1;
  wcf=jcf.getTitleFormat();
  s.addCell(new Label(0,currow,"S.No",wcf));
  s.addCell(new Label(1,currow,"Employee Name",wcf));
  currow=currow+1;
  for(int i=0;i<newjoinees.size();i++){
    for(int j=0;j<=1;j++){
      if(j==0){
        //newjoineesrow=1;
    s.setColumnView(j,cv);
  nb=jcf.getIntNumFormat(j,i+currow,i+1);
    newjoineesrow=newjoineesrow+1;
    s.addCell(nb);
      }
      if(j==1){
  s.setColumnView(j,cv);
  WritableCellFormat wcf1=jcf.getNameFormat();
  s.addCell(new Label(j,i+currow,newjoinees.get(i),wcf1));
      }
    }
  } 
}

relievedemp=arf.getRelievedEmps();
if(relievedemp.size()>0){
  currow=newjoinees.size()+employeeName.size()+9;
  s.mergeCells(0, currow, 1, currow);
  wcf=jcf.getHeadFormat();
  s.addCell(new Label(0,currow,"Resigned Employees",wcf));
  currow=currow+1;
  wcf=jcf.getTitleFormat();
  s.addCell(new Label(0,currow,"S.No",wcf));
  s.addCell(new Label(1,currow,"Employee Name",wcf));
  currow=currow+1;
  for(int i=0;i<relievedemp.size();i++){
    for(int j=0;j<=1;j++){
      if(j==0){
        //newjoineesrow=1;
    s.setColumnView(j,cv);
  nb=jcf.getIntNumFormat(j,i+currow,i+1);
    newjoineesrow=newjoineesrow+1;
    s.addCell(nb);
      }
      if(j==1){
  s.setColumnView(j,cv);
  WritableCellFormat wcf1=jcf.getNameFormat();
  s.addCell(new Label(j,i+currow,relievedemp.get(i),wcf1));
      }
    }
  } 
}
WritableSheet s1=wb.createSheet("Performance Report", 1);
s1.mergeCells(1, 0, 4, 0);
wcf=jcf.getHeadFormat();

s1.addCell(new Label(1,0,ptreportName,wcf));
wcf=jcf.getTitleFormat();
wcf.setAlignment(Alignment.CENTRE);
s1.addCell(new Label(0,2,"S.No",wcf));
s1.addCell(new Label(1,2,"Name",wcf));
s1.addCell(new Label(2,2,"AS Non-OR",wcf));
s1.addCell(new Label(3,2,"AS OR",wcf));
s1.addCell(new Label(4,2,"AS QA",wcf));
s1.addCell(new Label(5,2,"DTT",wcf));
s1.addCell(new Label(6,2,"Envysion",wcf));
s1.addCell(new Label(7,2,"ReTel",wcf));

for(int i=3;i<auditorName.size()+3;i++){
  for(int j=0;j<=7;j++){
    if(j==0){
    s1.setColumnView(j,cv);
   nb=jcf.getIntNumFormat(j,i,i-2);
    s1.addCell(nb);
  }
    if(j==1){
    s1.setColumnView(j,cv);
    WritableCellFormat wcf1=jcf.getNameFormat();
    s1.addCell(new Label(j,i,auditorName.get(i-3),wcf1));
    }
    if(j==2){
    s1.setColumnView(j,cv);
  nb=jcf.getFPNumFormat(j,i,asnonorauditsperformancetime.get(i-3));
    s1.addCell(nb);
    }
    if(j==3){
    s1.setColumnView(j,cv);
    Number nb1=jcf.getFPNumFormat(j,i,asorauditsperformancetime.get(i-3));
    s1.addCell(nb1);
    }
    if(j==4){
    s1.setColumnView(j,cv);
    Number nb2=jcf.getFPNumFormat(j,i,asqaaudithours.get(i-3));
    s1.addCell(nb2);
    }
    if(j==5){
    s1.setColumnView(j,cv);
   Number nb3 =jcf.getFPNumFormat(j,i,dttptresults.get(i-3));
    s1.addCell(nb3);
    }
    if(j==6){
    s1.setColumnView(j,cv);
    Number nb4=jcf.getFPNumFormat(j,i,envysionperformanceresult.get(i-3));
    s1.addCell(nb4);
    }
    if(j==7){
    s1.setColumnView(j,cv);
    Number nb5=jcf.getIntNumFormat(j,i,retelcounts.get(i-3));
    s1.addCell(nb5);
    }
  }
}
currow=auditorName.size()+3;
s1.mergeCells(0, currow, 1, currow);
wcf=jcf.getTitleFormat();
s1.addCell(new Label(0,currow,"Total",wcf));
nb=jcf.getFPBNumFormat(2, currow, totalnonoraudithours);
s1.addCell(nb);
Number nb1=jcf.getFPBNumFormat(3, currow, totaloraudithours);
s1.addCell(nb1);
Number nb3=jcf.getFPBNumFormat(4, currow, totalasqahours);
s1.addCell(nb3);
Number nb4=jcf.getFPBNumFormat(5, currow, totaldtthours);
s1.addCell(nb4);
Number nb5=jcf.getFPBNumFormat(6, currow, totalenvyhours);
s1.addCell(nb5);
Number nb6=jcf.getIntBNumFormat(7, currow, totalretelcount);
s1.addCell(nb6);
wb.write();
wb.close();
         DataSource source = new FileDataSource(file);
         messageBodyPart.setDataHandler(new DataHandler(source));
         messageBodyPart.setFileName(filename);
         multipart.addBodyPart(messageBodyPart);
         // Send the complete message parts
         message.setContent(multipart);
         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      }catch (MessagingException mex) {
         mex.printStackTrace();
}
      catch(IOException e){
        e.printStackTrace();
      }
      catch(WriteException e){
        e.printStackTrace();
      }
}
}

