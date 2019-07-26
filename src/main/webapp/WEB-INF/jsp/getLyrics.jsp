<%-- 
    Document   : getLyrics
    Created on : Jul 1, 2019, 7:18:29 PM
    Author     : creoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.4.0.min.js" integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg="
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <style>
            body{

                padding-bottom: 5%;
                margin-left: 30%;
                margin-right: 30%;
                margin-top: 5%}
            #lyrics{background-color: whitesmoke;
               border-radius: 5%;}

            
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
        <h3>ARTIST:</h3>
        <p id ="artist" >${artist}</p>
        <h3>SONG:</h3>
        <p id="title" >${title}</p>
        <div id="lyrics" class="pager"></div>
      <script>
        jQuery(Load);
        function Load($) {
            
                let URL = "https://api.lyrics.ovh/v1/"+$("#artist").html()+"/"+$("#title").html();
                $.ajax({
                    
                    url: URL,
                    success: handleResponse,
                    error: handleError
                });
                
                function handleResponse(data) {
                    console.log(data);
                    $("#lyrics").html(data.lyrics);
                    
                
                }

                function handleError(jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                    $("#lyrics").html("No lyrics found!");
                }
            
        }
        </script>  
    </body>
</html>
