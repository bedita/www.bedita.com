$(document).ready(function(){
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    /* image modal */
    $(".img a").on("click", function() {
        var dataImage = $(this).attr('data-href');
        var imageTitle = $(this).attr('title');
        $('#imagepreview').attr('src', dataImage);
        $('.modal-title').html(imageTitle);
        $('#imagemodal').modal('show');
    });
});

    
   