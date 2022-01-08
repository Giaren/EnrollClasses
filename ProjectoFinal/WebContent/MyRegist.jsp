<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mvc.bean.LoginBean"%>
<%@page import="com.mvc.util.DBUtil"%>


<%
String ssn = request.getParameter("SSN");
String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Students Courses</strong></font></h2>

<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>CourseId</b></td>
<td><b>DateRegistered</b></td>
<td><b>Grade</b></td>
</tr>
<%
try{ 
	con = DBUtil.createConnection();
    statement = con.createStatement();
	String sql ="SELECT Students.firstName, Students.lastName,Students.phone, Enrollment.courseId,Enrollment.dateRegistered,Enrollment.grade FROM Enrollment INNER JOIN Students ON Students.ssn=Enrollment.ssn Where Enrollment.ssn="+ssn+"AND Students.ssn="+ssn;

	resultSet = statement.executeQuery(sql);

	
while(resultSet.next()){
	%>
	
	<tr bgcolor="#DEB887">

	<td><%=resultSet.getString("courseId") %></td>
	<td><%=resultSet.getString("dateRegistered") %></td>
	<td><%=resultSet.getString("grade") %></td>                         
	</tr>
	
	<% 
}
	
	%>
	<tr bgcolor="#DEB887">
	<td colspan="3" align="Center">
	<form method="post" action="RegisLogin.jsp">
    	<input type="submit" value="Exit" />
    </form>
    <form method="get" action=Enroll.jsp>
    	<input type="hidden" name="SSN" value=<%=ssn%> />
    	<input type="submit" value="Enroll" />
    </form>
    </td>
	</tr>
<% 
}

catch (Exception e) {
e.printStackTrace();
}
%>

</table>