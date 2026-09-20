<%@ page import="java.sql.*"%>
<%
String role=request.getParameter("t1");
String email=request.getParameter("t2");
String password=request.getParameter("t3");
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/donation","root","pandu2038@D");
    PreparedStatement pst=con.prepareStatement("select * from users where email=? and password=? and role=?");
    pst.setString(1,email);
    pst.setString(2,password);
    pst.setString(3,role);
    ResultSet rs=pst.executeQuery();
    if(rs.next())
    {
        session.setAttribute("email",email);
        if(role.equals("ADMIN"))
        {
            response.sendRedirect("Adminmain.jsp");
        }
        else if(role.equals("DONOR"))
        {
           response.sendRedirect("Donormain.jsp");
        }
        else if(role.equals("NGO"))
        {
            response.sendRedirect("NGOmainPage.jsp");
        }
    }
    else
    {
        out.println("Invalid Login");
    }
}
catch(Exception e)
{
    out.println(e);
}
%>