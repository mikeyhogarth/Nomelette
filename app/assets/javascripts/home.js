$(window).load(function(){

function imageCarousel() {

  var carousel =  $('#carousel');

  var width = $(window).width();
  if(width <=480) {
     var maxNum = 1
  }
else {
  var maxNum = 5
}
    

    carousel.carouFredSel({
    auto: true,
    responsive: true,
    height : 'auto',
    scroll: {
      items : 1,
      pauseOnHover : true
    },
     swipe: {
        onTouch: true,
        items: 3
    },
    items : {
      visible     : {
        min    : 1,
        max    : maxNum
      },
      width       : 200
    },
    onCreate : function () {
          var maxHeight = -1;
          carousel.children().each(function() {
              maxHeight = maxHeight > $(this).height() ? maxHeight : $(this).height();
          });

          /* carousel.children().each(function() {
              $(this).height(maxHeight);
          });*/

           //alert(maxHeight);
          carousel.parent().add(carousel).css('height', maxHeight + 30 + 'px');
        }

  });

    

   $("#prev").on("click", function(){
    $("#carousel").trigger("prev");
  });
  $("#next").on("click", function(){
    $("#carousel").trigger("next");
  });

};

  var resizeTimer;

  $(window).resize(function() {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(imageCarousel, 1);
  }).resize();

});
