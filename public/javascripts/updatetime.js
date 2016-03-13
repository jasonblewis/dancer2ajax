     $(document).ready(function(){
         $("button").click(function(){
             $.getJSON("api/time.json", function(result){
                 $.each(result, function(i, field){
                     $("#time").text(field);
                 });
             });
         });
     });
