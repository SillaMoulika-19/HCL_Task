

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>welcome to online banking</title>
</head>
     <style>
     
     </style>
<body>
     <h1 align="center"><strong>Welcome to fund transfer</strong></h1><br><br>
     <h2 align="center"><font><strong>Transfer Amount Rs.1000 </strong></font></h2>
     <form method="post" action = "transaction.jsp">
        <table align="center" cellpadding="5" cellspacing="5" border="1">
        <tr>
          <td><strong>From A/C</strong></td>
          <td><input type="text" value="6332659812" name="from_account"/></td>
        </tr>
        <tr>
          <td><strong>To A/C</strong></td>
          <td><input type="text" name="to_account"/></td>
        </tr> 
        <tr>
          <td  align="center"><input type="submit" name="Debit" style="width:150px" value="Debit"/></td>
          <td  align="center"><input type="submit" name="Credit" style="width:150px" value="Credit"/></td>
        </tr>
       

        </table>
     </form>
</body>
</html>