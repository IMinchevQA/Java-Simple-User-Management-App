<%--
  Created by IntelliJ IDEA.
  User: Ivan Minchev
  Date: 10/9/2017
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" href="css/style.css">
    <title>Add new user</title>
</head>
<body>
<script>
    $(function() {
        $('input[name=dob]').datepicker();
    });
</script>

<form method="POST" action='UserController' name="frmAddUser">
    <label for="userid">User ID : </label>
    <input id="userid"
           type="text" readonly="readonly" name="userid"
           value="<c:out value="${user.userid}" />" />
    <br/>
    <label for="firstName">First Name : </label>
    <input
        id="firstName"
        type="text" name="firstName"
        value="<c:out value="${user.firstName}" />" />
    <br/>
    <label for="lastName">Last Name : </label>
    <input
        id="lastName" type="text" name="lastName"
        value="<c:out value="${user.lastName}" />" />
    <br/>
    <label for="dob">DOB : </label>
    <input
        id="dob" type="text" name="dob"
        value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" />
    <br/>
    <label for="phonenumber">Phone Number : </label>
    <input
        id="phonenumber" type="text" name="phonenumber"
        value="<c:out value="${user.phoneNumber}" />" />
    <br/>
    <label for="email">Email : </label>
    <input
        id="email" type="text" name="email"
        value="<c:out value="${user.email}" />" />
    <br/>

    <input class="add" type="submit" value="Submit" />
</form>
</body>
</html>
