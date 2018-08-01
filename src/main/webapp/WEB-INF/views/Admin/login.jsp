<%--
  Created by IntelliJ IDEA.
  User: TingBin
  Date: 2018/8/1
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<p>${requestScope.message}</p>
    <form action="/admin/login.html" method="post">
        用户名:<input name="username" type="text" value="admin">
        密码:<input name="password" type="text" value="123456">
        <input type="submit" value="登录">
    </form>
</body>
</html>
