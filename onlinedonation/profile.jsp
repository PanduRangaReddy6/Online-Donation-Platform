<%@ page import="java.sql.*"%>
<html>
<body bgcolor="cyan">
<center>
<h1>My Profile</h1>
<table border="1">
<%
String email=session.getAttribute("email").toString();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
PreparedStatement pst=con.prepareStatement("select * from users where email=?");
pst.setString(1,email);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
%>

<tr>
<th>Name</th>
<td><%=rs.getString(1)%></td>
</tr>
<tr>
<th>Email</th>
<td><%=rs.getString(2)%></td>
</tr>
<tr>
<th>Role</th>
<td><%=rs.getString(4)%></td>
</tr>
<%
}
%>
</table>
</center>
</body>
</html>