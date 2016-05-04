<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
String auditsloginId=null;
String auditorsname=null;
ArrayList<String> lauditorsloginId=new ArrayList<String>();
ArrayList<String> lauditorsname=new ArrayList<String>();
ArrayList<Integer> loginidrowno=new ArrayList<Integer>();
ArrayList<Integer> lauditorsnamerowno=new ArrayList<Integer>();
ArrayList<String> lallauditorname=new ArrayList<String>();
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT a.`auditorsloginid`,a.`auditorsloginname`,b.auditorsname,a.`auditorsid` FROM `asauditorslogin` as a JOIN auditors as b on a.auditorsid=b.auditorsid");
  while(res.next()){
    loginidrowno.add(res.getInt("a.auditorsloginid"));
    lauditorsnamerowno.add(res.getInt("a.auditorsid"));
    lauditorsloginId.add(res.getString("a.auditorsloginname"));
    lauditorsname.add(res.getString("auditorsname"));
  }
  ResultSet res1=st.executeQuery("SELECT * from auditors");
  while(res1.next()){
    lallauditorname.add(res1.getString("auditorsname"));
  }

%>
<html><body>
    <strong>AS Login Id Insert/Update</strong><br><br>
    <div class="asiddetails">
  <form name="asloginid" id="asloginid" class="asloginid" action="" method="">
    <a id="insasidhref" href="insertnewid.jsp?action=<%="insert"%>" method="post">Add ArrowSight ID</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <a id="insasidhref" href="reassigntid.jsp">Re-Assign Training                                                                                                                                 ID</a>  
     <table id="logidtable" name="logidtable" class="logidtable">
       <tr><th>S.No</th><th>Auditors Login ID</th><th>Auditors Name</th></tr>
<%
    for(int i=0;i<lauditorsloginId.size();i++){
      %>
     
        <tr>
          <td><%=i+1%></td>
          <td>
            
             <label name="auditorsid" id="auditorsid" class="auditorsid">
               <%=lauditorsloginId.get(i)%></label>
          </td>
          <td>
           
              <label name="auditorsname" id="auditorsname" class="auditorsname">
                <%=lauditorsname.get(i)%></label>
              
          </td>
         <!-- <td><a id="updlink" href="insertnewid.jsp?action=<%="changeassignedid"%>&asauditorsrowno=<%=loginidrowno.get(i)%>">Assign to Another</a></td>-->
        </tr>
     
    
    <%
    }
  %>
   </table>
  </form>
    </div>
  </body>
    <%
}
catch(Exception e){
  e.printStackTrace();
}

%>
<script>
  function insertnewId(){
 document.getElementById("entervalues").style.visibility="visible"; 
  }
</script>
<script src="jsfiles/jquerymin.js"></script>
<script>
  function saveid(){
    var x=document.getElementById("newasid").value;
  }
</script>
<script>
  $(document).ready(function(){
    //alert("serialize");
    $("#saveid").click(function(){
      var data=$("form").serialize();
      alert(data);
    });
  }); 
</script>
<style>
  #entervalues{
    visibility:hidden;
  }
  #serdata{
    width:auto;
    height:auto;
  }
 .entervalues{
    margin:2px;
  }
  #newasid, #saveid{
    margin:2px;
  }
        table, tr, th, td{
            border:1px solid #fff;
            border-collapse: collapse;
        }
        table{
            width:99%;
            margin:2px 2px 5px 2px;
        }
        th
        {
            background-color: lightblue;
        }
        td,th{
            margin:2px;
        }
        tr:nth-child(odd){
            background-color : aliceblue;
        }
        tr:nth-child(even){
            background-color : ffffff;
        }
        #insasidhref{
          color: #000;
          width:100px;
          height: 3px;
          background-color: darkgray; 
        }
        #updlink{
          color: #449d44;
          text-decoration: underline;
        }
        .asiddetails{
          //height: 1000px;
          width:100%;
          //overflow-x: scroll;
          //  overflow-y: scroll;    
        }
    </style>
</html>