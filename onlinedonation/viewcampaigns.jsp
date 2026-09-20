<%@ page import="java.sql.*"%>
<html>
<body bgcolor="cyan">
<center>
<h1>Campaigns</h1>
<table border="1">
<tr>
<th>ID</th>
<th>Title</th>
<th>Description</th>
<th>Goal</th>
<th>Donate</th>
</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from campaigns");
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getInt(4)%></td>
<td>
<a href="donate.jsp?id=<%=rs.getInt(1)%>">
Donate
</a>
</td>
</tr>
<%
}
%>
</table>
</center>
</body>
</html>