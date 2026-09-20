<%@ page import="java.sql.*"%>
<html>
<body bgcolor="cyan">
<center>
<h1>All Donations</h1>
<table border="1">
<tr>
<th>Donor</th>
<th>Campaign</th>
<th>Amount</th>
</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from donations");
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(2)%></td>
<td><%=rs.getInt(3)%></td>
<td><%=rs.getInt(4)%></td>
</tr>

<%
}
%>
</table>
</center>
</body>
</html>