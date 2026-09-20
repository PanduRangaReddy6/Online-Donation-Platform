<%@ page import="java.sql.*"%>
<%
if(request.getParameter("submit")!=null)
{
String email=session.getAttribute("email").toString();
String np=request.getParameter("np");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
PreparedStatement pst=con.prepareStatement("update users set password=? where email=?");
pst.setString(1,np);
pst.setString(2,email);
pst.executeUpdate();
out.println("Password Changed");
}
%>

<html>
<body bgcolor="cyan">
<center>
<h1>Change Password</h1>
<form>
New Password :
<input type="password" name="np">
<br><br>
<input type="submit"
name="submit"
value="Change">
</form>
</center>
</body>
</html>