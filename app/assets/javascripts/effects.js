(function($, window, undefined){

  var john = {}
  var windowHeight, windowWidth = 0

  john.getWindowSize = function() {
    windowHeight = $(window).height();
    windowWidth = $(window).width();
  };

  john.sizeContent = function() {
  };

  john.turbolinks = function() {
    john.getWindowSize();
    john.sizeContent();

    $('.ajax .close').click(function() {
      $('.ajax').velocity('transition.slideUpOut', 400);
    })
  };

  $(document).ready(function(){
    john.turbolinks();
  });

  $(window).on("resize", function(){
    john.getWindowSize();
    john.sizeContent();
  });

})(jQuery, window);