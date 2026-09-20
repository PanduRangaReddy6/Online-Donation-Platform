<html>
<body bgcolor="cyan" text="black">
<form action="verify.jsp">
<center>
<h1>Online Donation Platform</h1>
<table border="1" bgcolor="pink">
<tr>
<th>User Type</th>
<td>
<select name="t1">
<option>---Select---</option>
<option>ADMIN</option>
<option>DONOR</option>
<option>NGO</option>
</select>
</td>
</tr>
<tr>
<th>Email</th>
<td>
<input type="text" name="t2">
</td>
</tr>
<tr>
<th>Password</th>
<td>
<input type="password" name="t3">
</td>
</tr>
</table>
<br>
<input type="submit" value="Login">
<input type="button"
value="Register"
onclick="window.location='register.jsp'">
<br><br><br>
<a href="about.jsp">About Us</a>
<br><br>
</center>
</form>
</body>
</html>