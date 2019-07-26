<%-- 
    Document   : index
    Created on : Jun 23, 2019, 2:11:52 PM
    Author     : creoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div {
                text-align: center;
                display: flex;
                flex-direction: column;
                border: 5px solid green;
                border-radius: 5%;
                padding-bottom: 5%;
                margin-left: 30%;
                margin-right: 30%;
                margin-top: 5%
                
            }
            h1 {
                padding: 50px;
                text-align: center;
                font-size: 35px;
            }
            a:link, a:visited {
                background-color: white;
                color: black;
                border: 2px solid green;
                padding: 20px 40px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                border-radius: 8px;
            }

            a:hover, a:active {
                font-size: 30px;
                background-color: green;
                color: white;
                border-radius: 8px;
            }
            </style>
    </head>
    <body>
        <div>
        <h1>WELCOME TO YOUR MP3 LIBRARY</h1> 
        <h2><a href="${pageContext.request.contextPath}/home">Enter the application</a></h2>
        </div>
        
</body>
</html>
