<%--
  Created by IntelliJ IDEA.
  User: Ivan Minchev
  Date: 10/10/2017
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page import="models.User" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
</head>
<body>
<table width="700px" align="center" border="1">
    <thead>
        <tr>
            <td colspan=5 align="center" style="background-color:teal"><b>Search results</b></td>
        </tr>
        <tr style="background-color:lightgrey">
            <td><b>First Name</b></td>
            <td><b>Last Name</b></td>
            <td><b>DOB</b></td>
            <td><b>Phone Number</b></td>
            <td><b>Email</b></td>
        </tr>
    </thead>
    <tbody>
        <%
            int count = 0;
            String color;
            if (request.getAttribute("users") != null) {
                List<User> usersList = (ArrayList) request.getAttribute("users");
                Iterator itr = usersList.iterator();
                while (itr.hasNext()) {

                    if ((count % 2) == 0) {
                        color = "#eeffee";
                    } else {
                        color = "#F9EBB3";
                    }
                    count++;
                    User user = (User) itr.next();
        %>
        <tr style="background-color:<%=color%>;">
            <td><%=user.getFirstName()%></td>
            <td><%=user.getLastName()%></td>
            <td><%=user.getDob()%></td>
            <td><%=user.getPhoneNumber()%></td>
            <td><%=user.getEmail()%></td>
        </tr>
        <%
                }
            }
            if (count == 0) {
        %>
        <tr>
            <td colspan=5 align="center"
                style="background-color:#eeffee"><b>No Users Found...</b></td>
        </tr>
        <% }
        %>
    </tbody>
</table>
</body>
</html>
