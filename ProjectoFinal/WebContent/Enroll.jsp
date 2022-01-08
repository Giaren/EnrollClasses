<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mvc.bean.LoginBean"%>

<%@page import="com.mvc.util.DBUtil"%>

<%
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
%>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>CourseId</b></td>
</tr>
<%
try{ 
	con = DBUtil.createConnection();
    statement = con.createStatement();
	String sql ="SELECT courseID FROM Course";

	resultSet = statement.executeQuery(sql);
%>
<tr>
	<td>
<form name = "EnrollDrop" action ="RegisterClass.jsp" method="post" >

<select name="course">
<%
while(resultSet.next()){
	%>
	<% String Course = resultSet.getString("courseID"); %>
		<option value="<%=Course%>" ><%=Course%></option>
	<%
	}
%></select>

<input type="submit" name="Enroll" value="Enroll class"/>
<input type="hidden" name="SSN" value=<%=ssn%> />
<script>
function Choice() {
	    document.EnrollDrop.action = "Drop.jsp";

}</script>
<input type="submit" name="Drop" value="Drop class" onclick = "Choice()"/>
<input type="hidden" name="SSN" value=<%=ssn%> />
</form>

<form method="post" action="MyRegist.jsp">
<input type="hidden" name="SSN" value=<%=ssn%> />
<input type="submit" name="Exit" value="Exit"/>
</form>
</td></tr>
<%
}

catch (Exception e) {
e.printStackTrace();
}
%>

</table>