<html>
  <head>
    <script src="jsfiles/jquedp.js"></script>
    <script src="jsfiles/jquedpui.js"></script>
    <link rel="stylesheet" href="cssfiles/stydp.css">
    <style>
      .ui-datepicker-calendar{
        display:none;
      }
    </style>
  <script>
    $(document).ready(function () {
   $('#date').datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'MM/yy',
    minDate:new Date(2014,00),
    maxDate:new Date(),
    onClose: function () {
      var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
      var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
      $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
     $(this).datepicker('refresh');
    },
    beforeShow: function () {
     if ((selDate = $(this).val()).length > 0)
      {
        iYear = selDate.substring(selDate.length - 4, selDate.length);
        iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
        $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
       $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
      }
    }
  });
   $("#date").focus(function () {
      $(".ui-datepicker-calendar").hide();
      $("#ui-datepicker-div").position({
          my: "center top",
          at: "center bottom",
          of: $(this)
      });
   });
   $("#date").blur(function () {
     $(".ui-datepicker-calendar").hide();
   });
});
  </script>
    </head>
  <body>
    <strong>AS Billing Hours</strong>
    <form action="ASBillingHours" method="POST">
    <table>
      <tr><td><label>Billing Month:</label></td><td><input type="text" id="date" required autocomplete="off" name="date"></td></tr>
      <tr><td><label>Billing Hours:</label></td><td><input type="number" step="any" id="billinghours" required autocomplete="off" name="billinghours"></td></tr>
      <tr><td align="center" colspan="2"><input type="submit" value="SUBMIT"></td></tr>
    </table>
    </form>
  </body>
</html>
