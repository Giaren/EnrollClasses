<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mvc.util.DBUtil"%>

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
    int i =statement.executeUpdate("DELETE FROM Enrollment WHERE ssn = '"+ssn+"' AND courseId ='"+ Course +"'");
	if (i != 0) {
		%><jsp:include page="Enroll.jsp" flush="true" /><%
	    %><div>Class Dropped</div><%
	} else {
		%><jsp:include page="Enroll.jsp" flush="true" /><%
	     %><div>Class already registered</div><%
	     
	}




}

catch (Exception e) {
}
%>