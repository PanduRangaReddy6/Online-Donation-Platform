<%@ page import="java.sql.*"%>
<%
int cid=Integer.parseInt(request.getParameter("id"));
if(request.getParameter("submit")!=null)
{
    int amount=Integer.parseInt(request.getParameter("amount"));
    String email=session.getAttribute("email").toString();
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
    PreparedStatement pst1=con.prepareStatement("select user_id from users where email=?");

    pst1.setString(1,email);
    ResultSet rs1=
    pst1.executeQuery();
    if(rs1.next())
    {
        int donor_id=rs1.getInt("user_id");
        PreparedStatement pst=con.prepareStatement("insert into donations(donor_id,campaign_id,amount) values(?,?,?)");
        pst.setInt(1,donor_id);
        pst.setInt(2,cid);
        pst.setInt(3,amount);
        pst.executeUpdate();
        out.println("Donation Successful");
    }
    con.close();
}
%>

<html>
<body bgcolor="cyan">
<center>
<h1>Donate</h1>
<form>
Amount :
<input type="text" name="amount">
<input type="hidden" name="id" value="<%=cid%>">
<br><br>
<input type="submit" name="submit" value="Donate">
</form>
</center>
</body>
</html>