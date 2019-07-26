<%-- 
    Document   : insertSong2
    Created on : Jul 1, 2019, 11:13:32 PM
    Author     : creoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.4.0.min.js" 
        integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
        <style>

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
            #return{
                display:none;
            }
        </style>
    </head>
    <body>

        <h1>Loading...</h1>
        <h1 id="errorMessage"></h1>
        <div id="return"><a href="${pageContext.request.contextPath}/home">Return</a></div>

        <form:form modelAttribute="song" method="POST" action="${pageContext.request.contextPath}/doinsert2" enctype="multipart/form-data">

            <form:input path="id" name="id" type="hidden"/>
            <table>
                <tr><td>

                    </td><td><form:input  path="title" id="title" type="hidden"/>
                    </td></tr>
                <tr><td></td><td>
                        <form:input   path="artist" id="artist" type="hidden"/>
                    </td></tr>
                <tr><td></td><td>
                        <form:input   path="album" id="album" type="hidden"/>
                    </td></tr>
                    <form:input  path="coverurl" name="cover" id="coverurl" type="hidden"/>
            </table>


        </form:form>

        <script src="coverjs.js"></script>
        <script>
            
            window.setTimeout(function (){ 
            $("#errorMessage").html("No album image found!");
            $("#return").css("display", "inline-block");
            }, 3500);</script> 
    </body>
</html>
