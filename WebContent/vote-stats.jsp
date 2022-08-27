<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="edu.npu.votingsystem.database.VotingBin" %>
<%@page import="java.util.List" %>
<%@page import="edu.npu.votingsystem.domain.Vote" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles/style.css" />
<title>Voting System</title>
<%
		String userName = null;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
			for(Cookie cookie : cookies){
			    if(cookie.getName().equals("username"))
			    	userName = cookie.getValue();
			}
		}
		if(userName == null)
			response.sendRedirect("login.jsp");
	%>
</head>
<body>
	<div id="page">
		<div id="header">
			<div id="section">
				<div
					style="text-align: center; color: white; margin: 0px 0 0px 324px;">
					<h1><b>Online Voting System<b></h1>
					<h3>A project by Shivam Singh</h3>
				</div>
			</div>
			<ul>
				<li><a href="index.jsp">Project Description</a></li>
				<li><a href="vote.jsp">Vote Here</a></li>
				<li class="current"><a href="vote-stats.jsp">Voting
						Statistics</a></li>
				<li><a href="contact.jsp">Contact us</a></li>
				<li><a href="JasonServlet">Web Service</a></li>
				<li><a href="logoutServlet">Logout</a></li>
				<li><a class="welcome"><b>Welcome! <%=userName %></b></a></li>
			</ul>
			<%
				VotingBin vb = new VotingBin();
				int bjpCount=0, congressCount=0, aapCount=0;
				List<Vote> list = vb.displayVotingStatistics();
				for(Vote v:list) {
					bjpCount = v.getJavaCount();
					congressCount = v.getDotnetCount();
					aapCount = v.getPythonCount();
				}
			%>
			<div id="tagline">
				<div>
					<h2 style="margin: 0px 0px 0px 300px;">Total number of Votes
						registered!</h2>
					<div style="padding: 0px 0px 21px 0;">
						<center>
							<table cellspacing=0 cellpadding="10">
								<tr>
									<td align=left style="color: #295071">BJP:</td>
									<td><input type="text" id="BJP" value="<%=bjpCount%>" name="BJP" size="10"
										disabled="disabled"></td>
								</tr>
								<tr>
									<td align=left style="color: #295071">CONGRESS:</td>
									<td><input type="text" id="CONGRESS" value="<%=congressCount%>" name="CONGRESS" size="10"
										disabled="disabled"></td>
								</tr>
								<tr>
									<td align=left style="color: #295071">AAP:</td>
									<td><input type="text" id="AAP" value="<%=aapCount%>" name="APP" size="10"
										disabled="disabled"></td>
								</tr>
							</table>
						</center>
					</div>
				</div>
			</div>
			<div id="footer">
				<div>
					<div class="section">
						<p style="text-align: center;">Copyright &copy; Shivam Singh,
							ID: ###### - All Rights Reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>