<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
  
  <body>
    <%
    ArrayList<String> lclientName=new ArrayList<String>();
    ArrayList<String> llocationName=new ArrayList<String>();
    ArrayList<String> lauditName=new ArrayList<String>();
    ArrayList<String> lallauditsName=new ArrayList<String>();
    ArrayList<String> lchoiceName=new ArrayList<String>();
    ArrayList<Float> lperformanceTime=new ArrayList<Float>();
    Connection con=DBConnect.startConnection();
    try{
      Statement st=con.createStatement();
     ResultSet res=st.executeQuery("SELECT * from asclients");
     while(res.next()){
       lclientName.add(res.getString("clientsname"));
     }
    Collections.sort(lclientName);
    %>
    <Strong>AS Audits Insert/Update</strong>
    
    <div class="cnamediv" id="cnamediv">
      <header class="cname"><strong>Insert/Update AS Clients:</strong></header>
      <lable>Client Name:</lable>
      <select name="clientname" class="cliname" id="cliname" onchange="cnameSel()">
        <option name="null" value=""></option>
       <% for(int i=0;i<lclientName.size();i++){%>
       <option name="<%=lclientName.get(i)%>" value="<%=lclientName.get(i)%>"><%=lclientName.get(i)%></option>  
          <%}%>
      </select>
      <div class="entervalues" id="entercvalues"></div>
      <input type="button" value="INSERT" id="insertclient" onclick="getInput(this.id)">
      <input type="button" value="UPDATE" id="updateclient" onclick="update(this.id)">
    </div>
      <div class="cnamediv" id="lnamediv">
        <header class="cname"><strong>Insert/Update AS Locations:</strong></header>
      <div class="aslocname" id="aslocname"></div>
    </div>
      
      <div class="anamediv" id="anamediv">
        <header class="cname"><strong>Insert/Update AS Audits:</strong></header>
        <div class="asaudname" id="asaudname"></div>
        <div id="inserthere"></div>
      </div>
     

    <%}
    catch(Exception e){
    e.printStackTrace();
}%>
  </body>
   <head>
    <style>
    .cnamediv{
     width:100%;
     height:100px;
     margin-top:10px;
     background-color: aliceblue;
    }
    .anamediv{
     width:100%;
     min-height: 230px;
     height:max;
     margin-top:10px;
     background-color: aliceblue;
    }
    
   .choicesdiv, .noofstops, .audgroupname, .choandptdet{
      margin:1px 0px 1px 0px;
      border:2px solid #5e5e5e;
    }
    .cname{
      //padding:2px,830px,2px,2px;
      background-color:lightblue;
    }
    input, select, lable{
      //padding:2px;
      margin:4px;
    }
    .entervalues{
      height:25px;
    }
    .allauddet{
      height:max;
    }
    #audgsel{
      //width:200px;
    }
    #choicesandpt label{
      width:70px;
    }
  </style>  
  <script>
    function getInput(id){
      if(id=="insertclient"){
      document.getElementById("cliname").value="";
      document.getElementById("aslocname").innerHTML="";
      document.getElementById("asaudname").innerHTML="";
      document.getElementById("entercvalues").innerHTML="<input type='text' name='clientname' id='inscliname' onkeyup='namecheck()' placeholder='Enter Client Name' required autocomplete='off'><input type='button' id='insclient' name='insclient' onclick='saveclient()' value='SAVE VALUE'> <input type='button' id='ccancel' name='cancel' value='CANCEL' onclick='cancelInsert(this.id)'> ";
    }
    else if(id=="insertlocation"){
      document.getElementById("locname").value="";
      document.getElementById("asaudname").innerHTML="";
      document.getElementById("enterlvalues").innerHTML="<input type='text' name='locationname' id='inslocname' placeholder='Enter Location Name' required autocomplete='off'><input type='button' id='inslocation' name='inslocation' onclick='savelocation()' value='SAVE VALUE'> <input type='button' id='lcancel' name='lcancel' value='CANCEL' onclick='cancelInsert(this.id)'> ";
    }
    else if(id=="insertchoice"){
      document.getElementById("allaudchoices").value="";
      document.getElementById("entercnvalues").innerHTML="<input type='text' name='choicesname' id='inschoicename' placeholder='Enter Choice Name' required autocomplete='off'><input type='button' id='inschoices' name='inschoices' onclick='savechoices()' value='SAVE VALUE'> <input type='button' id='cncancel' name='cncancel' value='CANCEL' onclick='cancelInsert(this.id)'>"
    }
    }
  </script>
  <script>
    function cancelInsert(id){
      //alert(id);
      if(id=="ccancel")
      {
       var x=document.getElementById("cliname").value;
       document.getElementById("inscliname").value=x;
      }
    else if(id=="lcancel"){
      var x=document.getElementById("locname").value;
      document.getElementById("inslocname").value=x;
    }
    }
   </script> 
   <script>
    function saveclient(){
      //var x="";
     var selbcliName=document.getElementById("cliname").value;
     var clientName=document.getElementById("inscliname").value;
     var xmlhttp;
     if((clientName=="")||(clientName.match(/^\s*$/)))
     {
     alert("Please Enter the correct client name");
     }
     else{
       if(window.XMLHttpRequest)
       {
         xmlhttp=new XMLHttpRequest();
       }
       else
       {
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
       } 
      
       if(selbcliName==""){
      xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                      document.getElementById("cnamediv").innerHTML="";
                      document.getElementById("aslocname").innerHTML="";
                      document.getElementById("cnamediv").innerHTML=xmlhttp.responseText;
                      //alert(xmlhttp.responseText);
                    }                 
       }
       xmlhttp.open("GET","supportfiles/adminasaudits/insertupdateasclients.jsp?cliname="+clientName,true);
       xmlhttp.send();      
     }
     else
     {
      xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                      document.getElementById("cnamediv").innerHTML="";
                      document.getElementById("aslocname").innerHTML="";
                      document.getElementById("cnamediv").innerHTML=xmlhttp.responseText;
                    }                              
       }
       xmlhttp.open("GET","supportfiles/adminasaudits/insertupdateasclients.jsp?cliname="+clientName+"&selectcname="+selbcliName,true);
       xmlhttp.send();  
     }
   }
   }
   </script>
   <script>
     function update(id){
       if(id=="updateclient"){
       var x=document.getElementById("cliname").value;
       if(x==""){
       alert("Please Select a Client Name to Update");
     }
     else{
      document.getElementById("inscliname").readOnly=false;
       document.getElementById("insclient").disabled=false;
     }
   }
   else if(id=="updatelocation"){
     var x=document.getElementById("locname").value;
       if(x==""){
       alert("Please Select a Client Name to Update");
     }
     else{
      document.getElementById("inslocname").readOnly=false;
       document.getElementById("inslocation").disabled=false;
     }
   }
     }
   </script>
   <script>
     function cnameSel(){  
    var x=document.getElementById("cliname").value;   
    document.getElementById("entercvalues").innerHTML="<input type='text' name='clientname' id='inscliname' onkeyup='namecheck()' placeholder='Enter Client Name' required autocomplete='off'><input type='button' id='insclient' name='insclient' onclick='saveclient()' value='SAVE VALUE'> <input type='button' id='ccancel' name='cancel' value='CANCEL' onclick='cancelInsert(this.id)'> ";
    document.getElementById("inscliname").value=x;
    document.getElementById("inscliname").readOnly=true;
    document.getElementById("insclient").disabled=true;
    
    if(!(x==""))
          {
            var xmlhttp;
            if(window.XMLHttpRequest)
            {
              xmlhttp=new XMLHttpRequest();
            }
            else
            {
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function() 
            { 
              if(xmlhttp.readyState==4&&xmlhttp.status==200)
              {
                document.getElementById("asaudname").innerHTML="";
                document.getElementById("aslocname").innerHTML=xmlhttp.responseText;
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/aslocations.jsp?cli="+x,true);
              xmlhttp.send();
          }
          else
          {
            document.getElementById("aslocname").innerHTML="";
            document.getElementById("asaudname").innerHTML="";
          }
     }
   </script>
   <script>
     function lnameSel(){
       var x=document.getElementById("locname").value;   
    document.getElementById("enterlvalues").innerHTML="<input type='text' name='locationname' id='inslocname' placeholder='Enter Location Name' required autocomplete='off'><input type='button' id='inslocation' name='inslocation' onclick='savelocation()' value='SAVE VALUE'> <input type='button' id='lcancel' name='lcancel' value='CANCEL' onclick='cancelInsert(this.id)'>";
    document.getElementById("inslocname").value=x;
    document.getElementById("inslocname").readOnly=true;
    document.getElementById("inslocation").disabled=true;
    if(!(x==""))
          {
            var xmlhttp;
            if(window.XMLHttpRequest)
            {
              xmlhttp=new XMLHttpRequest();
            }
            else
            {
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function() 
            { 
              if(xmlhttp.readyState==4&&xmlhttp.status==200)
              {
                document.getElementById("asaudname").innerHTML=xmlhttp.responseText;
              }
            }
              xmlhttp.open("GET","supportfiles/adminasaudits/asallaudits.jsp?loc="+x,true);
              xmlhttp.send();
          }
          else
          {
            document.getElementById("asaudname").innerHTML="";
          }
     }
   </script>
   <script>
     function savelocation(){
     var selblocName=document.getElementById("locname").value;
     var clientName=document.getElementById("cliname").value;
     var locationName=document.getElementById("inslocname").value;
     var xmlhttp;
     if((locationName=="")||(locationName.match(/^\s*$/)))
     {
     alert("Please Enter the correct location name");
     }
     else{
       if(window.XMLHttpRequest)
       {
         xmlhttp=new XMLHttpRequest();
       }
       else
       {
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
       } 
       if(selblocName==""){
      xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                      document.getElementById("lnamediv").innerHTML="";
                     // document.getElementById("aslocname").innerHTML="";
                      document.getElementById("lnamediv").innerHTML=xmlhttp.responseText;
                      //alert(xmlhttp.responseText);
                    }                 
       }
       xmlhttp.open("GET","supportfiles/adminasaudits/insertupdateaslocations.jsp?cliname="+clientName+"&locname="+locationName,true);
       xmlhttp.send();      
     }
     else
     {
      xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                      document.getElementById("lnamediv").innerHTML="";
                      //document.getElementById("aslocname").innerHTML="";
                      document.getElementById("lnamediv").innerHTML=xmlhttp.responseText;
                    }                              
       }
       xmlhttp.open("GET","supportfiles/adminasaudits/insertupdateaslocations.jsp?cliname="+clientName+"&locname="+locationName+"&selblocname="+selblocName,true);
       xmlhttp.send();  
     }
   }
   }
   </script>
   <script>
     function getauditDet(){
      document.getElementById("enteraavalues").innerHTML="<input type='text' name='audiname' id='insaudit' placeholder='Enter Audit Name' readOnly required autocomplete='off'><input type='button' id='insauditbut' name='insauditbut' onclick='saveaudit()' value='SAVE VALUE' disabled> <input type='button' id='acancel' name='cancel' value='CANCEL' onclick='cancelInsert(this.id)'>";

      var x=document.getElementById("audname").value;
      document.getElementById("insaudit").value=x;
       var xmlhttp;
       if(!(x=="")){
          if(window.XMLHttpRequest){
           xmlhttp=new XMLHttpRequest();
         }
         else
         {
           xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
         }
          xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                    document.getElementById("allauddet").innerHTML="";
                                  
                    document.getElementById("allauddet").innerHTML=xmlhttp.responseText;
                    }                 
       }
       xmlhttp.open("GET","supportfiles/adminasaudits/allauditsdetails.jsp?allaudname="+x,true);
       xmlhttp.send();   
       }
       else
       {
         document.getElementById("allauddet").innerHTML="";
       }
     }
   </script>
   <script src="jsfiles/jquerymin.js"></script>
   <script>
     function insertnewaud()
     {
       //document.getElementById("insertaudit").
       document.getElementById("audname").value="";
       document.getElementById("enteraavalues").innerHTML="<input type='text' name='audiname' id='insaudit' placeholder='Enter Audit Name' required autocomplete='off'><input type='button' id='insauditbut' name='insauditbut' onclick='saveaudit()' value='SAVE VALUE' disabled> <input type='button' id='acancel' name='cancel' value='CANCEL' onclick='cancelInsert(this.id)'>";
       document.getElementById("allauddet").innerHTML="";
       
       var xmlhttp;
       if(window.XMLHttpRequest){
           xmlhttp=new XMLHttpRequest();
         }
         else
         {
           xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
         }
          xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                    
                    document.getElementById("allauddet").innerHTML=xmlhttp.responseText;
                    }                 
       }
       xmlhttp.open("GET","supportfiles/adminasaudits/insauddetails.jsp?",true);
       xmlhttp.send(); 
       
     }
   </script>
   <script>
     function audgnSel(){
        var x= document.getElementById("audgsel").value;
        if(x!=""){
        var xmlhttp; 
        
        if(window.XMLHttpRequest){
          xmlhttp=new XMLHttpRequest();
        }
        else{
          xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
        }
        xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                   document.getElementById("enteragvalues").innerHTML="";
                    document.getElementById("insauditbut").disabled=false;
                    document.getElementById("choandptdet").innerHTML=xmlhttp.responseText;
                    }                 
       }
   xmlhttp.open("GET","supportfiles/adminasaudits/asauditsgroupname.jsp?asaudgn="+x,true);
   xmlhttp.send(); 
     }
     else{
     document.getElementById("choandptdet").innerHTML="";
     document.getElementById("insauditbut").disabled=true;
     
     document.getElementById("enteragvalues").innerHTML="";
   }
   }
   
   </script>
   
     <script>
       function insnewchoiceandpt(){
         var xmlhttp;
         if(window.XMLHttpRequest){
           xmlhttp=new XMLHttpRequest();
         }
         else{
           xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
         }
        xmlhttp.onreadystatechange=function(){
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
          {
            var data=xmlhttp.responseText;
           $('.tabchpt tr:last').after(data);
        }
        }
        xmlhttp.open("GET","supportfiles/adminasaudits/inschosandpt.jsp",true);
        xmlhttp.send();
       }
     </script>
     <script>
       function removechoices(){
         var rowcount=$('#tabchpt tr').length;
         //alert(rowcount);
         if(rowcount>1){
         $('#tabchpt tr:last').remove();}
       }
     </script>
     <script>
         function saveauditgroup(){
           
          var audgroupname=document.getElementById("insnewagname").value;  
          var noofchoices=document.getElementById("inpnoofchoices").value;
         // var noofchint=parseInt(noofchoices);
          //alert(noofchint);
         
          var choices=[];
          var perftime=[];    
          var rowcnt=$('#tabchpt tr').length;
          var rcount=rowcnt-1;
          var audgnamesel=document.getElementById("audgsel").value;
          if(audgnamesel==""||audgnamesel==audgroupname){
          if(!audgroupname==""){  
            
              if(noofchoices==rcount){
               
                for(i=0;i<noofchoices;i++){
                  choices[i]=document.getElementsByClassName("allaudchoices")[i].value;
                  perftime[i]=document.getElementsByClassName("performtime")[i].value;
                     if((choices[i]=="")||(perftime[i])==""){
                        
                     var choices=[];
                     i=noofchoices=1;
                     alert("Please Select Choice and Enter the PT");
                    }
                  }
                  if(choices=="")
                  {
                    alert("Choices and PT will not be empty!");
                  }
                  else{
                    var xmlhttp;
                    if(window.XMLHttpRequest){
                      xmlhttp=new XMLHttpRequest();
                    }
                    else{
                      xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
                    }
                     xmlhttp.onreadystatechange=function(){
                       if(xmlhttp.readyState==4&&xmlhttp.status==200)
          {
           document.getElementById("auditgroupdet").innerHTML="";
           document.getElementById("auditgroupdet").innerHTML=xmlhttp.responseText;
        }
        }
        xmlhttp.open("GET","supportfiles/adminasaudits/savenewagname.jsp?agname="+audgroupname+"&audgselname="+audgnamesel+"&noofchoices="+noofchoices+"&chonames="+choices+"&perftimes="+perftime,true);
        xmlhttp.send();
                  }
                  }
                 else
                  {
                    alert("Please enter the no of choices and select choices correctly");
                  }
          }
          else{
            alert("Please Enter the correct audit group name");
          }
        }
        else{
          alert("You cannot update the audit group name! Please Insert new audit group name");
        }
        }
         
         </script>
         <script>
          function savechoices(){
            var xmlhttp;
            var auditgroupname=document.getElementById("audname").value;
            var choicesname=document.getElementById("inschoicename").value;
            alert(choicesname);
            if(window.XMLHttpRequest){
              xmlhttp=new XMLHttpRequest();
            }
            else{
              xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
            }
            xmlhttp.onreadystatechange=function(){
              if(xmlhttp.readyState==4&&xmlhttp.status==200){
                document.getElementById("choandptdet").innerHTML="";
                document.getElementById("audgsel").value="";
                document.getElementById("insnewagname").value="";
                document.getElementById("choandptdet").innerHTML=xmlhttp.responseText;
              }
            }
            xmlhttp.open("GET","supportfiles/adminasaudits/savechoicesname.jsp?agname="+auditgroupname+"&choicesname="+choicesname,true);
            xmlhttp.send();
          }
         </script>
         <script>
           function saveaudit(){
             var auditnamesel=document.getElementById("audname").value;
             var auditname=document.getElementById("insaudit").value;
             var auditsgname=document.getElementById("audgsel").value;
             var noofstops=document.getElementById("inpnoofstops").value;
            // var clientname=document.getElementById("cliname").value;
             var locationname=document.getElementById("locname").value;
             
             if((auditname=="")||(auditsgname=="")||(noofstops=="")){
             alert("Please Insert Audit Name and No of Stops");
           }
         else{
           var xmlhttp;
           if(window.XMLHttpRequest){
             xmlhttp=new XMLHttpRequest();
           }
           else{
             xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
           }
           
           xmlhttp.onreadystatechange=function(){
             if(xmlhttp.readyState==4&&xmlhttp.status==200){
               
               document.getElementById("asaudname").innerHTML="";
               document.getElementById("asaudname").innerHTML=xmlhttp.responseText;
             }
           }
          xmlhttp.open("GET","supportfiles/adminasaudits/savenewauditname.jsp?audnamsel="+auditnamesel+"&auname="+auditname+"&audgname="+auditsgname+"&noofstops="+noofstops+"&locname="+locationname,true);
          xmlhttp.send();
         }
       }
         </script>
         <script>
           function updatenewaud(){
             var allauditname=document.getElementById("audname").value;
             if(!allauditname==""){
               document.getElementById("enteragvalues").innerHTML="<input type='text' name='agname' id='insnewagname' placeholder='Enter Audit Group Name' required autocomplete='off'><input type='button' id='insagname' name='insagname' onclick='saveauditgroup()' value='SAVE VALUE'> <input type='button' id='agcancel' name='cancel' value='CANCEL' onclick='cancelInsert(this.id)'>"
                var audgname=document.getElementById("audgsel").value;
                document.getElementById("insauditbut").disabled=true;
                document.getElementById("insnewagname").value=audgname;
               var noofchoices=document.getElementById("inpnoofchoices").value;
               document.getElementById("insaudit").readOnly=false;
               document.getElementById("inpnoofstops").readOnly=false;
               document.getElementById("audgsel").disabled=false;
               document.getElementById("insnewagnamebut").disabled=false;
               document.getElementById("inpnoofchoices").readOnly=false;
               document.getElementById("insaudchoandpt").disabled=false;
               document.getElementById("removechoices").disabled=false;
               document.getElementById("allaudchoices").disabled=false;
               document.getElementById("insertchoice").disabled=false;
               for(i=0;i<noofchoices+1;i++){
                 document.getElementsByClassName("allaudchoices")[i].disabled=false;
               document.getElementsByClassName("performtime")[i].readOnly=false;
               }
             }
             else{
               alert("Please Select AuditName to Update");
             }
           }
         </script>
         <script>
     function insertnewAGName()
     {
       document.getElementById("audgsel").value="";
       document.getElementById("choandptdet").innerHTML="";
       document.getElementById("enteragvalues").innerHTML="<input type='text' name='agname' id='insnewagname' placeholder='Enter Audit Group Name' required autocomplete='off'><input type='button' id='insagname' name='insagname' onclick='saveauditgroup()' value='SAVE VALUE'> <input type='button' id='agcancel' name='cancel' value='CANCEL' onclick='cancelInsert(this.id)'>"
    document.getElementById("insauditbut").disabled=true;  
    var xmlhttp;
       if(window.XMLHttpRequest){
         xmlhttp=new XMLHttpRequest();
       }
       else{
         xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
       }
       xmlhttp.onreadystatechange=function()
       {
          if(xmlhttp.readyState==4&&xmlhttp.status==200)
                    {
                    document.getElementById("choandptdet").innerHTML=xmlhttp.responseText;
                    }                 
       }
   xmlhttp.open("GET","supportfiles/adminasaudits/insernewtagdet.jsp?",true);
   xmlhttp.send();
       
     }
     </script>
</html>