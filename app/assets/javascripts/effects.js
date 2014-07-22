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
      window.timer = setInterval(function() {
        $.ajax({
          url: "/time_logs/" + $('.elapsed-time').data('id') + "/get_time",
          type: 'GET',
          dataType: 'json',
          success: function(data) {
            $('.elapsed-time').text(data['display_duration']);
          }
        });
      }, 500)
    }
  };

  $(document).ready(function(){
    john.turbolinks();
  });

  $(document).on('page:before-change', function(){
    $('body').velocity('transition.fadeOut', 400)
  });

  $(document).on('page:fetch', function(){
  });

  $(document).on('page:change', function(){
    john.turbolinks();
  });

  $(document).on('page:restore', function(){
  });

  $(document).on('page:load', function(){
    $('body').velocity('transition.fadeIn', 400)
  });

  $(window).on("resize", function(){
    john.getWindowSize();
    john.sizeContent();
  });

})(jQuery, window);