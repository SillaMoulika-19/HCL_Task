<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
	String id = request.getParameter("userid");
	String driver = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "mysql";
	String userid = "root";
	String pass = "root";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	int amount=1000;
	int toAccount=0;
	int availableBal=0;
	connection = DriverManager.getConnection(connectionUrl+database, userid, pass);
	statement=connection.createStatement();
	if (request.getParameter("submit") != null) {	
	   	   toAccount = Integer.parseInt(request.getParameter("to_account"));			 
	   	   PreparedStatement pstatement = null;
	       int updateQuery = 0;
	       String queryString = "insert into account_transactions(amount,to_account) values('"+amount+"','"+toAccount+"')";
	       pstatement = connection.prepareStatement(queryString);
	       updateQuery = pstatement.executeUpdate();
	   if (updateQuery > 0)
	   { 
	     String  sql = "select * from account_details where Account_num= 32023568";
         resultSet = statement.executeQuery(sql);
         while(resultSet.next()){
 	     availableBal = Integer.parseInt(resultSet.getString("balance")) - amount ; 
 	     String queryStringDec = "UPDATE  account_details set balance='"+availableBal+"' where Account_num=32023568";
		 pstatement = connection.prepareStatement(queryStringDec);
		 updateQuery = pstatement.executeUpdate();
	     }
         out.println("<h1>Fund Transferred Successfully!");
         out.println("<h1>Available balance :" +availableBal);
     %>
      
     <%
	   }
	   else 
	   {
		  out.println("<h1>Error, Not Sent!");
	   }
	  
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transactions</title>
</head>
<body>
	<h1>The last five Transactions : </h1>
	<table border="1">
	<tr>
	  <td>Transaction ID</td>
      <td>Date of Transaction</td>
      <td>Amount</td>
      <td>Account Number</td>
    </tr>
<%
	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, pass);
	statement=connection.createStatement();
	String sql ="select * from account_transactions order by transaction_id desc limit 5";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>
	<tr>
	  <td><%=resultSet.getString("transaction_id") %></td>
      <td><%=resultSet.getString("transaction_date") %></td>
      <td><%=resultSet.getString("amount") %></td>
      <td><%=resultSet.getString("to_account") %></td>
    </tr>
<%
    }
    connection.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
%>
</table>
</body>
</html>
