<%-- 
    Document   : home
    Created on : Jun 23, 2019, 4:37:53 PM
    Author     : creoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.4.0.min.js" 
        integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
         <style>
            th,td{
                   line-height: 200%;
                   text-align: center;
            }
            th{background-color: green;}
            a:link, a:visited {
                background-color: green;
                color: whitesmoke;
                border-radius: 2px;
                padding: 6px 13px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
            }

            a:hover{
               background-color: white; 
               color: green;
               padding: 4px 9px;
               border: 1px solid green;
               border-radius: 5px;
            }
            
        </style>
    </head>
    <body>
        <h1>WELCOME TO YOUR LIBARY FOR MP3 FILES!</h1>
       <table class="table">
            <thead>
            <th></th><th>TITLE</th><th>ALBUM</th><th>ARTIST</th><th>COVER</th><th></th><th></th>
        </thead>
        <tbody>
        <c:forEach items="${songs}" var="i">

            <tr>
                <td><c:out value = "${i.id}"/></td>
            <td ><c:out value = "${i.title}"/></td>
            <td id="album"><c:out value = "${i.album}"/></td>
            <td id="artist"><c:out value = "${i.artist}"/></td>
            <td id="cover"><img src="${i.coverurl}"></td>
            <td><a href="${pageContext.request.contextPath}/downloadSong/${i.id}" download="${i.filename}">DOWNLOAD</a></td>
            <td><a href="${pageContext.request.contextPath}/getLyrics/${i.id}">SHOW LYRICS</a></td>
            </tr>
        </c:forEach>
            </tbody>
    </table>
       <div><a href="${pageContext.request.contextPath}/insert">Upload MP3 File</a></div>
       
        <script>
        
        </script>
    </body>
</html>
