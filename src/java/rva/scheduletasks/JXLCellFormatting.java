/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.scheduletasks;
import java.util.Date;
import jxl.*;
import jxl.format.Alignment;
import jxl.format.UnderlineStyle;
import jxl.write.DateFormat;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.Number;
import jxl.write.DateTime;
import jxl.write.WriteException;
import rva.administrator.ChangeDateFormat;
/**
 *
 * @author RCT-456
 */
public class JXLCellFormatting {
 WritableCellFormat wcf=null;
 WritableFont wc=null;
 Number nb=null;
  Date date=new Date();
  public WritableCellFormat getHeadFormat() throws WriteException{
     wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE);
   wcf=new WritableCellFormat(wc);
    wcf.setAlignment(Alignment.CENTRE);
    return wcf;
  }
  public DateTime getDTFormat(int c,int r,String val) throws WriteException{
     wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
  wcf=new WritableCellFormat(wc,new DateFormat("MM/dd/yyyy HH:mm:ss"));
 wcf.setAlignment(Alignment.RIGHT);
 date=new ChangeDateFormat().toRepDateTime(val);
 DateTime d=new DateTime(c,r,date,wcf);
    return d;
  }
  public WritableCellFormat getTimeFormat() throws WriteException{
     wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
   
    wcf=new WritableCellFormat(wc,new DateFormat("HH:mm:ss"));
    wcf.setAlignment(Alignment.RIGHT);
    return wcf;
  }
  public Number getIntNumFormat(int c,int r,int val) throws WriteException{
     wcf=new WritableCellFormat(new NumberFormat("0"));
     wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);    
    wcf.setAlignment(Alignment.RIGHT);
     nb=new Number(c,r,val,wcf);
    return nb;
  }
  public Number getIntBNumFormat(int c,int r,int val) throws WriteException{
     wcf=new WritableCellFormat(new NumberFormat("0"));
     wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE);    
    wcf.setAlignment(Alignment.RIGHT);
     nb=new Number(c,r,val,wcf);
    return nb;
  }
  public Number getFPNumFormat(int c,int r,float val) throws WriteException{
   wcf=new WritableCellFormat(new NumberFormat("0.00"));
   wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);    
  wcf.setAlignment(Alignment.RIGHT);
   nb=new Number(c,r,val,wcf);
  return nb;
  }
  public Number getFPBNumFormat(int c,int r,float val) throws WriteException{
   wcf=new WritableCellFormat(new NumberFormat("0.00"));
   wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE);    
  wcf.setAlignment(Alignment.RIGHT);
   nb=new Number(c,r,val,wcf);
  return nb;
  }
  public WritableCellFormat getTitleFormat(){
     wc=new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD,false);
    wcf=new WritableCellFormat(wc);
    return wcf;
  }
  public WritableCellFormat getNameFormat() throws WriteException{
     wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
      wcf=new WritableCellFormat(wc);
    wcf.setAlignment(Alignment.LEFT);
    return wcf;
  }
  public WritableCellFormat getlabelFormat() throws WriteException{
     wc=new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
      wcf=new WritableCellFormat(wc);
    wcf.setAlignment(Alignment.RIGHT);
    return wcf;
  }
}
