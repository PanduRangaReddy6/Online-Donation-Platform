<%@ page import="java.sql.*"%>
<%
if(request.getParameter("submit")!=null)
{
int id=Integer.parseInt(request.getParameter("id"));
String title=request.getParameter("title");
String desc=request.getParameter("desc");
int goal=Integer.parseInt(request.getParameter("goal"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
PreparedStatement pst=con.prepareStatement("update campaigns set title=?,description=?,goal=? where id=?");
pst.setString(1,title);
pst.setString(2,desc);
pst.setInt(3,goal);
pst.setInt(4,id);
pst.executeUpdate();
out.println("Campaign Updated");
}
%>

<html>
<body bgcolor="cyan">
<center>
<h1>Update Campaign</h1>
<form>
Campaign Id :
<input type="text" name="id">
<br><br>
Title :
<input type="text" name="title">
<br><br>
Description :
<input type="text" name="desc">
<br><br>
Goal :
<input type="text" name="goal">
<br><br>
<input type="submit"
name="submit"
value="Update">
</form>
</center>
</body>
</html>