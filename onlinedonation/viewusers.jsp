<%@ page import="java.sql.*"%>
<html>
<body bgcolor="cyan">
<center>
<h1>Registered Users</h1>
<table border="1">
<tr>
<th>Name</th>
<th>Email</th>
<th>Role</th>
</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users");
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(5)%></td>
</tr>
<%
}
%>
</table>
<br>
<a href="AdminPage.jsp">Back</a>
</center>
</body>
</html>