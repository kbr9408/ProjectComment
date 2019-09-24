<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(function() {
	angular.module('ionic.example', ['ionic.service.platform', 'ionic.ui.content', 'ionic.ui.list'])

    // A simple relative timestamp filter
    .filter('relativets', function() {
      return function(value) {
        var now = new Date();
        var diff = now - value;

        // ms units
        var second = 1000;
        var minute = second * 60;
        var hour = minute * 60;
        var day = hour * 24;
        var year =  day * 365;
        var month = day * 30;

        var unit = day;
        var unitStr = 'd';
        if(diff > year) {
          unit = year;
          unitStr = 'y';
        } else if(diff > day) {
          unit = day;
          unitStr = 'd';
        } else if(diff > hour) {
          unit = hour;
          unitStr = 'h';
        } else if(diff > minute) {
          unit = minute;
          unitStr = 'm';
        } else {
          unit = second;
          unitStr = 's';
        }

        var amt = Math.ceil(diff / unit);
        return amt + '' + unitStr;
      }
    })

    .controller('ProfileCtrl', function($scope) {
      $scope.posts = [];

      for(var i = 0; i < 7; i++) {
        // Fake a date
        var date = (+new Date) - (i * 1000 * 60 * 60);
        $scope.posts.push({
          created_at: date,
          text: 'Doing a bit of ' + ((Math.floor(Math.random() * 2) === 1) ? 'that' : 'this')
        });
      }
    });
});
</script>
<style>
#profile-bg {
        position: fixed;
        left: 0;
        top: 44px;
        width: 100%;
        height: 150px;

   /*     background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/94311/bg.jpg') no-repeat transparent;*/
        background-size: 100%;
        background-position: 50% 20%;

        text-align: center;
      }

      #content {
        position: relative;
        margin-top: 150px;
        background-color: white;
        box-shadow: 0px -1px 10px rgba(0,0,0,0.4);
        padding-top: 200px;
      }

      #profile-info {
        position: absolute;
        top: -95px;
        width: 100%;
        z-index: 2;
        text-align: center;
      }
      #profile-name {
        color: #444;
        font-size: 26px;
      }
      #profile-description {
        font-size: 15px;
        color: #888;
      }
      #profile-description a {
        color: #888;
      }

      #profile-image {
        display: block;
        border-radius: 100px;
        border: 1px solid #fff;
        width: 128px;
        height: 128px;
        margin: 30px auto 0;
        box-shadow: 0px 0px 4px rgba(0,0,0,0.7);
      }

      .list-item-content {
        padding: 5px;
      }

      .list-item {
        color: #666666;
      }

      .post {
        color: #444;
      }

      .post-time {
        position: absolute;
        right: 5px;
        top: 5px;
        font-size: 11px;
        color: #888;
      }

      .post-profile-image {
        display: inline-block;
        vertical-align: top;
        width: 48px;
        height: 48px;
        margin-right: 10px;
      }
      .post-options {
        position: absolute;
        font-size: 16px;
        right: 5px;
        bottom: 5px;
        color: #888;
      }
</style>
</head>
<body>
<html ng-app="ionic.example">
  <head>
    <meta charset="utf-8">
 
    <link href="https://code.ionicframework.com/0.9.25/css/ionic.min.css" rel="stylesheet">
    <script src="https://code.ionicframework.com/0.9.25/js/ionic.bundle.min.js"></script>
  </head>
  <body ng-controller="ProfileCtrl">
    <div class="bar bar-header bar-danger">
      <button class="button button-icon"><i class="icon-person-add"></i></button>
      <h1 class="title">Me</h1>
      <button class="button button-icon"><i class="icon-gear-b"></i></button>
    </div>
    
    <ion-content has-header="true">
      <div id="profile-bg"></div>
      <div id="content">
        <div id="profile-info">
          <img id="profile-image" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/94311/me.png">
          <h3 id="profile-name">Max</h3>
          <span id="profile-description">Co-creator of <a href="https://twitter.com/ionicframework">@ionicframework</a>, founder of
            <a href="https://twitter.com/driftyco">@driftyco</a></span>
        </div>
        <ion-list>
          <ion-item ng-repeat="post in posts">
            <img class="post-profile-image" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/94311/me.png">
            {{post.text}}
            <div class="post-time">{{post.created_at | relativets }}</div>
            <div class="post-options">
              <i class="icon-reply"></i>
              <i class="icon-shuffle"></i>
            </div>
          </ion-item>
        </ion-list>
      </div>
    </ion-content>
    
  </body>
</html>
</body>
</html>