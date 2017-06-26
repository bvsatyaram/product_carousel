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

  var Carousel = {
    selector: '.toptal-product-slider',
    proxyUri: '/a/slides/',
    loadCarouselStyles: function() {
      $('<link>').attr({
        rel:  "stylesheet",
        type: "text/css",
        href: "//b5b4c70a.ngrok.io/script-tags/assets/css/carousel-styler.css"
      }).appendTo($('body'));
    },
    getSlides: function() {
      $.get(
        this.proxyUri,
        {shopify_domain: window.location.origin},
        this.populateSlides
      )
    },
    populateSlides: function(response) {
      var sliderDiv = $('<div>').addClass('slider');
      var sliderWrapper = $('<div>').addClass('slider-wrapper');
      var sliderNav = $('<div>').addClass('slider-nav');
      var sliderIndex = 0;
      response.slides.forEach(function(slide) {
        var slideDiv = $('<div>').addClass('slide');
        var infoDiv = $('<div>').addClass('slide-info');
        infoDiv.append(
          $('<p>').addClass('product-title').html(slide.title)
        ).append(
          $('<p>').addClass('product-type').html(slide.product_type)
        ).append(
          $('<a>').attr('href', '/products/' + slide.handle).html('Buy Now')
        );
        slideDiv.append(
          $('<img>').attr('src', slide.image)
        ).append(infoDiv).append(
          $('<p>').addClass('caption').html(slide.title)
        );
        slideDiv.appendTo(sliderWrapper);

        var navLink = $('<a href="#" data-slide="' + String(sliderIndex) + '">' + String(sliderIndex + 1) + '</a>');
        navLink.appendTo(sliderNav);

        sliderIndex ++;
      });
      sliderWrapper.appendTo(sliderDiv);
      sliderNav.appendTo(sliderDiv);

      $('.toptal-product-slider').html(sliderDiv);

      function Slider( element ) {
      	this.el = document.querySelector( element );
      	this.init();
      }

      Slider.prototype = {
      	init: function() {
      		this.links = this.el.querySelectorAll( ".slider-nav a" );
      		this.wrapper = this.el.querySelector( ".slider-wrapper" );
      		this.navigate();
      	},
      	navigate: function() {

      		for( var i = 0; i < this.links.length; ++i ) {
      			var link = this.links[i];
      			this.slide( link );
      		}
      	},

      	animate: function( slide ) {
      		var parent = slide.parentNode;
      		var caption = slide.querySelector( ".caption" );
      		var captions = parent.querySelectorAll( ".caption" );
      		for( var k = 0; k < captions.length; ++k ) {
      			var cap = captions[k];
      			if( cap !== caption ) {
      				cap.classList.remove( "visible" );
      			}
      		}
      		caption.classList.add( "visible" );
      	},

      	slide: function( element ) {
      		var self = this;
      		element.addEventListener( "click", function( e ) {
      			e.preventDefault();
      			var a = this;
      			self.setCurrentLink( a );
      			var index = parseInt( a.getAttribute( "data-slide" ), 10 ) + 1;
      			var currentSlide = self.el.querySelector( ".slide:nth-child(" + index + ")" );

      			self.wrapper.style.left = "-" + currentSlide.offsetLeft + "px";
      			self.animate( currentSlide );

      		}, false);
      	},
      	setCurrentLink: function( link ) {
      		var parent = link.parentNode;
      		var a = parent.querySelectorAll( "a" );

      		link.className = "current";

      		for( var j = 0; j < a.length; ++j ) {
      			var cur = a[j];
      			if( cur !== link ) {
      				cur.className = "";
      			}
      		}
      	}
      };

      new Slider('.toptal-product-slider .slider');
    },
    init: function() {
      $(this.selector).html('<p>Loading Carousel...</p>');
      this.loadCarouselStyles();
      this.getSlides();
    }
  }

  var carouselMounter = function($){
    if ($('.toptal-product-slider').length > 0) {
      Carousel.init();
    }
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
