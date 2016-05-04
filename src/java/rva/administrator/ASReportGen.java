/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.administrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.OutputStream;
//import java.text.NumberFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jxl.format.Font;
import jxl.Workbook;
import jxl.format.CellFormat;
import jxl.write.Label;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableWorkbook;
import jxl.write.WritableSheet;
import rva.showperformance.ASChecklistBean;
import jxl.write.Number;
import jxl.write.WritableFont;
public class ASReportGen extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //String fileName="test.xls";
  OutputStream out=null;
  try{
   final String label1="S.No";
   final String label2="Auditor Name";
   final String label3="Client Name";
   final String label4="Location Name";
   final String label5="Start Date";
   final String label6="End Date";
   final String label7="Shift";
   final String label8="Performance Time in Hours";
    ArrayList<String> lauditorName=new ArrayList<String>();
    ArrayList<String> lclientName=new ArrayList<String>();
    ArrayList<String> llocationName=new ArrayList<String>();
    ArrayList<String> lshiftName=new ArrayList<String>();
    ArrayList<String> lstartDate=new ArrayList<String>();
    ArrayList<String> lendDate=new ArrayList<String>();
    ArrayList<Float> performancetime=new ArrayList<Float>();
    String file="test.xls";
    HttpSession session=request.getSession();
    ASChecklistBean clb=(ASChecklistBean) session.getAttribute("currentasclvalues1");
    lauditorName=clb.getlauditorName();
    lclientName=clb.getlclientName();
    llocationName=clb.getllocationName();
    lshiftName=clb.getlshiftTime();
    lstartDate=clb.getlstartDate();
    lendDate=clb.getlendDate();
    performancetime=clb.getltimetoPerform(); 
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment;filename="+file+"");
  WritableWorkbook wb=Workbook.createWorkbook(response.getOutputStream());
  WritableSheet s=wb.createSheet("Report", 0);
  WritableCellFormat numform=new WritableCellFormat(new NumberFormat("#.00"));
  WritableCellFormat intnumform=new WritableCellFormat(new NumberFormat("#"));
  WritableFont wf= new WritableFont(WritableFont.ARIAL,10);
  wf.setBoldStyle(WritableFont.BOLD);
  WritableCellFormat textfor=new WritableCellFormat(wf);
    s.addCell(new Label(0,0,label1,textfor));
    s.addCell(new Label(1,0,label2,textfor));
    s.addCell(new Label(2,0,label3,textfor));
    s.addCell(new Label(3,0,label4,textfor));
    s.addCell(new Label(4,0,label5,textfor));
    s.addCell(new Label(5,0,label6,textfor));
    s.addCell(new Label(6,0,label7,textfor));
    s.addCell(new Label(7,0,label8,textfor));
    for(int i=1;i<lauditorName.size()+1;i++){
      for(int j=0;j<=7;j++){
        if(j==0){
          
          Number nb=new Number(j,i,i,intnumform);
          s.addCell(nb);
        }
        else if(j==1){
          s.addCell(new Label(j,i,lauditorName.get(i-1)));
        }
        else if(j==2){
          s.addCell(new Label(j,i,lclientName.get(i-1)));
        }
        else if(j==3){
          s.addCell(new Label(j,i,llocationName.get(i-1)));
        }
        else if(j==4){
          s.addCell(new Label(j,i,lstartDate.get(i-1)));
        }
        else if(j==5){
          s.addCell(new Label(j,i,lendDate.get(i-1)));
        }
        else if(j==6){
          s.addCell(new Label(j,i,lshiftName.get(i-1)));
        }
        else if(j==7){
          float f=performancetime.get(i-1);
          Number nb=new Number(j,i,f,numform);
          s.addCell(nb);
        }  
      }
    }
    wb.write();
    wb.close();
  }
  catch(Exception e){
    e.printStackTrace();
  }
  finally{
    if(out!=null){
      out.close();
    }
  }
  }
}
