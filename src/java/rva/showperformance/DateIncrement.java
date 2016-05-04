/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

import java.util.*;
import java.text.SimpleDateFormat;
public class DateIncrement {
  private static int increaseDate=1;
  private static String finalDate=null;
    
  public static String increaseDate(String originalDate){
    try{
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    Calendar calen=Calendar.getInstance();
    calen.setTime(sdf.parse(originalDate));
    calen.add(Calendar.DATE, increaseDate);
    finalDate=sdf.format(calen.getTime());
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return finalDate;
  }
  
}
