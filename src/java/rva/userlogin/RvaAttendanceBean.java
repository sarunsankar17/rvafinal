/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;

/**
 *
 * @author RCT-456
 */
public class RvaAttendanceBean {
  private int profileId;
  private String loginDate;
  private String status;
  public void setprofileId(int profileId){
    this.profileId=profileId;
  }
  public void setloginDate(String loginDate){
    this.loginDate=loginDate;
  }
  public void setStatus(String status){
    this.status=status;
  }
  public int getprofileId(){
    return profileId;
  }
  public String getloginDate(){
    return loginDate;
  }
  public String getStatus(){
    return status;
  }
}

