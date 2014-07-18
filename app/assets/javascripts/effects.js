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

    if ($('.clock_out:visible').length > 0) {
      clearInterval(window.timer)
      window.elapsed = $('.elapsed-time').data('elapsed')
      $('.elapsed-time').html(moment().hours(0).minutes(0).seconds(elapsed).format('HH:mm:ss'))
      window.timer = setInterval(function() {
        $('.elapsed-time').html(moment().hours(0).minutes(0).seconds(elapsed++).format('HH:mm:ss'))
      }, 1000)
    }
  };

  $(document).ready(function(){
    john.turbolinks();
  });

  $(window).on("resize", function(){
    john.getWindowSize();
    john.sizeContent();
  });

})(jQuery, window);