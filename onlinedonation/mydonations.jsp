<%@ page import="java.sql.*"%>

<html>
<body bgcolor="cyan">

<center>

<h1>My Donations</h1>

<table border="1">

<tr>
<th>Campaign ID</th>
<th>Amount</th>
</tr>

<%
try
{
String email =
session.getAttribute("email").toString();

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con =
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/donation",
"root",
"pandu2038@D");

PreparedStatement pst1 =
con.prepareStatement(
"select user_id from users where email=?");

pst1.setString(1,email);

ResultSet rs1 = pst1.executeQuery();

if(rs1.next())
{
    int donor_id = rs1.getInt("user_id");

    PreparedStatement pst =
    con.prepareStatement(
    "select * from donations where donor_id=?");

    pst.setInt(1,donor_id);

    ResultSet rs = pst.executeQuery();

    while(rs.next())
    {
%>

<tr>
<td><%=rs.getInt("campaign_id")%></td>
<td><%=rs.getBigDecimal("amount")%></td>
</tr>

<%
    }
}

con.close();
}
catch(Exception e)
{
out.println("<h3>"+e+"</h3>");
}
%>

</table>

</center>

</body>
</html>