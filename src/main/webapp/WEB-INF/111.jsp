<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
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
<table width="100%"border=1">

<%
	// JDBC 드라이버 로딩
	Class.forName("org.mariadb.jdbc.Driver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mariadb;//localhost:3306/assignment";
		String user = "root";
		String pwd = "1";
		
		String query = "select * from member order by memberName";
		
		// 데이터베이스 커넥션 생성
		conn =  DriverManager.getConnection(jdbcDriver, user, pwd);
		
		// Statement 생성
//		stmt = conn.createStatement();
		
		// 쿼리 실행
//		rs = stmt.executeQuery(query);
		
		while(rs.next()) {
%>
<tr>
			<td><%=rs.getString("NAME")%></td>
			<td><%=rs.getString("MEMBERID")%></td>
			<td><%=rs.getString("EMAIL") %></td>
</tr>

<%			
			
		}		
		
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();		
	} finally {
		// 사용한 Statement 종료
		if (rs != null) try {rs.close();} catch(SQLException ex) {}
//		if (stmt != null) try {stmt.close();} catch(SQLException ex) {}
		
		// 커넥션 종료
		if (conn != null) try {conn.close();} catch(SQLException ex) {}		
	}

%>

</table>

</body>
</html>