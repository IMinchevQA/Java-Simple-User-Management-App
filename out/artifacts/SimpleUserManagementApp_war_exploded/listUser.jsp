<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Ivan Minchev
  Date: 10/9/2017
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" href="css/style.css">
    <title>Show All Users</title>
</head>
<body>
<form method="POST" name="searchForm" action="Search">
    <label for="search">Search By Name : </label>
    <input id="search" type="text" name="search">
    <input type="submit" name="submit" value="Search" />
</form>
<br/>
<table width="700px" border="1">
    <thead>
    <tr>
        <td colspan=8 align="center" style="background-color:teal"><b>All Users</b></td>
    </tr>
    <tr style="background-color:lightgrey">
        <th>User Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>DOB</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th colspan=2>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        int count = 0;
        String color = "#F9EBB3";
        if (request.getAttribute("users") != null) {
            List<User> usersList = (ArrayList) request.getAttribute("users");
            Iterator itr = usersList.iterator();
            while(itr.hasNext()) {
                if ((count % 2) == 0) {
                    color = "#eeffee";
                } else {
                    color = "#F9EBB3";
                }
                count++;
                User user = (User) itr.next();
    %>
    <tr style="background-color:<%=color%>;">
        <td><%=user.getUserid()%></td>
        <td><%=user.getFirstName()%></td>
        <td><%=user.getLastName()%></td>
        <td><%=user.getDob()%></td>
        <td><%=user.getPhoneNumber()%></td>
        <td><%=user.getEmail()%></td>
        <td><a href="UserController?action=edit&userId=<%=user.getUserid()%>">Update</a></td>
        <td><a href="UserController?action=delete&userId=<%=user.getUserid()%>">Delete</a></td>
    </tr>
    <%
            }
        }
        if (count == 0) {
    %>
    <tr>
        <td colspan=4 align="center"
            style="background-color:#eeffee"><b>No Record Found..</b></td>
    </tr>
    <% }
    %>
    </tbody>
</table>
  <p>
    <a class="sort" href="UserController?action=sortByLastName">Sort by Last Name</a>&nbsp &nbsp &nbsp
    <a class="sort" href="UserController?action=sortByDate">Sort by Date</a>
  </p>

  <p><a class="add" href="UserController?action=insert">Add User</a></p>
</body>
</html>