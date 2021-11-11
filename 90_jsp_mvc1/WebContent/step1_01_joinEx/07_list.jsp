<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");	
		
		String url      = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
		String user     = "root";
		String password = "1234";
		
		conn = DriverManager.getConnection(url , user , password);
		
		pstmt = conn.prepareStatement("SELECT * FROM MEMBER");
		rs = pstmt.executeQuery();
%>
		<h2>회원리스트</h2>
		<table border="1">
			<tr>
			<td>ID</td>
			<td>PASSWORD</td>
			<td>NAME</td>
			<td>JOIN_DATE</td>
			</tr>
<%
		while(rs.next()){
			
			String id = rs.getString("ID");
			String passwd = rs.getString("PASSWD");
			String name = rs.getString("NAME");
			String joinDate = rs.getString("JOIN_DATE");
%>

			<tr align="center">
				<td><%=id %></td>
				<td><%=passwd %></td>
				<td><%=name %></td>
				<td><%=joinDate %></td>
			</tr>
<%
		}
%>
		</table>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
	
	
%>
</body>
</html>