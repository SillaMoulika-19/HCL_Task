<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
	String id = request.getParameter("userid");
	String driver = "com.mysql.jdbc.Driver";
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
	//int toAccount=0;
	int availableBal=0;
	connection = DriverManager.getConnection(connectionUrl+database, userid, pass);
	statement=connection.createStatement();
	PreparedStatement pstatement = null;
	String f = request.getParameter("Credit");
	//System.out.println(f);
	if (request.getParameter("Credit") != null) {	
		String Credit = "Credit";
	   	   //toAccount = Integer.parseInt(request.getParameter("to_account"));			 
	   	  // PreparedStatement pstatement = null;
	       int updateQuery = 0;
	       String queryString = "insert into accounttransactions(TransactionType,TransactionAmount) values('"+Credit+"','"+amount+"')";
	       pstatement = connection.prepareStatement(queryString);
	       pstatement.executeUpdate();
	       ResultSet rowcount = null;
	       rowcount =statement.executeQuery("SELECT * FROM TotalAmount");
	       int l=0;
	       if(rowcount!=null)
	       {
	    	   rowcount.last();
	    	   l= rowcount.getRow();
	       }
	       //int l=0;
	      // System.out.println(l);
	        if(l>0)
	       {
	    	   
	    	   String  sql = "select * from TotalAmount";
	           resultSet = statement.executeQuery(sql);
	           while(resultSet.next()){
	   	     availableBal = Integer.parseInt(resultSet.getString("Balance")) + amount ; 
	   	     String queryS= "UPDATE  TotalAmount set Balance='"+availableBal+"'";
	  		 pstatement = connection.prepareStatement(queryS);
	  		 pstatement.executeUpdate();
	  		out.println("<h1>Fund Transferred Successfully!");
	         out.println("<h1>Available balance :" +availableBal);
	       	}
	       }
	       else 
	       {
	    	   queryString="insert into TotalAmount(Balance) values('"+amount+"')";
	    	   pstatement = connection.prepareStatement(queryString);
		       pstatement.executeUpdate();
		       out.println("<h1>Fund Transferred Successfully!");
		         out.println("<h1>Available balance :" +availableBal);
	       }
	}
	      //System.out.println(request.getParameter("Debit"));
	       if (request.getParameter("Debit") != null) {	
	    	   
		   	   //toAccount = Integer.parseInt(request.getParameter("to_account"));			 
		   	   //pstatement = null;
		       //int uQuery = 0;
		       //String queryStrings = "insert into AccountTransactions(TransactionType,TransactionAmount) values('"+"Debit"+"','"+amount+"')";
		       //pstatement = connection.prepareStatement(queryStrings);
		       //updateQuery = pstatement.executeUpdate();
		       //statement.executeQuery("SELECT COUNT(*) INTO rcount FROM TotalAmount");
		       ResultSet rcount =statement.executeQuery("SELECT * FROM TotalAmount");
		       int s= 0;
		       if(rcount!=null)
		       {
		    	   rcount.last();
		    	   s = rcount.getRow();
		       }
		       //System.out.println(s);
		       if(s>0)
		       {
		    	   //int bal=Integer.parseInt(resultSet.getString("Balance"));
		    	   //System.out.println(s);
		    	   String Debit = "Debit";
		    	   //queryString="insert into TotalAmount(Balance) values('"+amount+"')";
		    	   String  sql = "select * from TotalAmount";
		           resultSet = statement.executeQuery(sql);
		           while(resultSet.next()){
		        	   int bal=Integer.parseInt(resultSet.getString("Balance"));
		        	   if(bal==0)
		        	   {
		        		   out.println("<h1>Error, balance is nill!");
		        	   }
		        	   else{
		   	     availableBal = Integer.parseInt(resultSet.getString("Balance")) - amount ; 
		   	     String queryStringDec = "UPDATE  TotalAmount set Balance='"+availableBal+"'";
		  		 pstatement = connection.prepareStatement(queryStringDec);
		  		 pstatement.executeUpdate();
		  		String qString = "insert into accounttransactions(TransactionType,TransactionAmount) values('"+Debit+"','"+amount+"')";
			       pstatement = connection.prepareStatement(qString);
			       pstatement.executeUpdate();
			       out.println("<h1>Fund Transferred Successfully!");
			         out.println("<h1>Available balance :" +availableBal);
		        	   }
		       }
		       }
		       else 
		       {
		    	   out.println("<h1>Error, balance is nill!");
		       }
		       
	   
     %>
      
     <%
	   
	  
	  
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
      
    </tr>
<%
	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, pass);
	statement=connection.createStatement();
	String sql ="select * from accounttransactions order by TransactionId desc limit 5";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		
%>
	<tr>
	  <td><%=resultSet.getString("TransactionId") %></td>
      <td><%=resultSet.getString("TransactionType") %></td>
      <td><%=resultSet.getString("TransactionAmount") %></td>
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