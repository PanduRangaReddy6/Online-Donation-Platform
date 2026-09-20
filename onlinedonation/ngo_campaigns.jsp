<%@ page import="java.sql.*"%>

<html>
<body bgcolor="cyan">
<center>
<h1>My Campaigns</h1>
<table border="1">
<tr>
<th>ID</th>
<th>Title</th>
<th>Description</th>
<th>Goal</th>
</tr>

<%
String email=session.getAttribute("email").toString();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
PreparedStatement pst=con.prepareStatement("select * from campaigns where ngoemail=?");
pst.setString(1,email);
ResultSet rs=pst.executeQuery();
while(rs.next())
{
%>

<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getInt(4)%></td>
</tr>
<%
}
%>
</table>
</center>
</body>
</html>