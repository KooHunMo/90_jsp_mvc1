<%@page import="java.sql.DriverManager"%>
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
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		
					try{
					Class.forName("com.mysql.cj.jdbc.Driver");	
					String url = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
					String user    = "root";
					String password  = "1234";
					conn = DriverManager.getConnection(url , user , password);
					
					String sql = "INSERT INTO MEMBER VALUES (?,?,?,NOW())";
					
					
					pstmt = conn.prepareStatement(sql) ;
					pstmt.setString(1,id);
					pstmt.setString(2,passwd);
					pstmt.setString(3,name);
					pstmt.executeUpdate();
	%>
					<script>
						alert("회원가입이 완료되었습니다");
						href.location = "00_main.jsp";
					</script>	
	<% 
					} catch(Exception e) {
						e.printStackTrace();
						
					} finally {
						pstmt.close();
						conn.close();
					}
	%>
</body>
</html>