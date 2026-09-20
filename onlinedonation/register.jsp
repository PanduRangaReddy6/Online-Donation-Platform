<%@ page import="java.sql.*"%>
<%
if(request.getParameter("submit")!=null)
{
String name=request.getParameter("name");
String email=request.getParameter("email");
String pass=request.getParameter("pass");
String role=request.getParameter("role");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
PreparedStatement pst=con.prepareStatement("insert into users(name,email,password,role) values(?,?,?,?)");
pst.setString(1,name);
pst.setString(2,email);
pst.setString(3,pass);
pst.setString(4,role);

pst.executeUpdate();
out.println("<script>");
out.println("alert('Registration Successful');");
out.println("window.location='index.jsp';");
out.println("</script>");
}
catch(Exception e)
{
out.println("<h3>"+e+"</h3>");
}
}
%>

<html>
<body bgcolor="cyan">
<center>
<h1>User Registration</h1>
<form>
<table border="1" bgcolor="pink">
<tr>
<th>Role</th>
<td>
<select name="role">
<option>ADMIN</option>
<option>DONOR</option>
<option>NGO</option>
</select>
</td>
</tr>
<tr>
<th>Name</th>
<td>
<input type="text" name="name">
</td>
</tr>
<tr>
<th>Email</th>
<td>
<input type="text" name="email">
</td>
</tr>
<tr>
<th>Password</th>
<td>
<input type="password" name="pass">
</td>
</tr>
</table>
<br>
<input type="submit"
name="submit"
value="Register">
  
<input type="button"
value="Login"
onclick="window.location='index.jsp'">
</form>
</center>
</body>
</html>