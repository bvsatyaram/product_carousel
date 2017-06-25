(function(){
  var loadScript = function(url, callback){
    // Source: http://snipplr.com/view/18756/loadscript/
    var script = document.createElement("script")
    script.type = "text/javascript";

    if (script.readyState){  //IE
      script.onreadystatechange = function(){
        if (script.readyState == "loaded" || script.readyState == "complete") {
          script.onreadystatechange = null;
          callback();
        }
      };
    } else {  //Others
      script.onload = function(){
        callback();
      };
    }

    script.src = url;
    document.getElementsByTagName("head")[0].appendChild(script);
  };

  var carouselMounter = function($){
    $('body').append('<p>Your app is using jQuery version '+$.fn.jquery+'</p>');
  };

  if ((typeof jQuery === 'undefined') || (parseInt(jQuery.fn.jquery) === 1 && parseFloat(jQuery.fn.jquery.replace(/^1\./,'')) < 7.1)) {
    loadScript('//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', function(){
      jQuery191 = jQuery.noConflict(true);
      carouselMounter(jQuery191);
    });
  } else {
    carouselMounter(jQuery);
  }
})();
