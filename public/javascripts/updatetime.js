     $(document).ready(function(){
         $("button").click(function(){
             $.getJSON("time", function(result){
                 $.each(result, function(i, field){
                     $("#time").text(field);
                 });
             });
         });
     });
