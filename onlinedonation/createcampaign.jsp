<%@ page import="java.sql.*" %>
<%
if(request.getParameter("submit")!=null)
{
    String title=request.getParameter("title");
    String desc=request.getParameter("desc");
    int goal_amount=Integer.parseInt(request.getParameter("goal"));
    int ngo_id=Integer.parseInt(request.getParameter("ngoid"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
    PreparedStatement check=con.prepareStatement("SELECT ngo_id FROM ngos WHERE ngo_id=?");
    check.setInt(1,ngo_id);
    ResultSet rs=check.executeQuery();
    if(rs.next())
    {
        PreparedStatement pst=con.prepareStatement("INSERT INTO campaigns(title,description,goal_amount,ngo_id) VALUES(?,?,?,?)");
        pst.setString(1,title);
        pst.setString(2,desc);
        pst.setInt(3,goal_amount);
        pst.setInt(4,ngo_id);
        pst.executeUpdate();
        out.println("<h3 style='color:green'>Campaign Created Successfully</h3>");
    }
    else
    {
        out.println("<h3 style='color:red'>Invalid NGO ID</h3>");
    }
    con.close();
}
%>

<html>
<body bgcolor="cyan">
<center>
<h1>Create Campaign</h1>
<form method="post">
Title :
<input type="text" name="title" required>
<br><br>
Description :
<input type="text" name="desc" required>
<br><br>
Goal :
<input type="number" name="goal" required>
<br><br>
NGO ID :
<input type="number" name="ngoid" required>
<br><br>
<input type="submit" name="submit" value="Create">
</form>
</center>
</body>
</html>