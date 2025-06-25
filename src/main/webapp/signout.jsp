<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- IT23600652 Isiwara Wijesinghe -->   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    String confirm = request.getParameter("confirm");
    if ("true".equals(confirm)) {
        session.invalidate();
        response.sendRedirect("signin.jsp");
    } else {
        session.invalidate();

        response.sendRedirect("signin.jsp"); // or whatever your default page is

    }
%>

</body>
</html>