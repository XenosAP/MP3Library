<%-- 
    Document   : insertSong
    Created on : Jun 23, 2019, 6:44:41 PM
    Author     : creoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="${pageContext.request.contextPath}/doinsert1" method="POST" enctype="multipart/form-data">
        <input type="file" name="myfile" >
         <input type="submit">
       </form>
    </body>
</html>
