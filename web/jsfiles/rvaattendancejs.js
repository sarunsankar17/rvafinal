/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
   $(document).ready(function() {
   $("#attendsout").click(function(){
     display:true;
    $("#dialog-confirm-signout").dialog({
     //autoOpen:false,
     
      closeOnEscape:true,
      resizable: false,
      height:140,
      modal: true,
      buttons: {
       
        "Sign Out": function() {
          $(this).dialog( "close" );
          /*
          var time=new Date();
          var date=time.getDate();
          if(date<10){
            date="0"+date;
          }
          var mon=time.getMonth()+1;
          if(mon<10){
            mon="0"+mon;
          }
          var year=time.getFullYear();
          var hr=time.getHours();
          if(hr<10){
            hr="0"+hr;
          }
          var min=time.getMinutes();
          if(min<10){
            min="0"+min;
          }
          var sec=time.getSeconds();
          if(sec<10){
            sec="0"+sec;
          }
          var final=year+"-"+mon+"-"+date+" "+hr+":"+min+":"+sec;
          //alert(final);*/
          var final=new Date();
          $.post("supportfiles/attendance/rvaattendance.jsp",{signout:final,process:"signout"},function(data,status){
           $(".rvaattandance").css("display","none"); 
          });
          alert("You have Successfully Signed Out!");
        }
      }
    });
    });
  });

 
  $(document).ready(function() {
    $( "#dialog-confirm" ).dialog({
      closeOnEscape:false,
      resizable: false,
      height:140,
      modal: true,
     
      buttons: {
       
        "Sign In": function() {
          $( this ).dialog( "close" );
          /*
          var time=new Date();
          var date=time.getDate();
          if(date<10){
            date="0"+date;
          }
          var mon=time.getMonth()+1;
          if(mon<10){
            mon="0"+mon;
          }
          var year=time.getFullYear();
          var hr=time.getHours();
          if(hr<10){
            hr="0"+hr;
          }
          var min=time.getMinutes();
          if(min<10){
            min="0"+min;
          }
          var sec=time.getSeconds();
          if(sec<10){
            sec="0"+sec;
          }
          var final=year+"-"+mon+"-"+date+" "+hr+":"+min+":"+sec;
          
          //alert("welcome");*/
          var final=new Date();
          $.post("supportfiles/attendance/rvaattendance.jsp",{signin:final,process:"signin"},function(data,status){
            $(".uname").html(data);
         });
         
        }
      }
    });
  });
  