<%@ page import="java.sql.*"%>
<html>
<body bgcolor="cyan">
<center>
<h1>Donation Report</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select sum(amount) from donations");
if(rs.next())
{
%>
<h2>
Total Donations :
<%=rs.getInt(1)%>
</h2>
<%
}
%>
<br>
<a href="AdminPage.jsp">
Back
</a>
</center>
</body>
</html>