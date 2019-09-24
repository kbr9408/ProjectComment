<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
$(function() {
	
	
CustomMarker.prototype = new google.maps.OverlayView();

function CustomMarker(opts) {
    this.setValues(opts);
}

CustomMarker.prototype.draw = function() {
    var self = this;
    var div = this.div;
    if (!div) {
        div = this.div = $('' +
            '<div>' +
            '<div class="shadow"></div>' +
            '<div class="pulse"></div>' +
            '<div class="pin-wrap">' +
            '<div class="pin"></div>' +
            '</div>' +
            '</div>' +
            '')[0];
        this.pinWrap = this.div.getElementsByClassName('pin-wrap');
        this.pin = this.div.getElementsByClassName('pin');
        this.pinShadow = this.div.getElementsByClassName('shadow');
        div.style.position = 'absolute';
        div.style.cursor = 'pointer';
        var panes = this.getPanes();
        panes.overlayImage.appendChild(div);
        google.maps.event.addDomListener(div, "click", function(event) {
            google.maps.event.trigger(self, "click", event);
        });
    }
    var point = this.getProjection().fromLatLngToDivPixel(this.position);
    if (point) {
        div.style.left = point.x + 'px';
        div.style.top = point.y + 'px';
    }
};

CustomMarker.prototype.animateDrop = function() {
    dynamics.stop(this.pinWrap);
    dynamics.css(this.pinWrap, {
        'transform': 'scaleY(2) translateY(-'+$('#map').outerHeight()+'px)',
        'opacity': '1',
    });
    dynamics.animate(this.pinWrap, {
        translateY: 0,
        scaleY: 1.0,
    }, {
        type: dynamics.gravity,
        duration: 1800,
    });

    dynamics.stop(this.pin);
    dynamics.css(this.pin, {
        'transform': 'none',
    });
    dynamics.animate(this.pin, {
        scaleY: 0.8
    }, {
        type: dynamics.bounce,
        duration: 1800,
        bounciness: 600,
    })

    dynamics.stop(this.pinShadow);
    dynamics.css(this.pinShadow, {
        'transform': 'scale(0,0)',
    });
    dynamics.animate(this.pinShadow, {
        scale: 1,
    }, {
        type: dynamics.gravity,
        duration: 1800,
    });
}

CustomMarker.prototype.animateBounce = function() {
    dynamics.stop(this.pinWrap);
    dynamics.css(this.pinWrap, {
        'transform': 'none',
    });
    dynamics.animate(this.pinWrap, {
        translateY: -30
    }, {
        type: dynamics.forceWithGravity,
        bounciness: 0,
        duration: 500,
        delay: 150,
    });

    dynamics.stop(this.pin);
    dynamics.css(this.pin, {
        'transform': 'none',
    });
    dynamics.animate(this.pin, {
        scaleY: 0.8
    }, {
        type: dynamics.bounce,
        duration: 800,
        bounciness: 0,
    });
    dynamics.animate(this.pin, {
        scaleY: 0.8
    }, {
        type: dynamics.bounce,
        duration: 800,
        bounciness: 600,
        delay: 650,
    });

    dynamics.stop(this.pinShadow);
    dynamics.css(this.pinShadow, {
        'transform': 'none',
    });
    dynamics.animate(this.pinShadow, {
        scale: 0.6,
    }, {
        type: dynamics.forceWithGravity,
        bounciness: 0,
        duration: 500,
        delay: 150,
    });
}

CustomMarker.prototype.animateWobble = function() {
    dynamics.stop(this.pinWrap);
    dynamics.css(this.pinWrap, {
        'transform': 'none',
    });
    dynamics.animate(this.pinWrap, {
        rotateZ: -45,
    }, {
        type: dynamics.bounce,
        duration: 1800,
    });

    dynamics.stop(this.pin);
    dynamics.css(this.pin, {
        'transform': 'none',
    });
    dynamics.animate(this.pin, {
        scaleX: 0.8
    }, {
        type: dynamics.bounce,
        duration: 800,
        bounciness: 1800,
    });
}

$(function() {
    var pos = new google.maps.LatLng(42.9837, -81.2497);
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: pos,
        disableDefaultUI: true,
    });

    var marker = new CustomMarker({
        position: pos,
        map: map,
    });

    google.maps.event.addListener(marker, 'click', function(e) {
        marker.animateWobble();
    });

    $('#drop').on('click', function(e) {
        marker.animateDrop();
    });

    $('#wobble').on('click', function(e) {
        marker.animateWobble();
    });

    $('#bounce').on('click', function(e) {
        marker.animateBounce();
    })
});

});

