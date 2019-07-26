/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

        jQuery(Load);
        function Load($) {
                let URL = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=8fd1d3b7f5f5fa9f67afc06d7d1218a3&artist="+$("#artist").val()+"&album="+$("#album").val()+"&format=json";
                $.ajax({
                    
                    url: URL,
                    success: handleResponse,
                    error: handleError
                });
                
                function handleResponse(data) {
                    
                    console.log(data);
                    $("#coverurl").val(data.album.image[1]['#text']);
                    $("form").submit();
                }

                function handleError(jqXHR, textStatus, errorThrown,) {
                    console.log(textStatus, errorThrown);
                }
                
                
               
            
        }
        
