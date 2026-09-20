<%@ page import="java.sql.*"%>

<html>
<body bgcolor="cyan">
<center>
<h1>Donation Details</h1>
<table border="1">
<tr>
<th>Donor</th>
<th>Campaign</th>
<th>Amount</th>
</tr>

<%
String email=session.getAttribute("email").toString();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
PreparedStatement pst=con.prepareStatement("select d.* from donations d,campaigns c where d.campaignid=c.id and c.ngoemail=?");
pst.setString(1,email);
ResultSet rs=pst.executeQuery();
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