</script>
<style>

html,
body,
#map {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  border: 0;
}

.pin-wrap {
  position: absolute;
  width: 100px;
  height: 100px;
  margin-top: -120.7106781187px;
  margin-left: -50px;
  -webkit-transform-origin: 50% 120.7106781187% 0;
          transform-origin: 50% 120.7106781187% 0;
}

.pin {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 100px;
  height: 100px;
  margin-top: -50px;
  margin-left: -50px;
  -webkit-transform-origin: 50% 120.7106781187% 0;
          transform-origin: 50% 120.7106781187% 0;
}

.pin::after {
  position: absolute;
  display: block;
  box-sizing: border-box;
  width: 100px;
  height: 100px;
  content: '';
  -webkit-transform: rotateZ(-45deg);
          transform: rotateZ(-45deg);
  border: 20px solid #f93c11;
  border-radius: 50% 50% 50% 50%;
}

.pin::before {
  position: absolute;
  display: block;
  box-sizing: border-box;
  width: 100px;
  height: 100px;
  content: '';
  -webkit-transform: rotateZ(-45deg);
          transform: rotateZ(-45deg);
  border: 18px solid #d22b05;
  border-radius: 50% 50% 50% 0;
}

.shadow {
  position: absolute;
}

.shadow::after {
  position: absolute;
  left: -125px;
  display: block;
  width: 50px;
  height: 50px;
  margin-top: -25px;
  content: '';
  -webkit-transform: rotateX(55deg);
          transform: rotateX(55deg);
  border-radius: 50%;
  box-shadow: rgba(0, 0, 0, 0.5) 100px 0 20px;
}

.pulse {
  position: absolute;
  margin-top: -50px;
  margin-left: -50px;
  -webkit-transform: rotateX(55deg);
          transform: rotateX(55deg);
}

.pulse::after {
  display: block;
  width: 100px;
  height: 100px;
  content: '';
  -webkit-animation: pulsate 1s ease-out;
          animation: pulsate 1s ease-out;
  -webkit-animation-delay: 1.1s;
          animation-delay: 1.1s;
  -webkit-animation-iteration-count: infinite;
          animation-iteration-count: infinite;
  opacity: 0;
  border-radius: 50%;
  box-shadow: 0 0 1px 2px rgba(0, 0, 0, 0.5);
  box-shadow: 0 0 6px 3px #f93c11;
}

@-webkit-keyframes pulsate {
  0% {
    -webkit-transform: scale(0.1, 0.1);
            transform: scale(0.1, 0.1);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    -webkit-transform: scale(1.2, 1.2);
            transform: scale(1.2, 1.2);
    opacity: 0;
  }
}

@keyframes pulsate {
  0% {
    -webkit-transform: scale(0.1, 0.1);
            transform: scale(0.1, 0.1);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    -webkit-transform: scale(1.2, 1.2);
            transform: scale(1.2, 1.2);
    opacity: 0;
  }
}
.header {
  font-family: Roboto, 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 16px;
  line-height: 2em;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 10px 0;
  text-align: center;
  color: #f93c11;
  background: rgba(255, 255, 255, 0.75);
}

h1 {
  font-family: Raleway, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
  font-weight: 900;
  font-size: 32px;
  margin-bottom: 10px;
  border-bottom: 2px dashed #f93c11;
  display: inline-block;
}

.tags {
  font-weight: 300;
}

.list-label {
  font-family: Raleway, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
  font-weight: 400;
}

.header li {
  display: inline-block;
}

.tags a {
  color: #f93c11;
}

.animations a {
  line-height: 42px;
  display: block;
  box-sizing: border-box;
  height: 44px;
  margin: 0 5px;
  padding: 0 10px;
  text-decoration: none;
  color: #f93c11;
  border: 2px solid #f93c11;
  border-radius: 22px;
  transition: background-color 0.3s, color 0.3s;
}

.animations a:hover {
  color: white;
  background: #f93c11;
}


</style>


<link href='//fonts.googleapis.com/css?family=Raleway:600,900,400|Roboto:300,700' rel='stylesheet'>
<div id="map"></div>
<div class="header">
  <h1>Map Marker</h1>
  <ul class="animations">
    <li><a href="#" id="drop">Drop</a>
    <li><a href="#" id="wobble">Wobble</a>
    <li><a href="#" id="bounce">Bounce</a>
  </ul>
  <div class='list-label'>--- animations ---</div>
  <div class='tags'>CSS | Google Maps | <a href="http://dynamicsjs.com/">dynamics.js</a></div>
</div>



</html>