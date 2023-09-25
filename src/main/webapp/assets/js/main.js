$('#btnCadastrar').on('click', function () {
    $('#modalCadastrar').modal("show");
})

$(".menu.flex").on("click", function() {
    $(".header").toggleClass("opened");
    $("body, html").toggleClass("menu-open")
})

// Menu fixo estilo Odebrecht
$(window).scroll(function(){
    if (jQuery(this).scrollTop() > 135){
      jQuery(".header").addClass('fixo');
    }
    else{
      jQuery(".header").removeClass('fixo');
    }
});
// Carrousel
$('.carouselcar').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:2
        },
        1280:{
            items:3
        }
    }
})