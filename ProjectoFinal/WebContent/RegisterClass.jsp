<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mvc.util.DBUtil"%>
<%@page import="com.mvc.bean.LoginBean"%>


<%

String Course = request.getParameter("course");
String ssn = request.getParameter("SSN");
String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

try{
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection con = null;
Statement statement = null;
ResultSet resultSet = null;

try{ 
	con = DBUtil.createConnection();
    statement = con.createStatement();
	statement=con.createStatement();
	int i =statement.executeUpdate("insert into Enrollment(ssn,courseId,dateRegistered,grade) values('"+ssn+"','"+Course+"','2021-12-09 00:00:00','A')");

%><div>Class enrolled</div><%
%><jsp:include page="Enroll.jsp" flush="true" /><%

}

catch (Exception e) {
	%><div>Class is already in your schedule</div><%
	%><jsp:include page="Enroll.jsp" flush="true" /><%
}
%>