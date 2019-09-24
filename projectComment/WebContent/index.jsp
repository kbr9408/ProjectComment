<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(function() {

	
var section = window.location.pathname;
if (section == "/blog") {
  $("#index").addClass("hide");
  $("#blog").removeClass("hide");
}
else if (section == "/projects") {
  $("#index").addClass("hide");
  $("#projects").removeClass("hide");
}
else if (section == "/contact.jsp") {
  $("#index").addClass("hide");
  $("#contact").removeClass("hide");
}
// onclick of one of the navigation buttons
$( "a[data-hide]" ).on( "click", function() {
  $(window).scrollTop(0);
  var toHide = $(this).data("hide");
  var toShow = "#" + $(this).attr("href");
  var url = "/" + $(this).attr("href");
  if (url == "/index") {
    url = "/";
  }
  var animationEnd = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";
  var animationArray = ['zoomOutDown', 'zoomOutUp', 'zoomOutRight', 'zoomOutLeft', 'rollOut', 'slideOutUp', 'rotateOutDownRight', 'rotateOutUpRight', 'lightSpeedOut', 'bounceOutUp', 'rotateOutUpLeft', 'slideOutUp'];
  var animationName = animationArray[Math.floor(Math.random() * animationArray.length)];
  // var animationName = "zoomOutDown";

  $(toShow).removeClass("hide");
  $(toShow).css("z-index", "0");
  $(toHide).css("z-index", "9999");
  window.history.pushState(null, null, url);
  $(toHide).addClass("animated " + animationName).one(animationEnd, function() {

    $(toHide).addClass('hide').removeClass("animated " + animationName);

  });
  return false;
});
$('#post').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var post = button.data('post')
  var title = button.data('title')
  var modal = $(this)
  modal.find('.modal-title').text(title)
  modal.find('.modal-body').html(post)
  $('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
})
$('#send').on('click', function () {
  var $btn = $(this).button('loading')
  var name = $("#name").val();
  var email = $("#email").val();
  var subject = $("#subject").val();
  var message = $("#message").val();
  $.get( "http://timothy.expert/sendmail.php", { name: name, email: email, subject: subject, message: message } )
    .done(function( data ) {
      eval(data);
    });
  return false;
})
$(window).on('beforeunload', function() {
  $(window).scrollTop(0);
});
});
</script>
<style>

/*!
 * Bootstrap v3.3.5 (https://getbootstrap.com)
 * Copyright 2011-2015 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 */
/*! normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css */

html {
  font-family: sans-serif;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%
}

body {
  margin: 0
}

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
main,
menu,
nav,
section,
summary {
  display: block
}

audio,
canvas,
progress,
video {
  display: inline-block;
  vertical-align: baseline
}

audio:not([controls]) {
  display: none;
  height: 0
}

[hidden],
template {
  display: none
}

a {
  background-color: transparent
}

a:active,
a:hover {
  outline: 0
}

abbr[title] {
  border-bottom: 1px dotted
}

b,
strong {
  font-weight: bold
}

dfn {
  font-style: italic
}

h1 {
  font-size: 2em;
  margin: 0.67em 0
}

mark {
  background: #ff0;
  color: #000
}

small {
  font-size: 80%
}

sub,
sup {
  font-size: 75%;
  line-height: 0;
  position: relative;
  vertical-align: baseline
}

sup {
  top: -0.5em
}

sub {
  bottom: -0.25em
}

img {
  border: 0
}

svg:not(:root) {
  overflow: hidden
}

figure {
  margin: 1em 40px
}

hr {
  box-sizing: content-box;
  height: 0
}

pre {
  overflow: auto
}

code,
kbd,
pre,
samp {
  font-family: monospace, monospace;
  font-size: 1em
}

button,
input,
optgroup,
select,
textarea {
  color: inherit;
  font: inherit;
  margin: 0
}

button {
  overflow: visible
}

button,
select {
  text-transform: none
}

button,
html input[type="button"],
input[type="reset"],
input[type="submit"] {
  -webkit-appearance: button;
  cursor: pointer
}

button[disabled],
html input[disabled] {
  cursor: default
}

button::-moz-focus-inner,
input::-moz-focus-inner {
  border: 0;
  padding: 0
}

input {
  line-height: normal
}

input[type="checkbox"],
input[type="radio"] {
  box-sizing: border-box;
  padding: 0
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  height: auto
}

input[type="search"] {
  -webkit-appearance: textfield;
  box-sizing: content-box
}

input[type="search"]::-webkit-search-cancel-button,
input[type="search"]::-webkit-search-decoration {
  -webkit-appearance: none
}

fieldset {
  border: 1px solid #c0c0c0;
  margin: 0 2px;
  padding: 0.35em 0.625em 0.75em
}

legend {
  border: 0;
  padding: 0
}

textarea {
  overflow: auto
}

optgroup {
  font-weight: bold
}

table {
  border-collapse: collapse;
  border-spacing: 0
}

td,
th {
  padding: 0
}
/*! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css */

@media print {
  *, *:before, *:after {
    background: transparent !important;
    color: #000 !important;
    box-shadow: none !important;
    text-shadow: none !important
  }
  a,
  a:visited {
    text-decoration: underline
  }
  a[href]:after {
    content: " (" attr(href) ")"
  }
  abbr[title]:after {
    content: " (" attr(title) ")"
  }
  a[href^="#"]:after,
  a[href^="javascript:"]:after {
    content: ""
  }
  pre,
  blockquote {
    border: 1px solid #999;
    page-break-inside: avoid
  }
  thead {
    display: table-header-group
  }
  tr,
  img {
    page-break-inside: avoid
  }
  img {
    max-width: 100% !important
  }
  p,
  h2,
  h3 {
    orphans: 3;
    widows: 3
  }
  h2,
  h3 {
    page-break-after: avoid
  }
  .navbar {
    display: none
  }
  .btn>.caret,
  .dropup>.btn>.caret {
    border-top-color: #000 !important
  }
  .label {
    border: 1px solid #000
  }
  .table {
    border-collapse: collapse !important
  }
  .table td,
  .table th {
    background-color: #fff !important
  }
  .table-bordered th,
  .table-bordered td {
    border: 1px solid #ddd !important
  }
}

* {
  box-sizing: border-box
}

*:before,
*:after {
  box-sizing: border-box
}

html {
  font-size: 10px;
  -webkit-tap-highlight-color: transparent
}

body {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  line-height: 1.428571429;
  color: #333;
  background-color: #fff
}

input,
button,
select,
textarea {
  font-family: inherit;
  font-size: inherit;
  line-height: inherit
}

a {
  color: #428bca;
  text-decoration: none
}

a:hover,
a:focus {
  color: #2a6496;
  text-decoration: underline
}

a:focus {
  outline: thin dotted;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px
}

figure {
  margin: 0
}

img {
  vertical-align: middle
}

.img-responsive {
  display: block;
  max-width: 100%;
  height: auto
}

.img-rounded {
  border-radius: 6px
}

.img-thumbnail {
  padding: 4px;
  line-height: 1.428571429;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 4px;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  display: inline-block;
  max-width: 100%;
  height: auto
}

.img-circle {
  border-radius: 50%
}

hr {
  margin-top: 20px;
  margin-bottom: 20px;
  border: 0;
  border-top: 1px solid #eee
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  margin: -1px;
  padding: 0;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0
}

.sr-only-focusable:active,
.sr-only-focusable:focus {
  position: static;
  width: auto;
  height: auto;
  margin: 0;
  overflow: visible;
  clip: auto
}

[role="button"] {
  cursor: pointer
}

h1,
h2,
h3,
h4,
h5,
h6,
.h1,
.h2,
.h3,
.h4,
.h5,
.h6 {
  font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-weight: 600;
  line-height: 1.1;
  color: inherit
}

h1 small,
h1 .small,
h2 small,
h2 .small,
h3 small,
h3 .small,
h4 small,
h4 .small,
h5 small,
h5 .small,
h6 small,
h6 .small,
.h1 small,
.h1 .small,
.h2 small,
.h2 .small,
.h3 small,
.h3 .small,
.h4 small,
.h4 .small,
.h5 small,
.h5 .small,
.h6 small,
.h6 .small {
  font-weight: normal;
  line-height: 1;
  color: #777
}

h1,
.h1,
h2,
.h2,
h3,
.h3 {
  margin-top: 20px;
  margin-bottom: 10px
}

h1 small,
h1 .small,
.h1 small,
.h1 .small,
h2 small,
h2 .small,
.h2 small,
.h2 .small,
h3 small,
h3 .small,
.h3 small,
.h3 .small {
  font-size: 65%
}

h4,
.h4,
h5,
.h5,
h6,
.h6 {
  margin-top: 10px;
  margin-bottom: 10px
}

h4 small,
h4 .small,
.h4 small,
.h4 .small,
h5 small,
h5 .small,
.h5 small,
.h5 .small,
h6 small,
h6 .small,
.h6 small,
.h6 .small {
  font-size: 75%
}

h1,
.h1 {
  font-size: 36px
}

h2,
.h2 {
  font-size: 30px
}

h3,
.h3 {
  font-size: 24px
}

h4,
.h4 {
  font-size: 18px
}

h5,
.h5 {
  font-size: 14px
}

h6,
.h6 {
  font-size: 12px
}

p {
  margin: 0 0 10px
}

.lead {
  margin-bottom: 20px;
  font-size: 16px;
  font-weight: 300;
  line-height: 1.4
}

@media (min-width: 768px) {
  .lead {
    font-size: 21px
  }
}

small,
.small {
  font-size: 85%
}

mark,
.mark {
  background-color: #fcf8e3;
  padding: .2em
}

.text-left {
  text-align: left
}

.text-right {
  text-align: right
}

.text-center {
  text-align: center
}

.text-justify {
  text-align: justify
}

.text-nowrap {
  white-space: nowrap
}

.text-lowercase {
  text-transform: lowercase
}

.text-uppercase,
.initialism {
  text-transform: uppercase
}

.text-capitalize {
  text-transform: capitalize
}

.text-muted {
  color: #777
}

.text-primary {
  color: #428bca
}

a.text-primary:hover,
a.text-primary:focus {
  color: #3071a9
}

.text-success {
  color: #3c763d
}

a.text-success:hover,
a.text-success:focus {
  color: #2b542c
}

.text-info {
  color: #31708f
}

a.text-info:hover,
a.text-info:focus {
  color: #245269
}

.text-warning {
  color: #8a6d3b
}

a.text-warning:hover,
a.text-warning:focus {
  color: #66512c
}

.text-danger {
  color: #a94442
}

a.text-danger:hover,
a.text-danger:focus {
  color: #843534
}

.bg-primary {
  color: #fff
}

.bg-primary {
  background-color: #428bca
}

a.bg-primary:hover,
a.bg-primary:focus {
  background-color: #3071a9
}

.bg-success {
  background-color: #dff0d8
}

a.bg-success:hover,
a.bg-success:focus {
  background-color: #c1e2b3
}

.bg-info {
  background-color: #d9edf7
}

a.bg-info:hover,
a.bg-info:focus {
  background-color: #afd9ee
}

.bg-warning {
  background-color: #fcf8e3
}

a.bg-warning:hover,
a.bg-warning:focus {
  background-color: #f7ecb5
}

.bg-danger {
  background-color: #f2dede
}

a.bg-danger:hover,
a.bg-danger:focus {
  background-color: #e4b9b9
}

.page-header {
  padding-bottom: 9px;
  margin: 40px 0 20px;
  border-bottom: 1px solid #eee
}

ul,
ol {
  margin-top: 0;
  margin-bottom: 10px
}

ul ul,
ul ol,
ol ul,
ol ol {
  margin-bottom: 0
}

.list-unstyled {
  padding-left: 0;
  list-style: none
}

.list-inline {
  padding-left: 0;
  list-style: none;
  margin-left: -5px
}

.list-inline>li {
  display: inline-block;
  padding-left: 5px;
  padding-right: 5px
}

dl {
  margin-top: 0;
  margin-bottom: 20px
}

dt,
dd {
  line-height: 1.428571429
}

dt {
  font-weight: bold
}

dd {
  margin-left: 0
}

.dl-horizontal dd:before,
.dl-horizontal dd:after {
  content: " ";
  display: table
}

.dl-horizontal dd:after {
  clear: both
}

@media (min-width: 768px) {
  .dl-horizontal dt {
    float: left;
    width: 160px;
    clear: left;
    text-align: right;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap
  }
  .dl-horizontal dd {
    margin-left: 180px
  }
}

abbr[title],
abbr[data-original-title] {
  cursor: help;
  border-bottom: 1px dotted #777
}

.initialism {
  font-size: 90%
}

blockquote {
  padding: 10px 20px;
  margin: 0 0 20px;
  font-size: 17.5px;
  border-left: 5px solid #eee
}

blockquote p:last-child,
blockquote ul:last-child,
blockquote ol:last-child {
  margin-bottom: 0
}

blockquote footer,
blockquote small,
blockquote .small {
  display: block;
  font-size: 80%;
  line-height: 1.428571429;
  color: #777
}

blockquote footer:before,
blockquote small:before,
blockquote .small:before {
  content: '\2014 \00A0'
}

.blockquote-reverse,
blockquote.pull-right {
  padding-right: 15px;
  padding-left: 0;
  border-right: 5px solid #eee;
  border-left: 0;
  text-align: right
}

.blockquote-reverse footer:before,
.blockquote-reverse small:before,
.blockquote-reverse .small:before,
blockquote.pull-right footer:before,
blockquote.pull-right small:before,
blockquote.pull-right .small:before {
  content: ''
}

.blockquote-reverse footer:after,
.blockquote-reverse small:after,
.blockquote-reverse .small:after,
blockquote.pull-right footer:after,
blockquote.pull-right small:after,
blockquote.pull-right .small:after {
  content: '\00A0 \2014'
}

address {
  margin-bottom: 20px;
  font-style: normal;
  line-height: 1.428571429
}

code,
kbd,
pre,
samp {
  font-family: Menlo, Monaco, Consolas, "Courier New", monospace
}

code {
  padding: 2px 4px;
  font-size: 90%;
  color: #c7254e;
  background-color: #f9f2f4;
  border-radius: 4px
}

kbd {
  padding: 2px 4px;
  font-size: 90%;
  color: #fff;
  background-color: #333;
  border-radius: 3px;
  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.25)
}

kbd kbd {
  padding: 0;
  font-size: 100%;
  font-weight: bold;
  box-shadow: none
}

pre {
  display: block;
  padding: 9.5px;
  margin: 0 0 10px;
  font-size: 13px;
  line-height: 1.428571429;
  word-break: keep-all;
  word-wrap: normal;
  color: #333;
  background-color: #f8f8f8;
  border-radius: 4px;
  overflow-x: scroll
}

pre code {
  padding: 0;
  font-size: inherit;
  color: inherit;
  white-space: pre;
  background-color: transparent;
  border-radius: 0
}

.hljs {
  display: block;
  overflow-x: auto;
  padding: 0.5em;
  color: #333;
  background: #f8f8f8;
  -webkit-text-size-adjust: none
}

.hljs-comment,
.diff .hljs-header {
  color: #998;
  font-style: italic
}

.hljs-keyword,
.css .rule .hljs-keyword,
.hljs-winutils,
.nginx .hljs-title,
.hljs-subst,
.hljs-request,
.hljs-status {
  color: #333;
  font-weight: bold
}

.hljs-number,
.hljs-hexcolor,
.ruby .hljs-constant {
  color: #008080
}

.hljs-string,
.hljs-tag .hljs-value,
.hljs-doctag,
.tex .hljs-formula {
  color: #d14
}

.hljs-title,
.hljs-id,
.scss .hljs-preprocessor {
  color: #900;
  font-weight: bold
}

.hljs-list .hljs-keyword,
.hljs-subst {
  font-weight: normal
}

.hljs-class .hljs-title,
.hljs-type,
.vhdl .hljs-literal,
.tex .hljs-command {
  color: #458;
  font-weight: bold
}

.hljs-tag,
.hljs-tag .hljs-title,
.hljs-rule .hljs-property,
.django .hljs-tag .hljs-keyword {
  color: #000080;
  font-weight: normal
}

.hljs-attribute,
.hljs-variable,
.lisp .hljs-body,
.hljs-name {
  color: #008080
}

.hljs-regexp {
  color: #009926
}

.hljs-symbol,
.ruby .hljs-symbol .hljs-string,
.lisp .hljs-keyword,
.clojure .hljs-keyword,
.scheme .hljs-keyword,
.tex .hljs-special,
.hljs-prompt {
  color: #990073
}

.hljs-built_in {
  color: #0086b3
}

.hljs-preprocessor,
.hljs-pragma,
.hljs-pi,
.hljs-doctype,
.hljs-shebang,
.hljs-cdata {
  color: #999;
  font-weight: bold
}

.hljs-deletion {
  background: #fdd
}

.hljs-addition {
  background: #dfd
}

.diff .hljs-change {
  background: #0086b3
}

.hljs-chunk {
  color: #aaa
}

.container {
  margin-right: auto;
  margin-left: auto;
  padding-left: 15px;
  padding-right: 15px
}

.container:before,
.container:after {
  content: " ";
  display: table
}

.container:after {
  clear: both
}

@media (min-width: 768px) {
  .container {
    width: 750px
  }
}

@media (min-width: 992px) {
  .container {
    width: 970px
  }
}

@media (min-width: 1200px) {
  .container {
    width: 1170px
  }
}

.container-fluid {
  margin-right: auto;
  margin-left: auto;
  padding-left: 15px;
  padding-right: 15px
}

.container-fluid:before,
.container-fluid:after {
  content: " ";
  display: table
}

.container-fluid:after {
  clear: both
}

.row {
  margin-left: -15px;
  margin-right: -15px
}

.row:before,
.row:after {
  content: " ";
  display: table
}

.row:after {
  clear: both
}

.col-xs-1,
.col-sm-1,
.col-md-1,
.col-lg-1,
.col-xs-2,
.col-sm-2,
.col-md-2,
.col-lg-2,
.col-xs-3,
.col-sm-3,
.col-md-3,
.col-lg-3,
.col-xs-4,
.col-sm-4,
.col-md-4,
.col-lg-4,
.col-xs-5,
.col-sm-5,
.col-md-5,
.col-lg-5,
.col-xs-6,
.col-sm-6,
.col-md-6,
.col-lg-6,
.col-xs-7,
.col-sm-7,
.col-md-7,
.col-lg-7,
.col-xs-8,
.col-sm-8,
.col-md-8,
.col-lg-8,
.col-xs-9,
.col-sm-9,
.col-md-9,
.col-lg-9,
.col-xs-10,
.col-sm-10,
.col-md-10,
.col-lg-10,
.col-xs-11,
.col-sm-11,
.col-md-11,
.col-lg-11,
.col-xs-12,
.col-sm-12,
.col-md-12,
.col-lg-12 {
  position: relative;
  min-height: 1px;
  padding-left: 15px;
  padding-right: 15px
}

.col-xs-1,
.col-xs-2,
.col-xs-3,
.col-xs-4,
.col-xs-5,
.col-xs-6,
.col-xs-7,
.col-xs-8,
.col-xs-9,
.col-xs-10,
.col-xs-11,
.col-xs-12 {
  float: left
}

.col-xs-1 {
  width: 8.3333333333%
}

.col-xs-2 {
  width: 16.6666666667%
}

.col-xs-3 {
  width: 25%
}

.col-xs-4 {
  width: 33.3333333333%
}

.col-xs-5 {
  width: 41.6666666667%
}

.col-xs-6 {
  width: 50%
}

.col-xs-7 {
  width: 58.3333333333%
}

.col-xs-8 {
  width: 66.6666666667%
}

.col-xs-9 {
  width: 75%
}

.col-xs-10 {
  width: 83.3333333333%
}

.col-xs-11 {
  width: 91.6666666667%
}

.col-xs-12 {
  width: 100%
}

.col-xs-pull-0 {
  right: auto
}

.col-xs-pull-1 {
  right: 8.3333333333%
}

.col-xs-pull-2 {
  right: 16.6666666667%
}

.col-xs-pull-3 {
  right: 25%
}

.col-xs-pull-4 {
  right: 33.3333333333%
}

.col-xs-pull-5 {
  right: 41.6666666667%
}

.col-xs-pull-6 {
  right: 50%
}

.col-xs-pull-7 {
  right: 58.3333333333%
}

.col-xs-pull-8 {
  right: 66.6666666667%
}

.col-xs-pull-9 {
  right: 75%
}

.col-xs-pull-10 {
  right: 83.3333333333%
}

.col-xs-pull-11 {
  right: 91.6666666667%
}

.col-xs-pull-12 {
  right: 100%
}

.col-xs-push-0 {
  left: auto
}

.col-xs-push-1 {
  left: 8.3333333333%
}

.col-xs-push-2 {
  left: 16.6666666667%
}

.col-xs-push-3 {
  left: 25%
}

.col-xs-push-4 {
  left: 33.3333333333%
}

.col-xs-push-5 {
  left: 41.6666666667%
}

.col-xs-push-6 {
  left: 50%
}

.col-xs-push-7 {
  left: 58.3333333333%
}

.col-xs-push-8 {
  left: 66.6666666667%
}

.col-xs-push-9 {
  left: 75%
}

.col-xs-push-10 {
  left: 83.3333333333%
}

.col-xs-push-11 {
  left: 91.6666666667%
}

.col-xs-push-12 {
  left: 100%
}

.col-xs-offset-0 {
  margin-left: 0%
}

.col-xs-offset-1 {
  margin-left: 8.3333333333%
}

.col-xs-offset-2 {
  margin-left: 16.6666666667%
}

.col-xs-offset-3 {
  margin-left: 25%
}

.col-xs-offset-4 {
  margin-left: 33.3333333333%
}

.col-xs-offset-5 {
  margin-left: 41.6666666667%
}

.col-xs-offset-6 {
  margin-left: 50%
}

.col-xs-offset-7 {
  margin-left: 58.3333333333%
}

.col-xs-offset-8 {
  margin-left: 66.6666666667%
}

.col-xs-offset-9 {
  margin-left: 75%
}

.col-xs-offset-10 {
  margin-left: 83.3333333333%
}

.col-xs-offset-11 {
  margin-left: 91.6666666667%
}

.col-xs-offset-12 {
  margin-left: 100%
}

@media (min-width: 768px) {
  .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
    float: left
  }
  .col-sm-1 {
    width: 8.3333333333%
  }
  .col-sm-2 {
    width: 16.6666666667%
  }
  .col-sm-3 {
    width: 25%
  }
  .col-sm-4 {
    width: 33.3333333333%
  }
  .col-sm-5 {
    width: 41.6666666667%
  }
  .col-sm-6 {
    width: 50%
  }
  .col-sm-7 {
    width: 58.3333333333%
  }
  .col-sm-8 {
    width: 66.6666666667%
  }
  .col-sm-9 {
    width: 75%
  }
  .col-sm-10 {
    width: 83.3333333333%
  }
  .col-sm-11 {
    width: 91.6666666667%
  }
  .col-sm-12 {
    width: 100%
  }
  .col-sm-pull-0 {
    right: auto
  }
  .col-sm-pull-1 {
    right: 8.3333333333%
  }
  .col-sm-pull-2 {
    right: 16.6666666667%
  }
  .col-sm-pull-3 {
    right: 25%
  }
  .col-sm-pull-4 {
    right: 33.3333333333%
  }
  .col-sm-pull-5 {
    right: 41.6666666667%
  }
  .col-sm-pull-6 {
    right: 50%
  }
  .col-sm-pull-7 {
    right: 58.3333333333%
  }
  .col-sm-pull-8 {
    right: 66.6666666667%
  }
  .col-sm-pull-9 {
    right: 75%
  }
  .col-sm-pull-10 {
    right: 83.3333333333%
  }
  .col-sm-pull-11 {
    right: 91.6666666667%
  }
  .col-sm-pull-12 {
    right: 100%
  }
  .col-sm-push-0 {
    left: auto
  }
  .col-sm-push-1 {
    left: 8.3333333333%
  }
  .col-sm-push-2 {
    left: 16.6666666667%
  }
  .col-sm-push-3 {
    left: 25%
  }
  .col-sm-push-4 {
    left: 33.3333333333%
  }
  .col-sm-push-5 {
    left: 41.6666666667%
  }
  .col-sm-push-6 {
    left: 50%
  }
  .col-sm-push-7 {
    left: 58.3333333333%
  }
  .col-sm-push-8 {
    left: 66.6666666667%
  }
  .col-sm-push-9 {
    left: 75%
  }
  .col-sm-push-10 {
    left: 83.3333333333%
  }
  .col-sm-push-11 {
    left: 91.6666666667%
  }
  .col-sm-push-12 {
    left: 100%
  }
  .col-sm-offset-0 {
    margin-left: 0%
  }
  .col-sm-offset-1 {
    margin-left: 8.3333333333%
  }
  .col-sm-offset-2 {
    margin-left: 16.6666666667%
  }
  .col-sm-offset-3 {
    margin-left: 25%
  }
  .col-sm-offset-4 {
    margin-left: 33.3333333333%
  }
  .col-sm-offset-5 {
    margin-left: 41.6666666667%
  }
  .col-sm-offset-6 {
    margin-left: 50%
  }
  .col-sm-offset-7 {
    margin-left: 58.3333333333%
  }
  .col-sm-offset-8 {
    margin-left: 66.6666666667%
  }
  .col-sm-offset-9 {
    margin-left: 75%
  }
  .col-sm-offset-10 {
    margin-left: 83.3333333333%
  }
  .col-sm-offset-11 {
    margin-left: 91.6666666667%
  }
  .col-sm-offset-12 {
    margin-left: 100%
  }
}

@media (min-width: 992px) {
  .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
    float: left
  }
  .col-md-1 {
    width: 8.3333333333%
  }
  .col-md-2 {
    width: 16.6666666667%
  }
  .col-md-3 {
    width: 25%
  }
  .col-md-4 {
    width: 33.3333333333%
  }
  .col-md-5 {
    width: 41.6666666667%
  }
  .col-md-6 {
    width: 50%
  }
  .col-md-7 {
    width: 58.3333333333%
  }
  .col-md-8 {
    width: 66.6666666667%
  }
  .col-md-9 {
    width: 75%
  }
  .col-md-10 {
    width: 83.3333333333%
  }
  .col-md-11 {
    width: 91.6666666667%
  }
  .col-md-12 {
    width: 100%
  }
  .col-md-pull-0 {
    right: auto
  }
  .col-md-pull-1 {
    right: 8.3333333333%
  }
  .col-md-pull-2 {
    right: 16.6666666667%
  }
  .col-md-pull-3 {
    right: 25%
  }
  .col-md-pull-4 {
    right: 33.3333333333%
  }
  .col-md-pull-5 {
    right: 41.6666666667%
  }
  .col-md-pull-6 {
    right: 50%
  }
  .col-md-pull-7 {
    right: 58.3333333333%
  }
  .col-md-pull-8 {
    right: 66.6666666667%
  }
  .col-md-pull-9 {
    right: 75%
  }
  .col-md-pull-10 {
    right: 83.3333333333%
  }
  .col-md-pull-11 {
    right: 91.6666666667%
  }
  .col-md-pull-12 {
    right: 100%
  }
  .col-md-push-0 {
    left: auto
  }
  .col-md-push-1 {
    left: 8.3333333333%
  }
  .col-md-push-2 {
    left: 16.6666666667%
  }
  .col-md-push-3 {
    left: 25%
  }
  .col-md-push-4 {
    left: 33.3333333333%
  }
  .col-md-push-5 {
    left: 41.6666666667%
  }
  .col-md-push-6 {
    left: 50%
  }
  .col-md-push-7 {
    left: 58.3333333333%
  }
  .col-md-push-8 {
    left: 66.6666666667%
  }
  .col-md-push-9 {
    left: 75%
  }
  .col-md-push-10 {
    left: 83.3333333333%
  }
  .col-md-push-11 {
    left: 91.6666666667%
  }
  .col-md-push-12 {
    left: 100%
  }
  .col-md-offset-0 {
    margin-left: 0%
  }
  .col-md-offset-1 {
    margin-left: 8.3333333333%
  }
  .col-md-offset-2 {
    margin-left: 16.6666666667%
  }
  .col-md-offset-3 {
    margin-left: 25%
  }
  .col-md-offset-4 {
    margin-left: 33.3333333333%
  }
  .col-md-offset-5 {
    margin-left: 41.6666666667%
  }
  .col-md-offset-6 {
    margin-left: 50%
  }
  .col-md-offset-7 {
    margin-left: 58.3333333333%
  }
  .col-md-offset-8 {
    margin-left: 66.6666666667%
  }
  .col-md-offset-9 {
    margin-left: 75%
  }
  .col-md-offset-10 {
    margin-left: 83.3333333333%
  }
  .col-md-offset-11 {
    margin-left: 91.6666666667%
  }
  .col-md-offset-12 {
    margin-left: 100%
  }
}

@media (min-width: 1200px) {
  .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
    float: left
  }
  .col-lg-1 {
    width: 8.3333333333%
  }
  .col-lg-2 {
    width: 16.6666666667%
  }
  .col-lg-3 {
    width: 25%
  }
  .col-lg-4 {
    width: 33.3333333333%
  }
  .col-lg-5 {
    width: 41.6666666667%
  }
  .col-lg-6 {
    width: 50%
  }
  .col-lg-7 {
    width: 58.3333333333%
  }
  .col-lg-8 {
    width: 66.6666666667%
  }
  .col-lg-9 {
    width: 75%
  }
  .col-lg-10 {
    width: 83.3333333333%
  }
  .col-lg-11 {
    width: 91.6666666667%
  }
  .col-lg-12 {
    width: 100%
  }
  .col-lg-pull-0 {
    right: auto
  }
  .col-lg-pull-1 {
    right: 8.3333333333%
  }
  .col-lg-pull-2 {
    right: 16.6666666667%
  }
  .col-lg-pull-3 {
    right: 25%
  }
  .col-lg-pull-4 {
    right: 33.3333333333%
  }
  .col-lg-pull-5 {
    right: 41.6666666667%
  }
  .col-lg-pull-6 {
    right: 50%
  }
  .col-lg-pull-7 {
    right: 58.3333333333%
  }
  .col-lg-pull-8 {
    right: 66.6666666667%
  }
  .col-lg-pull-9 {
    right: 75%
  }
  .col-lg-pull-10 {
    right: 83.3333333333%
  }
  .col-lg-pull-11 {
    right: 91.6666666667%
  }
  .col-lg-pull-12 {
    right: 100%
  }
  .col-lg-push-0 {
    left: auto
  }
  .col-lg-push-1 {
    left: 8.3333333333%
  }
  .col-lg-push-2 {
    left: 16.6666666667%
  }
  .col-lg-push-3 {
    left: 25%
  }
  .col-lg-push-4 {
    left: 33.3333333333%
  }
  .col-lg-push-5 {
    left: 41.6666666667%
  }
  .col-lg-push-6 {
    left: 50%
  }
  .col-lg-push-7 {
    left: 58.3333333333%
  }
  .col-lg-push-8 {
    left: 66.6666666667%
  }
  .col-lg-push-9 {
    left: 75%
  }
  .col-lg-push-10 {
    left: 83.3333333333%
  }
  .col-lg-push-11 {
    left: 91.6666666667%
  }
  .col-lg-push-12 {
    left: 100%
  }
  .col-lg-offset-0 {
    margin-left: 0%
  }
  .col-lg-offset-1 {
    margin-left: 8.3333333333%
  }
  .col-lg-offset-2 {
    margin-left: 16.6666666667%
  }
  .col-lg-offset-3 {
    margin-left: 25%
  }
  .col-lg-offset-4 {
    margin-left: 33.3333333333%
  }
  .col-lg-offset-5 {
    margin-left: 41.6666666667%
  }
  .col-lg-offset-6 {
    margin-left: 50%
  }
  .col-lg-offset-7 {
    margin-left: 58.3333333333%
  }
  .col-lg-offset-8 {
    margin-left: 66.6666666667%
  }
  .col-lg-offset-9 {
    margin-left: 75%
  }
  .col-lg-offset-10 {
    margin-left: 83.3333333333%
  }
  .col-lg-offset-11 {
    margin-left: 91.6666666667%
  }
  .col-lg-offset-12 {
    margin-left: 100%
  }
}

fieldset {
  padding: 0;
  margin: 0;
  border: 0;
  min-width: 0
}

legend {
  display: block;
  width: 100%;
  padding: 0;
  margin-bottom: 20px;
  font-size: 21px;
  line-height: inherit;
  color: #333;
  border: 0;
  border-bottom: 1px solid #e5e5e5
}

label {
  display: inline-block;
  max-width: 100%;
  margin-bottom: 5px;
  font-weight: bold
}

input[type="search"] {
  box-sizing: border-box
}

input[type="radio"],
input[type="checkbox"] {
  margin: 4px 0 0;
  margin-top: 1px \9;
  line-height: normal
}

input[type="file"] {
  display: block
}

input[type="range"] {
  display: block;
  width: 100%
}

select[multiple],
select[size] {
  height: auto
}

input[type="file"]:focus,
input[type="radio"]:focus,
input[type="checkbox"]:focus {
  outline: thin dotted;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px
}

output {
  display: block;
  padding-top: 7px;
  font-size: 14px;
  line-height: 1.428571429;
  color: #555
}

.form-control {
  display: block;
  width: 100%;
  height: 34px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.428571429;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s
}

.form-control:focus {
  border-color: #66afe9;
  outline: 0;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6)
}

.form-control::-moz-placeholder {
  color: #fff;
  opacity: 1
}

.form-control:-ms-input-placeholder {
  color: #fff
}

.form-control::-webkit-input-placeholder {
  color: #fff
}

.form-control[disabled],
.form-control[readonly],
fieldset[disabled] .form-control {
  background-color: #eee;
  opacity: 1
}

.form-control[disabled],
fieldset[disabled] .form-control {
  cursor: not-allowed
}

textarea.form-control {
  height: auto
}

input[type="search"] {
  -webkit-appearance: none
}

@media screen and (-webkit-min-device-pixel-ratio: 0) {
  input[type="date"].form-control, input[type="time"].form-control, input[type="datetime-local"].form-control, input[type="month"].form-control {
    line-height: 34px
  }
  input[type="date"].input-sm,
  .input-group-sm input[type="date"],
  input[type="time"].input-sm,
  .input-group-sm input[type="time"],
  input[type="datetime-local"].input-sm,
  .input-group-sm input[type="datetime-local"],
  input[type="month"].input-sm,
  .input-group-sm input[type="month"] {
    line-height: 30px
  }
  input[type="date"].input-lg,
  .input-group-lg input[type="date"],
  input[type="time"].input-lg,
  .input-group-lg input[type="time"],
  input[type="datetime-local"].input-lg,
  .input-group-lg input[type="datetime-local"],
  input[type="month"].input-lg,
  .input-group-lg input[type="month"] {
    line-height: 46px
  }
}

.form-group {
  margin-bottom: 15px
}

.form-control-static {
  padding-top: 7px;
  padding-bottom: 7px;
  margin-bottom: 0;
  min-height: 34px
}

.form-control-static.input-lg,
.form-control-static.input-sm {
  padding-left: 0;
  padding-right: 0
}

.input-sm {
  height: 30px;
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
  border-radius: 3px
}

select.input-sm {
  height: 30px;
  line-height: 30px
}

textarea.input-sm,
select[multiple].input-sm {
  height: auto
}

.form-group-sm .form-control {
  height: 30px;
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
  border-radius: 3px
}

.form-group-sm select.form-control {
  height: 30px;
  line-height: 30px
}

.form-group-sm textarea.form-control,
.form-group-sm select[multiple].form-control {
  height: auto
}

.form-group-sm .form-control-static {
  height: 30px;
  min-height: 32px;
  padding: 6px 10px;
  font-size: 12px;
  line-height: 1.5
}

.input-lg {
  height: 46px;
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.3333333;
  border-radius: 6px
}

select.input-lg {
  height: 46px;
  line-height: 46px
}

textarea.input-lg,
select[multiple].input-lg {
  height: auto
}

.form-group-lg .form-control {
  height: 46px;
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.3333333;
  border-radius: 6px
}

.form-group-lg select.form-control {
  height: 46px;
  line-height: 46px
}

.form-group-lg textarea.form-control,
.form-group-lg select[multiple].form-control {
  height: auto
}

.form-group-lg .form-control-static {
  height: 46px;
  min-height: 38px;
  padding: 11px 16px;
  font-size: 18px;
  line-height: 1.3333333
}

.has-feedback {
  position: relative
}

.has-feedback .form-control {
  padding-right: 42.5px
}

.form-control-feedback {
  position: absolute;
  top: 0;
  right: 0;
  z-index: 2;
  display: block;
  width: 34px;
  height: 34px;
  line-height: 34px;
  text-align: center;
  pointer-events: none
}

.input-lg+.form-control-feedback,
.input-group-lg+.form-control-feedback,
.form-group-lg .form-control+.form-control-feedback {
  width: 46px;
  height: 46px;
  line-height: 46px
}

.input-sm+.form-control-feedback,
.input-group-sm+.form-control-feedback,
.form-group-sm .form-control+.form-control-feedback {
  width: 30px;
  height: 30px;
  line-height: 30px
}

.has-success .help-block,
.has-success .control-label,
.has-success .radio,
.has-success .checkbox,
.has-success .radio-inline,
.has-success .checkbox-inline,
.has-success.radio label,
.has-success.checkbox label,
.has-success.radio-inline label,
.has-success.checkbox-inline label {
  color: #3c763d
}

.has-success .form-control {
  border-color: #3c763d;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075)
}

.has-success .form-control:focus {
  border-color: #2b542c;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #67b168
}

.has-success .input-group-addon {
  color: #3c763d;
  border-color: #3c763d;
  background-color: #dff0d8
}

.has-success .form-control-feedback {
  color: #3c763d
}

.has-warning .help-block,
.has-warning .control-label,
.has-warning .radio,
.has-warning .checkbox,
.has-warning .radio-inline,
.has-warning .checkbox-inline,
.has-warning.radio label,
.has-warning.checkbox label,
.has-warning.radio-inline label,
.has-warning.checkbox-inline label {
  color: #8a6d3b
}

.has-warning .form-control {
  border-color: #8a6d3b;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075)
}

.has-warning .form-control:focus {
  border-color: #66512c;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #c0a16b
}

.has-warning .input-group-addon {
  color: #8a6d3b;
  border-color: #8a6d3b;
  background-color: #fcf8e3
}

.has-warning .form-control-feedback {
  color: #8a6d3b
}

.has-error .help-block,
.has-error .control-label,
.has-error .radio,
.has-error .checkbox,
.has-error .radio-inline,
.has-error .checkbox-inline,
.has-error.radio label,
.has-error.checkbox label,
.has-error.radio-inline label,
.has-error.checkbox-inline label {
  color: #a94442
}

.has-error .form-control {
  border-color: #a94442;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075)
}

.has-error .form-control:focus {
  border-color: #843534;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #ce8483
}

.has-error .input-group-addon {
  color: #a94442;
  border-color: #a94442;
  background-color: #f2dede
}

.has-error .form-control-feedback {
  color: #a94442
}

.has-feedback label ~ .form-control-feedback {
  top: 25px
}

.has-feedback label.sr-only ~ .form-control-feedback {
  top: 0
}

.help-block {
  display: block;
  margin-top: 5px;
  margin-bottom: 10px;
  color: #737373
}

.btn {
  display: inline-block;
  margin-bottom: 0;
  font-weight: normal;
  text-align: center;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  background-image: none;
  border: 1px solid transparent;
  white-space: nowrap;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.428571429;
  border-radius: 4px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none
}

.btn:focus,
.btn.focus,
.btn:active:focus,
.btn:active.focus,
.btn.active:focus,
.btn.active.focus {
  outline: thin dotted;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px
}

.btn:hover,
.btn:focus,
.btn.focus {
  color: #333;
  text-decoration: none
}

.btn:active,
.btn.active {
  outline: 0;
  background-image: none;
  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125)
}

.btn.disabled,
.btn[disabled],
fieldset[disabled] .btn {
  cursor: not-allowed;
  opacity: 0.65;
  filter: alpha(opacity=65);
  box-shadow: none
}

a.btn.disabled,
fieldset[disabled] a.btn {
  pointer-events: none
}

.btn-default {
  color: #333;
  background-color: #fff;
  border-color: #ccc
}

.btn-default:focus,
.btn-default.focus {
  color: #333;
  background-color: #e6e6e6;
  border-color: #8c8c8c
}

.btn-default:hover {
  color: #333;
  background-color: #e6e6e6;
  border-color: #adadad
}

.btn-default:active,
.btn-default.active,
.open>.btn-default.dropdown-toggle {
  color: #333;
  background-color: #e6e6e6;
  border-color: #adadad
}

.btn-default:active:hover,
.btn-default:active:focus,
.btn-default:active.focus,
.btn-default.active:hover,
.btn-default.active:focus,
.btn-default.active.focus,
.open>.btn-default.dropdown-toggle:hover,
.open>.btn-default.dropdown-toggle:focus,
.open>.btn-default.dropdown-toggle.focus {
  color: #333;
  background-color: #d4d4d4;
  border-color: #8c8c8c
}

.btn-default:active,
.btn-default.active,
.open>.btn-default.dropdown-toggle {
  background-image: none
}

.btn-default.disabled,
.btn-default.disabled:hover,
.btn-default.disabled:focus,
.btn-default.disabled.focus,
.btn-default.disabled:active,
.btn-default.disabled.active,
.btn-default[disabled],
.btn-default[disabled]:hover,
.btn-default[disabled]:focus,
.btn-default[disabled].focus,
.btn-default[disabled]:active,
.btn-default[disabled].active,
fieldset[disabled] .btn-default,
fieldset[disabled] .btn-default:hover,
fieldset[disabled] .btn-default:focus,
fieldset[disabled] .btn-default.focus,
fieldset[disabled] .btn-default:active,
fieldset[disabled] .btn-default.active {
  background-color: #fff;
  border-color: #ccc
}

.btn-default .badge {
  color: #fff;
  background-color: #333
}

.btn-primary {
  color: #fff;
  background-color: #428bca;
  border-color: #357ebd
}

.btn-primary:focus,
.btn-primary.focus {
  color: #fff;
  background-color: #3071a9;
  border-color: #193c5a
}

.btn-primary:hover {
  color: #fff;
  background-color: #3071a9;
  border-color: #285e8e
}

.btn-primary:active,
.btn-primary.active,
.open>.btn-primary.dropdown-toggle {
  color: #fff;
  background-color: #3071a9;
  border-color: #285e8e
}

.btn-primary:active:hover,
.btn-primary:active:focus,
.btn-primary:active.focus,
.btn-primary.active:hover,
.btn-primary.active:focus,
.btn-primary.active.focus,
.open>.btn-primary.dropdown-toggle:hover,
.open>.btn-primary.dropdown-toggle:focus,
.open>.btn-primary.dropdown-toggle.focus {
  color: #fff;
  background-color: #285e8e;
  border-color: #193c5a
}

.btn-primary:active,
.btn-primary.active,
.open>.btn-primary.dropdown-toggle {
  background-image: none
}

.btn-primary.disabled,
.btn-primary.disabled:hover,
.btn-primary.disabled:focus,
.btn-primary.disabled.focus,
.btn-primary.disabled:active,
.btn-primary.disabled.active,
.btn-primary[disabled],
.btn-primary[disabled]:hover,
.btn-primary[disabled]:focus,
.btn-primary[disabled].focus,
.btn-primary[disabled]:active,
.btn-primary[disabled].active,
fieldset[disabled] .btn-primary,
fieldset[disabled] .btn-primary:hover,
fieldset[disabled] .btn-primary:focus,
fieldset[disabled] .btn-primary.focus,
fieldset[disabled] .btn-primary:active,
fieldset[disabled] .btn-primary.active {
  background-color: #428bca;
  border-color: #357ebd
}

.btn-primary .badge {
  color: #428bca;
  background-color: #fff
}

.btn-success {
  color: #fff;
  background-color: #5cb85c;
  border-color: #4cae4c
}

.btn-success:focus,
.btn-success.focus {
  color: #fff;
  background-color: #449d44;
  border-color: #255625
}

.btn-success:hover {
  color: #fff;
  background-color: #449d44;
  border-color: #398439
}

.btn-success:active,
.btn-success.active,
.open>.btn-success.dropdown-toggle {
  color: #fff;
  background-color: #449d44;
  border-color: #398439
}

.btn-success:active:hover,
.btn-success:active:focus,
.btn-success:active.focus,
.btn-success.active:hover,
.btn-success.active:focus,
.btn-success.active.focus,
.open>.btn-success.dropdown-toggle:hover,
.open>.btn-success.dropdown-toggle:focus,
.open>.btn-success.dropdown-toggle.focus {
  color: #fff;
  background-color: #398439;
  border-color: #255625
}

.btn-success:active,
.btn-success.active,
.open>.btn-success.dropdown-toggle {
  background-image: none
}

.btn-success.disabled,
.btn-success.disabled:hover,
.btn-success.disabled:focus,
.btn-success.disabled.focus,
.btn-success.disabled:active,
.btn-success.disabled.active,
.btn-success[disabled],
.btn-success[disabled]:hover,
.btn-success[disabled]:focus,
.btn-success[disabled].focus,
.btn-success[disabled]:active,
.btn-success[disabled].active,
fieldset[disabled] .btn-success,
fieldset[disabled] .btn-success:hover,
fieldset[disabled] .btn-success:focus,
fieldset[disabled] .btn-success.focus,
fieldset[disabled] .btn-success:active,
fieldset[disabled] .btn-success.active {
  background-color: #5cb85c;
  border-color: #4cae4c
}

.btn-success .badge {
  color: #5cb85c;
  background-color: #fff
}

.btn-info {
  color: #fff;
  background-color: #5bc0de;
  border-color: #46b8da
}

.btn-info:focus,
.btn-info.focus {
  color: #fff;
  background-color: #31b0d5;
  border-color: #1b6d85
}

.btn-info:hover {
  color: #fff;
  background-color: #31b0d5;
  border-color: #269abc
}

.btn-info:active,
.btn-info.active,
.open>.btn-info.dropdown-toggle {
  color: #fff;
  background-color: #31b0d5;
  border-color: #269abc
}

.btn-info:active:hover,
.btn-info:active:focus,
.btn-info:active.focus,
.btn-info.active:hover,
.btn-info.active:focus,
.btn-info.active.focus,
.open>.btn-info.dropdown-toggle:hover,
.open>.btn-info.dropdown-toggle:focus,
.open>.btn-info.dropdown-toggle.focus {
  color: #fff;
  background-color: #269abc;
  border-color: #1b6d85
}

.btn-info:active,
.btn-info.active,
.open>.btn-info.dropdown-toggle {
  background-image: none
}

.btn-info.disabled,
.btn-info.disabled:hover,
.btn-info.disabled:focus,
.btn-info.disabled.focus,
.btn-info.disabled:active,
.btn-info.disabled.active,
.btn-info[disabled],
.btn-info[disabled]:hover,
.btn-info[disabled]:focus,
.btn-info[disabled].focus,
.btn-info[disabled]:active,
.btn-info[disabled].active,
fieldset[disabled] .btn-info,
fieldset[disabled] .btn-info:hover,
fieldset[disabled] .btn-info:focus,
fieldset[disabled] .btn-info.focus,
fieldset[disabled] .btn-info:active,
fieldset[disabled] .btn-info.active {
  background-color: #5bc0de;
  border-color: #46b8da
}

.btn-info .badge {
  color: #5bc0de;
  background-color: #fff
}

.btn-warning {
  color: #fff;
  background-color: #f0ad4e;
  border-color: #eea236
}

.btn-warning:focus,
.btn-warning.focus {
  color: #fff;
  background-color: #ec971f;
  border-color: #985f0d
}

.btn-warning:hover {
  color: #fff;
  background-color: #ec971f;
  border-color: #d58512
}

.btn-warning:active,
.btn-warning.active,
.open>.btn-warning.dropdown-toggle {
  color: #fff;
  background-color: #ec971f;
  border-color: #d58512
}

.btn-warning:active:hover,
.btn-warning:active:focus,
.btn-warning:active.focus,
.btn-warning.active:hover,
.btn-warning.active:focus,
.btn-warning.active.focus,
.open>.btn-warning.dropdown-toggle:hover,
.open>.btn-warning.dropdown-toggle:focus,
.open>.btn-warning.dropdown-toggle.focus {
  color: #fff;
  background-color: #d58512;
  border-color: #985f0d
}

.btn-warning:active,
.btn-warning.active,
.open>.btn-warning.dropdown-toggle {
  background-image: none
}

.btn-warning.disabled,
.btn-warning.disabled:hover,
.btn-warning.disabled:focus,
.btn-warning.disabled.focus,
.btn-warning.disabled:active,
.btn-warning.disabled.active,
.btn-warning[disabled],
.btn-warning[disabled]:hover,
.btn-warning[disabled]:focus,
.btn-warning[disabled].focus,
.btn-warning[disabled]:active,
.btn-warning[disabled].active,
fieldset[disabled] .btn-warning,
fieldset[disabled] .btn-warning:hover,
fieldset[disabled] .btn-warning:focus,
fieldset[disabled] .btn-warning.focus,
fieldset[disabled] .btn-warning:active,
fieldset[disabled] .btn-warning.active {
  background-color: #f0ad4e;
  border-color: #eea236
}

.btn-warning .badge {
  color: #f0ad4e;
  background-color: #fff
}

.btn-danger {
  color: #fff;
  background-color: #d9534f;
  border-color: #d43f3a
}

.btn-danger:focus,
.btn-danger.focus {
  color: #fff;
  background-color: #c9302c;
  border-color: #761c19
}

.btn-danger:hover {
  color: #fff;
  background-color: #c9302c;
  border-color: #ac2925
}

.btn-danger:active,
.btn-danger.active,
.open>.btn-danger.dropdown-toggle {
  color: #fff;
  background-color: #c9302c;
  border-color: #ac2925
}

.btn-danger:active:hover,
.btn-danger:active:focus,
.btn-danger:active.focus,
.btn-danger.active:hover,
.btn-danger.active:focus,
.btn-danger.active.focus,
.open>.btn-danger.dropdown-toggle:hover,
.open>.btn-danger.dropdown-toggle:focus,
.open>.btn-danger.dropdown-toggle.focus {
  color: #fff;
  background-color: #ac2925;
  border-color: #761c19
}

.btn-danger:active,
.btn-danger.active,
.open>.btn-danger.dropdown-toggle {
  background-image: none
}

.btn-danger.disabled,
.btn-danger.disabled:hover,
.btn-danger.disabled:focus,
.btn-danger.disabled.focus,
.btn-danger.disabled:active,
.btn-danger.disabled.active,
.btn-danger[disabled],
.btn-danger[disabled]:hover,
.btn-danger[disabled]:focus,
.btn-danger[disabled].focus,
.btn-danger[disabled]:active,
.btn-danger[disabled].active,
fieldset[disabled] .btn-danger,
fieldset[disabled] .btn-danger:hover,
fieldset[disabled] .btn-danger:focus,
fieldset[disabled] .btn-danger.focus,
fieldset[disabled] .btn-danger:active,
fieldset[disabled] .btn-danger.active {
  background-color: #d9534f;
  border-color: #d43f3a
}

.btn-danger .badge {
  color: #d9534f;
  background-color: #fff
}

.btn-link {
  color: #428bca;
  font-weight: normal;
  border-radius: 0
}

.btn-link,
.btn-link:active,
.btn-link.active,
.btn-link[disabled],
fieldset[disabled] .btn-link {
  background-color: transparent;
  box-shadow: none
}

.btn-link,
.btn-link:hover,
.btn-link:focus,
.btn-link:active {
  border-color: transparent
}

.btn-link:hover,
.btn-link:focus {
  color: #2a6496;
  text-decoration: underline;
  background-color: transparent
}

.btn-link[disabled]:hover,
.btn-link[disabled]:focus,
fieldset[disabled] .btn-link:hover,
fieldset[disabled] .btn-link:focus {
  color: #777;
  text-decoration: none
}

.btn-lg {
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.3333333;
  border-radius: 6px
}

.btn-sm {
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
  border-radius: 3px
}

.btn-xs {
  padding: 1px 5px;
  font-size: 12px;
  line-height: 1.5;
  border-radius: 3px
}

.btn-block {
  display: block;
  width: 100%
}

.btn-block+.btn-block {
  margin-top: 5px
}

input[type="submit"].btn-block,
input[type="reset"].btn-block,
input[type="button"].btn-block {
  width: 100%
}

.fade {
  opacity: 0;
  -webkit-transition: opacity 0.15s linear;
  transition: opacity 0.15s linear
}

.fade.in {
  opacity: 1
}

.collapse {
  display: none
}

.collapse.in {
  display: block
}

tr.collapse.in {
  display: table-row
}

tbody.collapse.in {
  display: table-row-group
}

.collapsing {
  position: relative;
  height: 0;
  overflow: hidden;
  -webkit-transition-property: height, visibility;
  transition-property: height, visibility;
  -webkit-transition-duration: 0.35s;
  transition-duration: 0.35s;
  -webkit-transition-timing-function: ease;
  transition-timing-function: ease
}

.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both
}

.animated.infinite {
  -webkit-animation-iteration-count: infinite;
  animation-iteration-count: infinite
}

.animated.hinge {
  -webkit-animation-duration: 2s;
  animation-duration: 2s
}

.animated.bounceIn,
.animated.bounceOut,
.animated.flipOutX,
.animated.flipOutY {
  -webkit-animation-duration: .75s;
  animation-duration: .75s
}

@-webkit-keyframes bounce {
  100%, 20%, 53%, 80%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  40%,
  43% {
    -webkit-animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    -webkit-transform: translate3d(0, -30px, 0);
    transform: translate3d(0, -30px, 0)
  }
  70% {
    -webkit-animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    -webkit-transform: translate3d(0, -15px, 0);
    transform: translate3d(0, -15px, 0)
  }
  90% {
    -webkit-transform: translate3d(0, -4px, 0);
    transform: translate3d(0, -4px, 0)
  }
}

@keyframes bounce {
  100%, 20%, 53%, 80%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  40%,
  43% {
    -webkit-animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    -webkit-transform: translate3d(0, -30px, 0);
    transform: translate3d(0, -30px, 0)
  }
  70% {
    -webkit-animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    animation-timing-function: cubic-bezier(0.755, 0.05, 0.855, 0.06);
    -webkit-transform: translate3d(0, -15px, 0);
    transform: translate3d(0, -15px, 0)
  }
  90% {
    -webkit-transform: translate3d(0, -4px, 0);
    transform: translate3d(0, -4px, 0)
  }
}

.bounce {
  -webkit-animation-name: bounce;
  animation-name: bounce;
  -webkit-transform-origin: center bottom;
  -ms-transform-origin: center bottom;
  transform-origin: center bottom
}

@-webkit-keyframes flash {
  100%, 50%, from {
    opacity: 1
  }
  25%,
  75% {
    opacity: 0
  }
}

@keyframes flash {
  100%, 50%, from {
    opacity: 1
  }
  25%,
  75% {
    opacity: 0
  }
}

.flash {
  -webkit-animation-name: flash;
  animation-name: flash
}

@-webkit-keyframes pulse {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
  50% {
    -webkit-transform: scale3d(1.05, 1.05, 1.05);
    transform: scale3d(1.05, 1.05, 1.05)
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

@keyframes pulse {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
  50% {
    -webkit-transform: scale3d(1.05, 1.05, 1.05);
    transform: scale3d(1.05, 1.05, 1.05)
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

.pulse {
  -webkit-animation-name: pulse;
  animation-name: pulse
}

@-webkit-keyframes rubberBand {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1)
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1)
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1)
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1)
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1)
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

@keyframes rubberBand {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1)
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1)
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1)
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1)
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1)
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

.rubberBand {
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand
}

@-webkit-keyframes shake {
  100%, from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  10%,
  30%,
  50%,
  70%,
  90% {
    -webkit-transform: translate3d(-10px, 0, 0);
    transform: translate3d(-10px, 0, 0)
  }
  20%,
  40%,
  60%,
  80% {
    -webkit-transform: translate3d(10px, 0, 0);
    transform: translate3d(10px, 0, 0)
  }
}

@keyframes shake {
  100%, from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  10%,
  30%,
  50%,
  70%,
  90% {
    -webkit-transform: translate3d(-10px, 0, 0);
    transform: translate3d(-10px, 0, 0)
  }
  20%,
  40%,
  60%,
  80% {
    -webkit-transform: translate3d(10px, 0, 0);
    transform: translate3d(10px, 0, 0)
  }
}

.shake {
  -webkit-animation-name: shake;
  animation-name: shake
}

@-webkit-keyframes swing {
  20% {
    -webkit-transform: rotate3d(0, 0, 1, 15deg);
    transform: rotate3d(0, 0, 1, 15deg)
  }
  40% {
    -webkit-transform: rotate3d(0, 0, 1, -10deg);
    transform: rotate3d(0, 0, 1, -10deg)
  }
  60% {
    -webkit-transform: rotate3d(0, 0, 1, 5deg);
    transform: rotate3d(0, 0, 1, 5deg)
  }
  80% {
    -webkit-transform: rotate3d(0, 0, 1, -5deg);
    transform: rotate3d(0, 0, 1, -5deg)
  }
  100% {
    -webkit-transform: rotate3d(0, 0, 1, 0deg);
    transform: rotate3d(0, 0, 1, 0deg)
  }
}

@keyframes swing {
  20% {
    -webkit-transform: rotate3d(0, 0, 1, 15deg);
    transform: rotate3d(0, 0, 1, 15deg)
  }
  40% {
    -webkit-transform: rotate3d(0, 0, 1, -10deg);
    transform: rotate3d(0, 0, 1, -10deg)
  }
  60% {
    -webkit-transform: rotate3d(0, 0, 1, 5deg);
    transform: rotate3d(0, 0, 1, 5deg)
  }
  80% {
    -webkit-transform: rotate3d(0, 0, 1, -5deg);
    transform: rotate3d(0, 0, 1, -5deg)
  }
  100% {
    -webkit-transform: rotate3d(0, 0, 1, 0deg);
    transform: rotate3d(0, 0, 1, 0deg)
  }
}

.swing {
  -webkit-transform-origin: top center;
  -ms-transform-origin: top center;
  transform-origin: top center;
  -webkit-animation-name: swing;
  animation-name: swing
}

@-webkit-keyframes tada {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
  10%,
  20% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg)
  }
  30%,
  50%,
  70%,
  90% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg)
  }
  40%,
  60%,
  80% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg)
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

@keyframes tada {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
  10%,
  20% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg)
  }
  30%,
  50%,
  70%,
  90% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg)
  }
  40%,
  60%,
  80% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg)
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

.tada {
  -webkit-animation-name: tada;
  animation-name: tada
}

@-webkit-keyframes wobble {
  from {
    -webkit-transform: none;
    transform: none
  }
  15% {
    -webkit-transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
    transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg)
  }
  30% {
    -webkit-transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
    transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg)
  }
  45% {
    -webkit-transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
    transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg)
  }
  60% {
    -webkit-transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
    transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg)
  }
  75% {
    -webkit-transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
    transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

@keyframes wobble {
  from {
    -webkit-transform: none;
    transform: none
  }
  15% {
    -webkit-transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
    transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg)
  }
  30% {
    -webkit-transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
    transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg)
  }
  45% {
    -webkit-transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
    transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg)
  }
  60% {
    -webkit-transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
    transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg)
  }
  75% {
    -webkit-transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
    transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

.wobble {
  -webkit-animation-name: wobble;
  animation-name: wobble
}

@-webkit-keyframes jello {
  100%, 11.1%, from {
    -webkit-transform: none;
    transform: none
  }
  22.2% {
    -webkit-transform: skewX(-12.5deg) skewY(-12.5deg);
    transform: skewX(-12.5deg) skewY(-12.5deg)
  }
  33.3% {
    -webkit-transform: skewX(6.25deg) skewY(6.25deg);
    transform: skewX(6.25deg) skewY(6.25deg)
  }
  44.4% {
    -webkit-transform: skewX(-3.125deg) skewY(-3.125deg);
    transform: skewX(-3.125deg) skewY(-3.125deg)
  }
  55.5% {
    -webkit-transform: skewX(1.5625deg) skewY(1.5625deg);
    transform: skewX(1.5625deg) skewY(1.5625deg)
  }
  66.6% {
    -webkit-transform: skewX(-0.78125deg) skewY(-0.78125deg);
    transform: skewX(-0.78125deg) skewY(-0.78125deg)
  }
  77.7% {
    -webkit-transform: skewX(0.390625deg) skewY(0.390625deg);
    transform: skewX(0.390625deg) skewY(0.390625deg)
  }
  88.8% {
    -webkit-transform: skewX(-0.1953125deg) skewY(-0.1953125deg);
    transform: skewX(-0.1953125deg) skewY(-0.1953125deg)
  }
}

@keyframes jello {
  100%, 11.1%, from {
    -webkit-transform: none;
    transform: none
  }
  22.2% {
    -webkit-transform: skewX(-12.5deg) skewY(-12.5deg);
    transform: skewX(-12.5deg) skewY(-12.5deg)
  }
  33.3% {
    -webkit-transform: skewX(6.25deg) skewY(6.25deg);
    transform: skewX(6.25deg) skewY(6.25deg)
  }
  44.4% {
    -webkit-transform: skewX(-3.125deg) skewY(-3.125deg);
    transform: skewX(-3.125deg) skewY(-3.125deg)
  }
  55.5% {
    -webkit-transform: skewX(1.5625deg) skewY(1.5625deg);
    transform: skewX(1.5625deg) skewY(1.5625deg)
  }
  66.6% {
    -webkit-transform: skewX(-0.78125deg) skewY(-0.78125deg);
    transform: skewX(-0.78125deg) skewY(-0.78125deg)
  }
  77.7% {
    -webkit-transform: skewX(0.390625deg) skewY(0.390625deg);
    transform: skewX(0.390625deg) skewY(0.390625deg)
  }
  88.8% {
    -webkit-transform: skewX(-0.1953125deg) skewY(-0.1953125deg);
    transform: skewX(-0.1953125deg) skewY(-0.1953125deg)
  }
}

.jello {
  -webkit-animation-name: jello;
  animation-name: jello;
  -webkit-transform-origin: center;
  -ms-transform-origin: center;
  transform-origin: center
}

@-webkit-keyframes bounceIn {
  100%, 20%, 40%, 60%, 80%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
  20% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1);
    transform: scale3d(1.1, 1.1, 1.1)
  }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
    transform: scale3d(0.9, 0.9, 0.9)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
    transform: scale3d(1.03, 1.03, 1.03)
  }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
    transform: scale3d(0.97, 0.97, 0.97)
  }
  100% {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

@keyframes bounceIn {
  100%, 20%, 40%, 60%, 80%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
  20% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1);
    transform: scale3d(1.1, 1.1, 1.1)
  }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
    transform: scale3d(0.9, 0.9, 0.9)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
    transform: scale3d(1.03, 1.03, 1.03)
  }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
    transform: scale3d(0.97, 0.97, 0.97)
  }
  100% {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1)
  }
}

.bounceIn {
  -webkit-animation-name: bounceIn;
  animation-name: bounceIn
}

@-webkit-keyframes bounceInDown {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -3000px, 0);
    transform: translate3d(0, -3000px, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(0, 25px, 0);
    transform: translate3d(0, 25px, 0)
  }
  75% {
    -webkit-transform: translate3d(0, -10px, 0);
    transform: translate3d(0, -10px, 0)
  }
  90% {
    -webkit-transform: translate3d(0, 5px, 0);
    transform: translate3d(0, 5px, 0)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

@keyframes bounceInDown {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -3000px, 0);
    transform: translate3d(0, -3000px, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(0, 25px, 0);
    transform: translate3d(0, 25px, 0)
  }
  75% {
    -webkit-transform: translate3d(0, -10px, 0);
    transform: translate3d(0, -10px, 0)
  }
  90% {
    -webkit-transform: translate3d(0, 5px, 0);
    transform: translate3d(0, 5px, 0)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

.bounceInDown {
  -webkit-animation-name: bounceInDown;
  animation-name: bounceInDown
}

@-webkit-keyframes bounceInLeft {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  0% {
    opacity: 0;
    -webkit-transform: translate3d(-3000px, 0, 0);
    transform: translate3d(-3000px, 0, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(25px, 0, 0);
    transform: translate3d(25px, 0, 0)
  }
  75% {
    -webkit-transform: translate3d(-10px, 0, 0);
    transform: translate3d(-10px, 0, 0)
  }
  90% {
    -webkit-transform: translate3d(5px, 0, 0);
    transform: translate3d(5px, 0, 0)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

@keyframes bounceInLeft {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  0% {
    opacity: 0;
    -webkit-transform: translate3d(-3000px, 0, 0);
    transform: translate3d(-3000px, 0, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(25px, 0, 0);
    transform: translate3d(25px, 0, 0)
  }
  75% {
    -webkit-transform: translate3d(-10px, 0, 0);
    transform: translate3d(-10px, 0, 0)
  }
  90% {
    -webkit-transform: translate3d(5px, 0, 0);
    transform: translate3d(5px, 0, 0)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

.bounceInLeft {
  -webkit-animation-name: bounceInLeft;
  animation-name: bounceInLeft
}

@-webkit-keyframes bounceInRight {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  from {
    opacity: 0;
    -webkit-transform: translate3d(3000px, 0, 0);
    transform: translate3d(3000px, 0, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(-25px, 0, 0);
    transform: translate3d(-25px, 0, 0)
  }
  75% {
    -webkit-transform: translate3d(10px, 0, 0);
    transform: translate3d(10px, 0, 0)
  }
  90% {
    -webkit-transform: translate3d(-5px, 0, 0);
    transform: translate3d(-5px, 0, 0)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

@keyframes bounceInRight {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  from {
    opacity: 0;
    -webkit-transform: translate3d(3000px, 0, 0);
    transform: translate3d(3000px, 0, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(-25px, 0, 0);
    transform: translate3d(-25px, 0, 0)
  }
  75% {
    -webkit-transform: translate3d(10px, 0, 0);
    transform: translate3d(10px, 0, 0)
  }
  90% {
    -webkit-transform: translate3d(-5px, 0, 0);
    transform: translate3d(-5px, 0, 0)
  }
  100% {
    -webkit-transform: none;
    transform: none
  }
}

.bounceInRight {
  -webkit-animation-name: bounceInRight;
  animation-name: bounceInRight
}

@-webkit-keyframes bounceInUp {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 3000px, 0);
    transform: translate3d(0, 3000px, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(0, -20px, 0);
    transform: translate3d(0, -20px, 0)
  }
  75% {
    -webkit-transform: translate3d(0, 10px, 0);
    transform: translate3d(0, 10px, 0)
  }
  90% {
    -webkit-transform: translate3d(0, -5px, 0);
    transform: translate3d(0, -5px, 0)
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

@keyframes bounceInUp {
  100%, 60%, 75%, 90%, from {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1)
  }
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 3000px, 0);
    transform: translate3d(0, 3000px, 0)
  }
  60% {
    opacity: 1;
    -webkit-transform: translate3d(0, -20px, 0);
    transform: translate3d(0, -20px, 0)
  }
  75% {
    -webkit-transform: translate3d(0, 10px, 0);
    transform: translate3d(0, 10px, 0)
  }
  90% {
    -webkit-transform: translate3d(0, -5px, 0);
    transform: translate3d(0, -5px, 0)
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

.bounceInUp {
  -webkit-animation-name: bounceInUp;
  animation-name: bounceInUp
}

@-webkit-keyframes bounceOut {
  20% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
    transform: scale3d(0.9, 0.9, 0.9)
  }
  50%,
  55% {
    opacity: 1;
    -webkit-transform: scale3d(1.1, 1.1, 1.1);
    transform: scale3d(1.1, 1.1, 1.1)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
}

@keyframes bounceOut {
  20% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
    transform: scale3d(0.9, 0.9, 0.9)
  }
  50%,
  55% {
    opacity: 1;
    -webkit-transform: scale3d(1.1, 1.1, 1.1);
    transform: scale3d(1.1, 1.1, 1.1)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
}

.bounceOut {
  -webkit-animation-name: bounceOut;
  animation-name: bounceOut
}

@-webkit-keyframes bounceOutDown {
  20% {
    -webkit-transform: translate3d(0, 10px, 0);
    transform: translate3d(0, 10px, 0)
  }
  40%,
  45% {
    opacity: 1;
    -webkit-transform: translate3d(0, -20px, 0);
    transform: translate3d(0, -20px, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, 2000px, 0);
    transform: translate3d(0, 2000px, 0)
  }
}

@keyframes bounceOutDown {
  20% {
    -webkit-transform: translate3d(0, 10px, 0);
    transform: translate3d(0, 10px, 0)
  }
  40%,
  45% {
    opacity: 1;
    -webkit-transform: translate3d(0, -20px, 0);
    transform: translate3d(0, -20px, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, 2000px, 0);
    transform: translate3d(0, 2000px, 0)
  }
}

.bounceOutDown {
  -webkit-animation-name: bounceOutDown;
  animation-name: bounceOutDown
}

@-webkit-keyframes bounceOutLeft {
  20% {
    opacity: 1;
    -webkit-transform: translate3d(20px, 0, 0);
    transform: translate3d(20px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(-2000px, 0, 0);
    transform: translate3d(-2000px, 0, 0)
  }
}

@keyframes bounceOutLeft {
  20% {
    opacity: 1;
    -webkit-transform: translate3d(20px, 0, 0);
    transform: translate3d(20px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(-2000px, 0, 0);
    transform: translate3d(-2000px, 0, 0)
  }
}

.bounceOutLeft {
  -webkit-animation-name: bounceOutLeft;
  animation-name: bounceOutLeft
}

@-webkit-keyframes bounceOutRight {
  20% {
    opacity: 1;
    -webkit-transform: translate3d(-20px, 0, 0);
    transform: translate3d(-20px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(2000px, 0, 0);
    transform: translate3d(2000px, 0, 0)
  }
}

@keyframes bounceOutRight {
  20% {
    opacity: 1;
    -webkit-transform: translate3d(-20px, 0, 0);
    transform: translate3d(-20px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(2000px, 0, 0);
    transform: translate3d(2000px, 0, 0)
  }
}

.bounceOutRight {
  -webkit-animation-name: bounceOutRight;
  animation-name: bounceOutRight
}

@-webkit-keyframes bounceOutUp {
  20% {
    -webkit-transform: translate3d(0, -10px, 0);
    transform: translate3d(0, -10px, 0)
  }
  40%,
  45% {
    opacity: 1;
    -webkit-transform: translate3d(0, 20px, 0);
    transform: translate3d(0, 20px, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -2000px, 0);
    transform: translate3d(0, -2000px, 0)
  }
}

@keyframes bounceOutUp {
  20% {
    -webkit-transform: translate3d(0, -10px, 0);
    transform: translate3d(0, -10px, 0)
  }
  40%,
  45% {
    opacity: 1;
    -webkit-transform: translate3d(0, 20px, 0);
    transform: translate3d(0, 20px, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -2000px, 0);
    transform: translate3d(0, -2000px, 0)
  }
}

.bounceOutUp {
  -webkit-animation-name: bounceOutUp;
  animation-name: bounceOutUp
}

@-webkit-keyframes fadeIn {
  from {
    opacity: 0
  }
  100% {
    opacity: 1
  }
}

@keyframes fadeIn {
  from {
    opacity: 0
  }
  100% {
    opacity: 1
  }
}

.fadeIn {
  -webkit-animation-name: fadeIn;
  animation-name: fadeIn
}

@-webkit-keyframes fadeInDown {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown
}

@-webkit-keyframes fadeInDownBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -2000px, 0);
    transform: translate3d(0, -2000px, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInDownBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -2000px, 0);
    transform: translate3d(0, -2000px, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInDownBig {
  -webkit-animation-name: fadeInDownBig;
  animation-name: fadeInDownBig
}

@-webkit-keyframes fadeInLeft {
  from {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInLeft {
  from {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInLeft {
  -webkit-animation-name: fadeInLeft;
  animation-name: fadeInLeft
}

@-webkit-keyframes fadeInLeftBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(-2000px, 0, 0);
    transform: translate3d(-2000px, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInLeftBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(-2000px, 0, 0);
    transform: translate3d(-2000px, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInLeftBig {
  -webkit-animation-name: fadeInLeftBig;
  animation-name: fadeInLeftBig
}

@-webkit-keyframes fadeInRight {
  from {
    opacity: 0;
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInRight {
  from {
    opacity: 0;
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInRight {
  -webkit-animation-name: fadeInRight;
  animation-name: fadeInRight
}

@-webkit-keyframes fadeInRightBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(2000px, 0, 0);
    transform: translate3d(2000px, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInRightBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(2000px, 0, 0);
    transform: translate3d(2000px, 0, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInRightBig {
  -webkit-animation-name: fadeInRightBig;
  animation-name: fadeInRightBig
}

@-webkit-keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp
}

@-webkit-keyframes fadeInUpBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 2000px, 0);
    transform: translate3d(0, 2000px, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes fadeInUpBig {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 2000px, 0);
    transform: translate3d(0, 2000px, 0)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.fadeInUpBig {
  -webkit-animation-name: fadeInUpBig;
  animation-name: fadeInUpBig
}

@-webkit-keyframes fadeOut {
  from {
    opacity: 1
  }
  100% {
    opacity: 0
  }
}

@keyframes fadeOut {
  from {
    opacity: 1
  }
  100% {
    opacity: 0
  }
}

.fadeOut {
  -webkit-animation-name: fadeOut;
  animation-name: fadeOut
}

@-webkit-keyframes fadeOutDown {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0)
  }
}

@keyframes fadeOutDown {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0)
  }
}

.fadeOutDown {
  -webkit-animation-name: fadeOutDown;
  animation-name: fadeOutDown
}

@-webkit-keyframes fadeOutDownBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, 2000px, 0);
    transform: translate3d(0, 2000px, 0)
  }
}

@keyframes fadeOutDownBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, 2000px, 0);
    transform: translate3d(0, 2000px, 0)
  }
}

.fadeOutDownBig {
  -webkit-animation-name: fadeOutDownBig;
  animation-name: fadeOutDownBig
}

@-webkit-keyframes fadeOutLeft {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0)
  }
}

@keyframes fadeOutLeft {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0)
  }
}

.fadeOutLeft {
  -webkit-animation-name: fadeOutLeft;
  animation-name: fadeOutLeft
}

@-webkit-keyframes fadeOutLeftBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(-2000px, 0, 0);
    transform: translate3d(-2000px, 0, 0)
  }
}

@keyframes fadeOutLeftBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(-2000px, 0, 0);
    transform: translate3d(-2000px, 0, 0)
  }
}

.fadeOutLeftBig {
  -webkit-animation-name: fadeOutLeftBig;
  animation-name: fadeOutLeftBig
}

@-webkit-keyframes fadeOutRight {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0)
  }
}

@keyframes fadeOutRight {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0)
  }
}

.fadeOutRight {
  -webkit-animation-name: fadeOutRight;
  animation-name: fadeOutRight
}

@-webkit-keyframes fadeOutRightBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(2000px, 0, 0);
    transform: translate3d(2000px, 0, 0)
  }
}

@keyframes fadeOutRightBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(2000px, 0, 0);
    transform: translate3d(2000px, 0, 0)
  }
}

.fadeOutRightBig {
  -webkit-animation-name: fadeOutRightBig;
  animation-name: fadeOutRightBig
}

@-webkit-keyframes fadeOutUp {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0)
  }
}

@keyframes fadeOutUp {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0)
  }
}

.fadeOutUp {
  -webkit-animation-name: fadeOutUp;
  animation-name: fadeOutUp
}

@-webkit-keyframes fadeOutUpBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -2000px, 0);
    transform: translate3d(0, -2000px, 0)
  }
}

@keyframes fadeOutUpBig {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -2000px, 0);
    transform: translate3d(0, -2000px, 0)
  }
}

.fadeOutUpBig {
  -webkit-animation-name: fadeOutUpBig;
  animation-name: fadeOutUpBig
}

@-webkit-keyframes flip {
  from {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -360deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -360deg);
    -webkit-animation-timing-function: ease-out;
    animation-timing-function: ease-out
  }
  40% {
    -webkit-transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -190deg);
    transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -190deg);
    -webkit-animation-timing-function: ease-out;
    animation-timing-function: ease-out
  }
  50% {
    -webkit-transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -170deg);
    transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -170deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  80% {
    -webkit-transform: perspective(400px) scale3d(0.95, 0.95, 0.95);
    transform: perspective(400px) scale3d(0.95, 0.95, 0.95);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
}

@keyframes flip {
  from {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -360deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -360deg);
    -webkit-animation-timing-function: ease-out;
    animation-timing-function: ease-out
  }
  40% {
    -webkit-transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -190deg);
    transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -190deg);
    -webkit-animation-timing-function: ease-out;
    animation-timing-function: ease-out
  }
  50% {
    -webkit-transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -170deg);
    transform: perspective(400px) translate3d(0, 0, 150px) rotate3d(0, 1, 0, -170deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  80% {
    -webkit-transform: perspective(400px) scale3d(0.95, 0.95, 0.95);
    transform: perspective(400px) scale3d(0.95, 0.95, 0.95);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
}

.animated.flip {
  -webkit-backface-visibility: visible;
  backface-visibility: visible;
  -webkit-animation-name: flip;
  animation-name: flip
}

@-webkit-keyframes flipInX {
  from {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
    opacity: 0
  }
  40% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  60% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    opacity: 1
  }
  80% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -5deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -5deg)
  }
  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
}

@keyframes flipInX {
  from {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
    opacity: 0
  }
  40% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  60% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    opacity: 1
  }
  80% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -5deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -5deg)
  }
  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
}

.flipInX {
  -webkit-backface-visibility: visible !important;
  backface-visibility: visible !important;
  -webkit-animation-name: flipInX;
  animation-name: flipInX
}

@-webkit-keyframes flipInY {
  from {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
    opacity: 0
  }
  40% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -20deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -20deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  60% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 10deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 10deg);
    opacity: 1
  }
  80% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -5deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -5deg)
  }
  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
}

@keyframes flipInY {
  from {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in;
    opacity: 0
  }
  40% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -20deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -20deg);
    -webkit-animation-timing-function: ease-in;
    animation-timing-function: ease-in
  }
  60% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 10deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 10deg);
    opacity: 1
  }
  80% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -5deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -5deg)
  }
  100% {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
}

.flipInY {
  -webkit-backface-visibility: visible !important;
  backface-visibility: visible !important;
  -webkit-animation-name: flipInY;
  animation-name: flipInY
}

@-webkit-keyframes flipOutX {
  from {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
  30% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    opacity: 1
  }
  100% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    opacity: 0
  }
}

@keyframes flipOutX {
  from {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
  30% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    opacity: 1
  }
  100% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    opacity: 0
  }
}

.flipOutX {
  -webkit-animation-name: flipOutX;
  animation-name: flipOutX;
  -webkit-backface-visibility: visible !important;
  backface-visibility: visible !important
}

@-webkit-keyframes flipOutY {
  from {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
  30% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -15deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -15deg);
    opacity: 1
  }
  100% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    opacity: 0
  }
}

@keyframes flipOutY {
  from {
    -webkit-transform: perspective(400px);
    transform: perspective(400px)
  }
  30% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -15deg);
    transform: perspective(400px) rotate3d(0, 1, 0, -15deg);
    opacity: 1
  }
  100% {
    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
    opacity: 0
  }
}

.flipOutY {
  -webkit-backface-visibility: visible !important;
  backface-visibility: visible !important;
  -webkit-animation-name: flipOutY;
  animation-name: flipOutY
}

@-webkit-keyframes lightSpeedIn {
  from {
    -webkit-transform: translate3d(100%, 0, 0) skewX(-30deg);
    transform: translate3d(100%, 0, 0) skewX(-30deg);
    opacity: 0
  }
  60% {
    -webkit-transform: skewX(20deg);
    transform: skewX(20deg);
    opacity: 1
  }
  80% {
    -webkit-transform: skewX(-5deg);
    transform: skewX(-5deg);
    opacity: 1
  }
  100% {
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

@keyframes lightSpeedIn {
  from {
    -webkit-transform: translate3d(100%, 0, 0) skewX(-30deg);
    transform: translate3d(100%, 0, 0) skewX(-30deg);
    opacity: 0
  }
  60% {
    -webkit-transform: skewX(20deg);
    transform: skewX(20deg);
    opacity: 1
  }
  80% {
    -webkit-transform: skewX(-5deg);
    transform: skewX(-5deg);
    opacity: 1
  }
  100% {
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

.lightSpeedIn {
  -webkit-animation-name: lightSpeedIn;
  animation-name: lightSpeedIn;
  -webkit-animation-timing-function: ease-out;
  animation-timing-function: ease-out
}

@-webkit-keyframes lightSpeedOut {
  from {
    opacity: 1
  }
  100% {
    -webkit-transform: translate3d(100%, 0, 0) skewX(30deg);
    transform: translate3d(100%, 0, 0) skewX(30deg);
    opacity: 0
  }
}

@keyframes lightSpeedOut {
  from {
    opacity: 1
  }
  100% {
    -webkit-transform: translate3d(100%, 0, 0) skewX(30deg);
    transform: translate3d(100%, 0, 0) skewX(30deg);
    opacity: 0
  }
}

.lightSpeedOut {
  -webkit-animation-name: lightSpeedOut;
  animation-name: lightSpeedOut;
  -webkit-animation-timing-function: ease-in;
  animation-timing-function: ease-in
}

@-webkit-keyframes rotateIn {
  from {
    -webkit-transform-origin: center;
    transform-origin: center;
    -webkit-transform: rotate3d(0, 0, 1, -200deg);
    transform: rotate3d(0, 0, 1, -200deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: center;
    transform-origin: center;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

@keyframes rotateIn {
  from {
    -webkit-transform-origin: center;
    transform-origin: center;
    -webkit-transform: rotate3d(0, 0, 1, -200deg);
    transform: rotate3d(0, 0, 1, -200deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: center;
    transform-origin: center;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

.rotateIn {
  -webkit-animation-name: rotateIn;
  animation-name: rotateIn
}

@-webkit-keyframes rotateInDownLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    transform: rotate3d(0, 0, 1, -45deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

@keyframes rotateInDownLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    transform: rotate3d(0, 0, 1, -45deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

.rotateInDownLeft {
  -webkit-animation-name: rotateInDownLeft;
  animation-name: rotateInDownLeft
}

@-webkit-keyframes rotateInDownRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    transform: rotate3d(0, 0, 1, 45deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

@keyframes rotateInDownRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    transform: rotate3d(0, 0, 1, 45deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

.rotateInDownRight {
  -webkit-animation-name: rotateInDownRight;
  animation-name: rotateInDownRight
}

@-webkit-keyframes rotateInUpLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    transform: rotate3d(0, 0, 1, 45deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

@keyframes rotateInUpLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    transform: rotate3d(0, 0, 1, 45deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

.rotateInUpLeft {
  -webkit-animation-name: rotateInUpLeft;
  animation-name: rotateInUpLeft
}

@-webkit-keyframes rotateInUpRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, -90deg);
    transform: rotate3d(0, 0, 1, -90deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

@keyframes rotateInUpRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, -90deg);
    transform: rotate3d(0, 0, 1, -90deg);
    opacity: 0
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: none;
    transform: none;
    opacity: 1
  }
}

.rotateInUpRight {
  -webkit-animation-name: rotateInUpRight;
  animation-name: rotateInUpRight
}

@-webkit-keyframes rotateOut {
  from {
    -webkit-transform-origin: center;
    transform-origin: center;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: center;
    transform-origin: center;
    -webkit-transform: rotate3d(0, 0, 1, 200deg);
    transform: rotate3d(0, 0, 1, 200deg);
    opacity: 0
  }
}

@keyframes rotateOut {
  from {
    -webkit-transform-origin: center;
    transform-origin: center;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: center;
    transform-origin: center;
    -webkit-transform: rotate3d(0, 0, 1, 200deg);
    transform: rotate3d(0, 0, 1, 200deg);
    opacity: 0
  }
}

.rotateOut {
  -webkit-animation-name: rotateOut;
  animation-name: rotateOut
}

@-webkit-keyframes rotateOutDownLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    transform: rotate3d(0, 0, 1, 45deg);
    opacity: 0
  }
}

@keyframes rotateOutDownLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    transform: rotate3d(0, 0, 1, 45deg);
    opacity: 0
  }
}

.rotateOutDownLeft {
  -webkit-animation-name: rotateOutDownLeft;
  animation-name: rotateOutDownLeft
}

@-webkit-keyframes rotateOutDownRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    transform: rotate3d(0, 0, 1, -45deg);
    opacity: 0
  }
}

@keyframes rotateOutDownRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    transform: rotate3d(0, 0, 1, -45deg);
    opacity: 0
  }
}

.rotateOutDownRight {
  -webkit-animation-name: rotateOutDownRight;
  animation-name: rotateOutDownRight
}

@-webkit-keyframes rotateOutUpLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    transform: rotate3d(0, 0, 1, -45deg);
    opacity: 0
  }
}

@keyframes rotateOutUpLeft {
  from {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: left bottom;
    transform-origin: left bottom;
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    transform: rotate3d(0, 0, 1, -45deg);
    opacity: 0
  }
}

.rotateOutUpLeft {
  -webkit-animation-name: rotateOutUpLeft;
  animation-name: rotateOutUpLeft
}

@-webkit-keyframes rotateOutUpRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, 90deg);
    transform: rotate3d(0, 0, 1, 90deg);
    opacity: 0
  }
}

@keyframes rotateOutUpRight {
  from {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    opacity: 1
  }
  100% {
    -webkit-transform-origin: right bottom;
    transform-origin: right bottom;
    -webkit-transform: rotate3d(0, 0, 1, 90deg);
    transform: rotate3d(0, 0, 1, 90deg);
    opacity: 0
  }
}

.rotateOutUpRight {
  -webkit-animation-name: rotateOutUpRight;
  animation-name: rotateOutUpRight
}

@-webkit-keyframes hinge {
  0% {
    -webkit-transform-origin: top left;
    transform-origin: top left;
    -webkit-animation-timing-function: ease-in-out;
    animation-timing-function: ease-in-out
  }
  20%,
  60% {
    -webkit-transform: rotate3d(0, 0, 1, 80deg);
    transform: rotate3d(0, 0, 1, 80deg);
    -webkit-transform-origin: top left;
    transform-origin: top left;
    -webkit-animation-timing-function: ease-in-out;
    animation-timing-function: ease-in-out
  }
  40%,
  80% {
    -webkit-transform: rotate3d(0, 0, 1, 60deg);
    transform: rotate3d(0, 0, 1, 60deg);
    -webkit-transform-origin: top left;
    transform-origin: top left;
    -webkit-animation-timing-function: ease-in-out;
    animation-timing-function: ease-in-out;
    opacity: 1
  }
  100% {
    -webkit-transform: translate3d(0, 700px, 0);
    transform: translate3d(0, 700px, 0);
    opacity: 0
  }
}

@keyframes hinge {
  0% {
    -webkit-transform-origin: top left;
    transform-origin: top left;
    -webkit-animation-timing-function: ease-in-out;
    animation-timing-function: ease-in-out
  }
  20%,
  60% {
    -webkit-transform: rotate3d(0, 0, 1, 80deg);
    transform: rotate3d(0, 0, 1, 80deg);
    -webkit-transform-origin: top left;
    transform-origin: top left;
    -webkit-animation-timing-function: ease-in-out;
    animation-timing-function: ease-in-out
  }
  40%,
  80% {
    -webkit-transform: rotate3d(0, 0, 1, 60deg);
    transform: rotate3d(0, 0, 1, 60deg);
    -webkit-transform-origin: top left;
    transform-origin: top left;
    -webkit-animation-timing-function: ease-in-out;
    animation-timing-function: ease-in-out;
    opacity: 1
  }
  100% {
    -webkit-transform: translate3d(0, 700px, 0);
    transform: translate3d(0, 700px, 0);
    opacity: 0
  }
}

.hinge {
  -webkit-animation-name: hinge;
  animation-name: hinge
}

@-webkit-keyframes rollIn {
  from {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0) rotate3d(0, 0, 1, -120deg);
    transform: translate3d(-100%, 0, 0) rotate3d(0, 0, 1, -120deg)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

@keyframes rollIn {
  from {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0) rotate3d(0, 0, 1, -120deg);
    transform: translate3d(-100%, 0, 0) rotate3d(0, 0, 1, -120deg)
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none
  }
}

.rollIn {
  -webkit-animation-name: rollIn;
  animation-name: rollIn
}

@-webkit-keyframes rollOut {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(100%, 0, 0) rotate3d(0, 0, 1, 120deg);
    transform: translate3d(100%, 0, 0) rotate3d(0, 0, 1, 120deg)
  }
}

@keyframes rollOut {
  from {
    opacity: 1
  }
  100% {
    opacity: 0;
    -webkit-transform: translate3d(100%, 0, 0) rotate3d(0, 0, 1, 120deg);
    transform: translate3d(100%, 0, 0) rotate3d(0, 0, 1, 120deg)
  }
}

.rollOut {
  -webkit-animation-name: rollOut;
  animation-name: rollOut
}

@-webkit-keyframes zoomIn {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
  50% {
    opacity: 1
  }
}

@keyframes zoomIn {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
  50% {
    opacity: 1
  }
}

.zoomIn {
  -webkit-animation-name: zoomIn;
  animation-name: zoomIn
}

@-webkit-keyframes zoomInDown {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -1000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -1000px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

@keyframes zoomInDown {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -1000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -1000px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

.zoomInDown {
  -webkit-animation-name: zoomInDown;
  animation-name: zoomInDown
}

@-webkit-keyframes zoomInLeft {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(-1000px, 0, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(-1000px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(10px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(10px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

@keyframes zoomInLeft {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(-1000px, 0, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(-1000px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(10px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(10px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

.zoomInLeft {
  -webkit-animation-name: zoomInLeft;
  animation-name: zoomInLeft
}

@-webkit-keyframes zoomInRight {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(1000px, 0, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(1000px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(-10px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(-10px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

@keyframes zoomInRight {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(1000px, 0, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(1000px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(-10px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(-10px, 0, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

.zoomInRight {
  -webkit-animation-name: zoomInRight;
  animation-name: zoomInRight
}

@-webkit-keyframes zoomInUp {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 1000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 1000px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

@keyframes zoomInUp {
  from {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 1000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 1000px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

.zoomInUp {
  -webkit-animation-name: zoomInUp;
  animation-name: zoomInUp
}

@-webkit-keyframes zoomOut {
  from {
    opacity: 1
  }
  50% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
  100% {
    opacity: 0
  }
}

@keyframes zoomOut {
  from {
    opacity: 1
  }
  50% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
    transform: scale3d(0.3, 0.3, 0.3)
  }
  100% {
    opacity: 0
  }
}

.zoomOut {
  -webkit-animation-name: zoomOut;
  animation-name: zoomOut
}

@-webkit-keyframes zoomOutDown {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 2000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 2000px, 0);
    -webkit-transform-origin: center bottom;
    transform-origin: center bottom;
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

@keyframes zoomOutDown {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, -60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 2000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, 2000px, 0);
    -webkit-transform-origin: center bottom;
    transform-origin: center bottom;
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

.zoomOutDown {
  -webkit-animation-name: zoomOutDown;
  animation-name: zoomOutDown
}

@-webkit-keyframes zoomOutLeft {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(42px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(42px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale(0.1) translate3d(-2000px, 0, 0);
    transform: scale(0.1) translate3d(-2000px, 0, 0);
    -webkit-transform-origin: left center;
    transform-origin: left center
  }
}

@keyframes zoomOutLeft {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(42px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(42px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale(0.1) translate3d(-2000px, 0, 0);
    transform: scale(0.1) translate3d(-2000px, 0, 0);
    -webkit-transform-origin: left center;
    transform-origin: left center
  }
}

.zoomOutLeft {
  -webkit-animation-name: zoomOutLeft;
  animation-name: zoomOutLeft
}

@-webkit-keyframes zoomOutRight {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(-42px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(-42px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale(0.1) translate3d(2000px, 0, 0);
    transform: scale(0.1) translate3d(2000px, 0, 0);
    -webkit-transform-origin: right center;
    transform-origin: right center
  }
}

@keyframes zoomOutRight {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(-42px, 0, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(-42px, 0, 0)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale(0.1) translate3d(2000px, 0, 0);
    transform: scale(0.1) translate3d(2000px, 0, 0);
    -webkit-transform-origin: right center;
    transform-origin: right center
  }
}

.zoomOutRight {
  -webkit-animation-name: zoomOutRight;
  animation-name: zoomOutRight
}

@-webkit-keyframes zoomOutUp {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -2000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -2000px, 0);
    -webkit-transform-origin: center bottom;
    transform-origin: center bottom;
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

@keyframes zoomOutUp {
  40% {
    opacity: 1;
    -webkit-transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    transform: scale3d(0.475, 0.475, 0.475) translate3d(0, 60px, 0);
    -webkit-animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19)
  }
  100% {
    opacity: 0;
    -webkit-transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -2000px, 0);
    transform: scale3d(0.1, 0.1, 0.1) translate3d(0, -2000px, 0);
    -webkit-transform-origin: center bottom;
    transform-origin: center bottom;
    -webkit-animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1);
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1)
  }
}

.zoomOutUp {
  -webkit-animation-name: zoomOutUp;
  animation-name: zoomOutUp
}

@-webkit-keyframes slideInDown {
  from {
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

@keyframes slideInDown {
  from {
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

.slideInDown {
  -webkit-animation-name: slideInDown;
  animation-name: slideInDown
}

@-webkit-keyframes slideInLeft {
  from {
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

@keyframes slideInLeft {
  from {
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

.slideInLeft {
  -webkit-animation-name: slideInLeft;
  animation-name: slideInLeft
}

@-webkit-keyframes slideInRight {
  from {
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

@keyframes slideInRight {
  from {
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

.slideInRight {
  -webkit-animation-name: slideInRight;
  animation-name: slideInRight
}

@-webkit-keyframes slideInUp {
  from {
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

@keyframes slideInUp {
  from {
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
    visibility: visible
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
}

.slideInUp {
  -webkit-animation-name: slideInUp;
  animation-name: slideInUp
}

@-webkit-keyframes slideOutDown {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0)
  }
}

@keyframes slideOutDown {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0)
  }
}

.slideOutDown {
  -webkit-animation-name: slideOutDown;
  animation-name: slideOutDown
}

@-webkit-keyframes slideOutLeft {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0)
  }
}

@keyframes slideOutLeft {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0)
  }
}

.slideOutLeft {
  -webkit-animation-name: slideOutLeft;
  animation-name: slideOutLeft
}

@-webkit-keyframes slideOutRight {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0)
  }
}

@keyframes slideOutRight {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(100%, 0, 0);
    transform: translate3d(100%, 0, 0)
  }
}

.slideOutRight {
  -webkit-animation-name: slideOutRight;
  animation-name: slideOutRight
}

@-webkit-keyframes slideOutUp {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0)
  }
}

@keyframes slideOutUp {
  from {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0)
  }
}

.slideOutUp {
  -webkit-animation-name: slideOutUp;
  animation-name: slideOutUp
}

.nav {
  margin-bottom: 0;
  padding-left: 0;
  list-style: none
}

.nav:before,
.nav:after {
  content: " ";
  display: table
}

.nav:after {
  clear: both
}

.nav>li {
  position: relative;
  display: block
}

.nav>li>a {
  position: relative;
  display: block;
  padding: 10px 15px
}

.nav>li>a:hover,
.nav>li>a:focus {
  text-decoration: none;
  background-color: #eee
}

.nav>li.disabled>a {
  color: #777
}

.nav>li.disabled>a:hover,
.nav>li.disabled>a:focus {
  color: #777;
  text-decoration: none;
  background-color: transparent;
  cursor: not-allowed
}

.nav .open>a,
.nav .open>a:hover,
.nav .open>a:focus {
  background-color: #eee;
  border-color: #428bca
}

.nav .nav-divider {
  height: 1px;
  margin: 9px 0;
  overflow: hidden;
  background-color: #e5e5e5
}

.nav>li>a>img {
  max-width: none
}

.nav-tabs {
  border-bottom: 1px solid #ddd
}

.nav-tabs>li {
  float: left;
  margin-bottom: -1px
}

.nav-tabs>li>a {
  margin-right: 2px;
  line-height: 1.428571429;
  border: 1px solid transparent;
  border-radius: 4px 4px 0 0
}

.nav-tabs>li>a:hover {
  border-color: #eee #eee #ddd
}

.nav-tabs>li.active>a,
.nav-tabs>li.active>a:hover,
.nav-tabs>li.active>a:focus {
  color: #555;
  background-color: #fff;
  border: 1px solid #ddd;
  border-bottom-color: transparent;
  cursor: default
}

.nav-pills>li {
  float: left
}

.nav-pills>li>a {
  border-radius: 4px
}

.nav-pills>li+li {
  margin-left: 2px
}

.nav-pills>li.active>a,
.nav-pills>li.active>a:hover,
.nav-pills>li.active>a:focus {
  color: #fff;
  background-color: #428bca
}

.nav-stacked>li {
  float: none
}

.nav-stacked>li+li {
  margin-top: 2px;
  margin-left: 0
}

.nav-justified,
.nav-tabs.nav-justified {
  width: 100%
}

.nav-justified>li,
.nav-tabs.nav-justified>li {
  float: none
}

.nav-justified>li>a,
.nav-tabs.nav-justified>li>a {
  text-align: center;
  margin-bottom: 5px
}

.nav-justified>.dropdown .dropdown-menu {
  top: auto;
  left: auto
}

@media (min-width: 768px) {
  .nav-justified>li, .nav-tabs.nav-justified>li {
    display: table-cell;
    width: 1%
  }
  .nav-justified>li>a,
  .nav-tabs.nav-justified>li>a {
    margin-bottom: 0
  }
}

.nav-tabs-justified,
.nav-tabs.nav-justified {
  border-bottom: 0
}

.nav-tabs-justified>li>a,
.nav-tabs.nav-justified>li>a {
  margin-right: 0;
  border-radius: 4px
}

.nav-tabs-justified>.active>a,
.nav-tabs.nav-justified>.active>a,
.nav-tabs-justified>.active>a:hover,
.nav-tabs.nav-justified>.active>a:hover,
.nav-tabs-justified>.active>a:focus,
.nav-tabs.nav-justified>.active>a:focus {
  border: 1px solid #ddd
}

@media (min-width: 768px) {
  .nav-tabs-justified>li>a, .nav-tabs.nav-justified>li>a {
    border-bottom: 1px solid #ddd;
    border-radius: 4px 4px 0 0
  }
  .nav-tabs-justified>.active>a,
  .nav-tabs.nav-justified>.active>a,
  .nav-tabs-justified>.active>a:hover,
  .nav-tabs.nav-justified>.active>a:hover,
  .nav-tabs-justified>.active>a:focus,
  .nav-tabs.nav-justified>.active>a:focus {
    border-bottom-color: #fff
  }
}

.tab-content>.tab-pane {
  display: none
}

.tab-content>.active {
  display: block
}

.nav-tabs .dropdown-menu {
  margin-top: -1px;
  border-top-right-radius: 0;
  border-top-left-radius: 0
}

.blog-jumbotron {
  background: #428bca url("http://timothy.expert/images/notebook-1280x220.jpg") center/cover
}

.projects-jumbotron {
  background: #428bca url("http://timothy.expert/images/computer-1280x220.jpg") center/cover
}

.jumbotron {
  padding-bottom: 30px;
  margin-bottom: 30px;
  color: #fff;
  background-color: #428bca;
  box-shadow: inset 0 0 100px rgba(0, 0, 0, 0.5);
  text-shadow: 0 1px 3px rgba(0, 0, 0, 0.5)
}

.jumbotron h1,
.jumbotron .h1 {
  color: inherit;
  font-weight: 800;
  text-transform: uppercase;
  margin-top: 30px
}

.jumbotron p {
  margin-bottom: 15px;
  font-size: 21px;
  font-weight: 200
}

.jumbotron>hr {
  border-top-color: #3071a9
}

.container .jumbotron,
.container-fluid .jumbotron {
  border-radius: 6px
}

.jumbotron .container {
  max-width: 100%
}

@media screen and (min-width: 768px) {
  .jumbotron {
    padding-bottom: 48px
  }
  .container .jumbotron,
  .container-fluid .jumbotron {
    padding-left: 60px;
    padding-right: 60px
  }
  .jumbotron h1,
  .jumbotron .h1 {
    font-size: 63px
  }
}

.alert {
  padding: 15px;
  margin-bottom: -52px;
  border: 1px solid transparent;
  border-radius: 4px;
  position: relative;
  bottom: 45px
}

.alert h4 {
  margin-top: 0;
  color: inherit
}

.alert .alert-link {
  font-weight: bold
}

.alert>p,
.alert>ul {
  margin-bottom: 0
}

.alert>p+p {
  margin-top: 5px
}

.alert-dismissable,
.alert-dismissible {
  padding-right: 35px
}

.alert-dismissable .close,
.alert-dismissible .close {
  position: relative;
  top: -2px;
  right: -21px;
  color: inherit
}

.alert-success {
  background-color: #dff0d8;
  border-color: #d6e9c6;
  color: #3c763d
}

.alert-success hr {
  border-top-color: #c9e2b3
}

.alert-success .alert-link {
  color: #2b542c
}

.alert-info {
  background-color: #d9edf7;
  border-color: #bce8f1;
  color: #31708f
}

.alert-info hr {
  border-top-color: #a6e1ec
}

.alert-info .alert-link {
  color: #245269
}

.alert-warning {
  background-color: #fcf8e3;
  border-color: #faebcc;
  color: #8a6d3b
}

.alert-warning hr {
  border-top-color: #f7e1b5
}

.alert-warning .alert-link {
  color: #66512c
}

.alert-danger {
  background-color: #f2dede;
  border-color: #ebccd1;
  color: #a94442
}

.alert-danger hr {
  border-top-color: #e4b9c0
}

.alert-danger .alert-link {
  color: #843534
}

.panel {
  margin-bottom: 20px;
  background-color: #fff;
  border: 1px solid transparent;
  border-radius: 4px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05)
}

.panel-body {
  padding: 15px
}

.panel-body:before,
.panel-body:after {
  content: " ";
  display: table
}

.panel-body:after {
  clear: both
}

.panel-heading {
  padding: 10px 15px;
  border-bottom: 1px solid transparent;
  border-top-right-radius: 3px;
  border-top-left-radius: 3px
}

.panel-heading>.dropdown .dropdown-toggle {
  color: inherit
}

.panel-title {
  margin-top: 0;
  margin-bottom: 0;
  font-size: 16px;
  color: inherit
}

.panel-title>a,
.panel-title>small,
.panel-title>.small,
.panel-title>small>a,
.panel-title>.small>a {
  color: inherit
}

.panel-footer {
  padding: 10px 15px;
  background-color: #f5f5f5;
  border-top: 1px solid #ddd;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px
}

.panel>.list-group,
.panel>.panel-collapse>.list-group {
  margin-bottom: 0
}

.panel>.list-group .list-group-item,
.panel>.panel-collapse>.list-group .list-group-item {
  border-width: 1px 0;
  border-radius: 0
}

.panel>.list-group:first-child .list-group-item:first-child,
.panel>.panel-collapse>.list-group:first-child .list-group-item:first-child {
  border-top: 0;
  border-top-right-radius: 3px;
  border-top-left-radius: 3px
}

.panel>.list-group:last-child .list-group-item:last-child,
.panel>.panel-collapse>.list-group:last-child .list-group-item:last-child {
  border-bottom: 0;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px
}

.panel>.panel-heading+.panel-collapse>.list-group .list-group-item:first-child {
  border-top-right-radius: 0;
  border-top-left-radius: 0
}

.panel-heading+.list-group .list-group-item:first-child {
  border-top-width: 0
}

.list-group+.panel-footer {
  border-top-width: 0
}

.panel>.table,
.panel>.table-responsive>.table,
.panel>.panel-collapse>.table {
  margin-bottom: 0
}

.panel>.table caption,
.panel>.table-responsive>.table caption,
.panel>.panel-collapse>.table caption {
  padding-left: 15px;
  padding-right: 15px
}

.panel>.table:first-child,
.panel>.table-responsive:first-child>.table:first-child {
  border-top-right-radius: 3px;
  border-top-left-radius: 3px
}

.panel>.table:first-child>thead:first-child>tr:first-child,
.panel>.table:first-child>tbody:first-child>tr:first-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child {
  border-top-left-radius: 3px;
  border-top-right-radius: 3px
}

.panel>.table:first-child>thead:first-child>tr:first-child td:first-child,
.panel>.table:first-child>thead:first-child>tr:first-child th:first-child,
.panel>.table:first-child>tbody:first-child>tr:first-child td:first-child,
.panel>.table:first-child>tbody:first-child>tr:first-child th:first-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:first-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:first-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:first-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:first-child {
  border-top-left-radius: 3px
}

.panel>.table:first-child>thead:first-child>tr:first-child td:last-child,
.panel>.table:first-child>thead:first-child>tr:first-child th:last-child,
.panel>.table:first-child>tbody:first-child>tr:first-child td:last-child,
.panel>.table:first-child>tbody:first-child>tr:first-child th:last-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:last-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:last-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:last-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:last-child {
  border-top-right-radius: 3px
}

.panel>.table:last-child,
.panel>.table-responsive:last-child>.table:last-child {
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px
}

.panel>.table:last-child>tbody:last-child>tr:last-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child {
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px
}

.panel>.table:last-child>tbody:last-child>tr:last-child td:first-child,
.panel>.table:last-child>tbody:last-child>tr:last-child th:first-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child td:first-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child th:first-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:first-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:first-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:first-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:first-child {
  border-bottom-left-radius: 3px
}

.panel>.table:last-child>tbody:last-child>tr:last-child td:last-child,
.panel>.table:last-child>tbody:last-child>tr:last-child th:last-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child td:last-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child th:last-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:last-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:last-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:last-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:last-child {
  border-bottom-right-radius: 3px
}

.panel>.panel-body+.table,
.panel>.panel-body+.table-responsive,
.panel>.table+.panel-body,
.panel>.table-responsive+.panel-body {
  border-top: 1px solid #ddd
}

.panel>.table>tbody:first-child>tr:first-child th,
.panel>.table>tbody:first-child>tr:first-child td {
  border-top: 0
}

.panel>.table-bordered,
.panel>.table-responsive>.table-bordered {
  border: 0
}

.panel>.table-bordered>thead>tr>th:first-child,
.panel>.table-bordered>thead>tr>td:first-child,
.panel>.table-bordered>tbody>tr>th:first-child,
.panel>.table-bordered>tbody>tr>td:first-child,
.panel>.table-bordered>tfoot>tr>th:first-child,
.panel>.table-bordered>tfoot>tr>td:first-child,
.panel>.table-responsive>.table-bordered>thead>tr>th:first-child,
.panel>.table-responsive>.table-bordered>thead>tr>td:first-child,
.panel>.table-responsive>.table-bordered>tbody>tr>th:first-child,
.panel>.table-responsive>.table-bordered>tbody>tr>td:first-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>th:first-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>td:first-child {
  border-left: 0
}

.panel>.table-bordered>thead>tr>th:last-child,
.panel>.table-bordered>thead>tr>td:last-child,
.panel>.table-bordered>tbody>tr>th:last-child,
.panel>.table-bordered>tbody>tr>td:last-child,
.panel>.table-bordered>tfoot>tr>th:last-child,
.panel>.table-bordered>tfoot>tr>td:last-child,
.panel>.table-responsive>.table-bordered>thead>tr>th:last-child,
.panel>.table-responsive>.table-bordered>thead>tr>td:last-child,
.panel>.table-responsive>.table-bordered>tbody>tr>th:last-child,
.panel>.table-responsive>.table-bordered>tbody>tr>td:last-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>th:last-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>td:last-child {
  border-right: 0
}

.panel>.table-bordered>thead>tr:first-child>td,
.panel>.table-bordered>thead>tr:first-child>th,
.panel>.table-bordered>tbody>tr:first-child>td,
.panel>.table-bordered>tbody>tr:first-child>th,
.panel>.table-responsive>.table-bordered>thead>tr:first-child>td,
.panel>.table-responsive>.table-bordered>thead>tr:first-child>th,
.panel>.table-responsive>.table-bordered>tbody>tr:first-child>td,
.panel>.table-responsive>.table-bordered>tbody>tr:first-child>th {
  border-bottom: 0
}

.panel>.table-bordered>tbody>tr:last-child>td,
.panel>.table-bordered>tbody>tr:last-child>th,
.panel>.table-bordered>tfoot>tr:last-child>td,
.panel>.table-bordered>tfoot>tr:last-child>th,
.panel>.table-responsive>.table-bordered>tbody>tr:last-child>td,
.panel>.table-responsive>.table-bordered>tbody>tr:last-child>th,
.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>td,
.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>th {
  border-bottom: 0
}

.panel>.table-responsive {
  border: 0;
  margin-bottom: 0
}

.panel-group {
  margin-bottom: 20px
}

.panel-group .panel {
  margin-bottom: 0;
  border-radius: 4px
}

.panel-group .panel+.panel {
  margin-top: 5px
}

.panel-group .panel-heading {
  border-bottom: 0
}

.panel-group .panel-heading+.panel-collapse>.panel-body,
.panel-group .panel-heading+.panel-collapse>.list-group {
  border-top: 1px solid #ddd
}

.panel-group .panel-footer {
  border-top: 0
}

.panel-group .panel-footer+.panel-collapse .panel-body {
  border-bottom: 1px solid #ddd
}

.panel-default {
  border-color: #ddd
}

.panel-default>.panel-heading {
  color: #333;
  background-color: #f5f5f5;
  border-color: #ddd
}

.panel-default>.panel-heading+.panel-collapse>.panel-body {
  border-top-color: #ddd
}

.panel-default>.panel-heading .badge {
  color: #f5f5f5;
  background-color: #333
}

.panel-default>.panel-footer+.panel-collapse>.panel-body {
  border-bottom-color: #ddd
}

.panel-primary {
  border-color: #428bca
}

.panel-primary>.panel-heading {
  color: #fff;
  background-color: #428bca;
  border-color: #428bca
}

.panel-primary>.panel-heading+.panel-collapse>.panel-body {
  border-top-color: #428bca
}

.panel-primary>.panel-heading .badge {
  color: #428bca;
  background-color: #fff
}

.panel-primary>.panel-footer+.panel-collapse>.panel-body {
  border-bottom-color: #428bca
}

.panel-success {
  border-color: #d6e9c6
}

.panel-success>.panel-heading {
  color: #3c763d;
  background-color: #dff0d8;
  border-color: #d6e9c6
}

.panel-success>.panel-heading+.panel-collapse>.panel-body {
  border-top-color: #d6e9c6
}

.panel-success>.panel-heading .badge {
  color: #dff0d8;
  background-color: #3c763d
}

.panel-success>.panel-footer+.panel-collapse>.panel-body {
  border-bottom-color: #d6e9c6
}

.panel-info {
  border-color: #bce8f1
}

.panel-info>.panel-heading {
  color: #31708f;
  background-color: #d9edf7;
  border-color: #bce8f1
}

.panel-info>.panel-heading+.panel-collapse>.panel-body {
  border-top-color: #bce8f1
}

.panel-info>.panel-heading .badge {
  color: #d9edf7;
  background-color: #31708f
}

.panel-info>.panel-footer+.panel-collapse>.panel-body {
  border-bottom-color: #bce8f1
}

.panel-warning {
  border-color: #faebcc
}

.panel-warning>.panel-heading {
  color: #8a6d3b;
  background-color: #fcf8e3;
  border-color: #faebcc
}

.panel-warning>.panel-heading+.panel-collapse>.panel-body {
  border-top-color: #faebcc
}

.panel-warning>.panel-heading .badge {
  color: #fcf8e3;
  background-color: #8a6d3b
}

.panel-warning>.panel-footer+.panel-collapse>.panel-body {
  border-bottom-color: #faebcc
}

.panel-danger {
  border-color: #ebccd1
}

.panel-danger>.panel-heading {
  color: #a94442;
  background-color: #f2dede;
  border-color: #ebccd1
}

.panel-danger>.panel-heading+.panel-collapse>.panel-body {
  border-top-color: #ebccd1
}

.panel-danger>.panel-heading .badge {
  color: #f2dede;
  background-color: #a94442
}

.panel-danger>.panel-footer+.panel-collapse>.panel-body {
  border-bottom-color: #ebccd1
}

.close {
  float: right;
  font-size: 21px;
  font-weight: bold;
  line-height: 1;
  color: #000;
  text-shadow: 0 1px 0 #fff;
  opacity: 0.2;
  filter: alpha(opacity=20)
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
  opacity: 0.5;
  filter: alpha(opacity=50)
}

button.close {
  padding: 0;
  cursor: pointer;
  background: transparent;
  border: 0;
  -webkit-appearance: none
}

html,
body {
  height: 100%
}

.cover-wrapper {
  overflow: hidden;
  background: #428bca url("https://media2.giphy.com/media/ToMjGpxInCZSzD3V82s/giphy.gif?cid=790b7611417d579817d384d8a047a9cb2052edca21ef0e68&rid=giphy.gif") center/cover;
  color: #fff;
  text-align: center;
  text-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
  display: table;
  width: 100%;
  height: 100%;
  min-height: 100%;
  box-shadow: inset 0 0 100px rgba(0, 0, 0, 0.5)
}

.cover-wrapper a,
.cover-wrapper a:focus,
.cover-wrapper a:hover {
  color: #fff
}

.cover-wrapper .lead {
  max-width: 750px;
  margin: 0 auto;
  margin-bottom: 20px
}

.cover-wrapper .lead a {
  font-weight: 500
}

.cover-wrapper h1 {
  font-weight: 800;
  text-transform: uppercase
}

.cover-wrapper .btn-default,
.cover-wrapper .btn-default:hover,
.cover-wrapper .btn-default:focus {
  color: #333;
  text-shadow: none;
  background-color: #fff;
  border: 1px solid #fff
}

.cover-wrapper-inner {
  display: table-cell;
  vertical-align: top
}

.cover-container {
  margin-right: auto;
  margin-left: auto
}

.inner {
  padding: 30px;
  text-align: center
}

.masthead-brand {
  margin-top: 10px;
  margin-bottom: 10px;
  color: #fff
}

.masthead-nav>li {
  display: inline-block
}

.masthead-nav>li+li {
  margin-left: 20px
}

.masthead-nav>li>a {
  padding-right: 0;
  padding-left: 0;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  color: rgba(255, 255, 255, 0.75);
  border-bottom: 2px solid transparent
}

.masthead-nav>li>a:hover,
.masthead-nav>li>a:focus {
  background-color: transparent;
  border-bottom-color: #a9a9a9;
  border-bottom-color: rgba(255, 255, 255, 0.25)
}

.masthead-nav>.active>a,
.masthead-nav>.active>a:hover,
.masthead-nav>.active>a:focus {
  color: #fff;
  border-bottom-color: #fff
}

@media (min-width: 768px) {
  .masthead-brand {
    float: left
  }
  .masthead-nav {
    float: right
  }
}

.cover {
  padding: 0 20px
}

.cover .btn-lg {
  padding: 10px 20px;
  font-weight: bold
}

.mastfoot {
  color: #999;
  color: rgba(255, 255, 255, 0.5)
}

@media (min-width: 768px) {
  .masthead {
    position: fixed;
    top: 0
  }
  .mastfoot {
    position: fixed;
    bottom: 0
  }
  .cover-wrapper-inner {
    vertical-align: middle
  }
  .masthead,
  .mastfoot,
  .cover-container {
    width: 100%
  }
}

@media (min-width: 768px) {
  .masthead, .mastfoot, .cover-container {
    width: 750px
  }
}

@media (min-width: 992px) {
  .masthead, .mastfoot, .cover-container {
    width: 970px
  }
}

@media (min-width: 1200px) {
  .masthead, .mastfoot, .cover-container {
    width: 1170px
  }
}

section {
  min-height: 100%;
  width: 100%;
  position: absolute
}

section .post {
  height: 400px;
  width: 100%;
  padding: 10px 10px;
  box-shadow: rgba(0, 0, 0, 0.09804) 0px 0px 5px 0px;
  background: #fff;
  margin-bottom: 20px
}

#blog {
  background: #eee
}

#projects {
  background: #fff
}

#projects .description {
  font-size: 1.2em
}

#contact {
  background: #dddddd;
  color: #fff
}

#contact h1 {
  font-size: 4em;
  font-weight: 800
}

#contact .col-md-12.text-center {
  margin-bottom: 40px
}

#contact .btn-default,
#contact .btn-default:hover,
#contact .btn-default:focus {
  color: #333;
  text-shadow: none;
  background-color: #fff;
  border: 1px solid #fff;
  font-weight: 600
}

#contact .form-control {
  width: 100%;
  margin-bottom: 10px;
  background: rgba(0, 0, 0, 0.3);
  border: none;
  outline: none;
  padding: 10px;
  font-size: 16px;
  color: #fff;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(0, 0, 0, 0.3);
  border-radius: 4px;
  box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.2), 0 1px 1px rgba(255, 255, 255, 0.2)
}

#contact .form-control:focus {
  box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.4), 0 1px 1px rgba(255, 255, 255, 0.2)
}

.logo {
  height: 1.1em;
  display: inline;
  position: relative;
  bottom: 2px
}

.modal-open {
  overflow: hidden
}

.modal {
  display: none;
  overflow: hidden;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1050;
  -webkit-overflow-scrolling: touch;
  outline: 0
}

.modal.fade .modal-dialog {
  -webkit-transform: translate(0, -25%);
  -ms-transform: translate(0, -25%);
  transform: translate(0, -25%);
  -webkit-transition: -webkit-transform 0.3s ease-out;
  transition: transform 0.3s ease-out
}

.modal.in .modal-dialog {
  -webkit-transform: translate(0, 0);
  -ms-transform: translate(0, 0);
  transform: translate(0, 0)
}

.modal-open .modal {
  overflow-x: hidden;
  overflow-y: auto
}

.modal-dialog {
  position: relative;
  width: auto;
  margin: 10px
}

.modal-content {
  position: relative;
  background-color: #fff;
  border: 1px solid #999;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 6px;
  box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
  background-clip: padding-box;
  outline: 0
}

.modal-backdrop {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1040;
  background-color: #000
}

.modal-backdrop.fade {
  opacity: 0;
  filter: alpha(opacity=0)
}

.modal-backdrop.in {
  opacity: 0.5;
  filter: alpha(opacity=50)
}

.modal-header {
  padding: 15px;
  border-bottom: 1px solid #e5e5e5;
  min-height: 16.428571429px
}

.modal-header .close {
  margin-top: -2px
}

.modal-title {
  margin: 0;
  line-height: 1.428571429
}

.modal-body {
  position: relative;
  padding: 15px
}

.modal-body h1,
.modal-body h2,
.modal-body h3 {
  font-weight: 800
}

.modal-footer {
  padding: 15px;
  text-align: right;
  border-top: 1px solid #e5e5e5
}

.modal-footer:before,
.modal-footer:after {
  content: " ";
  display: table
}

.modal-footer:after {
  clear: both
}

.modal-footer .btn+.btn {
  margin-left: 5px;
  margin-bottom: 0
}

.modal-footer .btn-group .btn+.btn {
  margin-left: -1px
}

.modal-footer .btn-block+.btn-block {
  margin-left: 0
}

.modal-scrollbar-measure {
  position: absolute;
  top: -9999px;
  width: 50px;
  height: 50px;
  overflow: scroll
}

@media (min-width: 768px) {
  .modal-dialog {
    width: 600px;
    margin: 30px auto
  }
  .modal-content {
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5)
  }
  .modal-sm {
    width: 300px
  }
}

@media (min-width: 992px) {
  .modal-lg {
    width: 900px
  }
}

.clearfix:before,
.clearfix:after {
  content: " ";
  display: table
}

.clearfix:after {
  clear: both
}

.center-block {
  display: block;
  margin-left: auto;
  margin-right: auto
}

.pull-right {
  float: right !important
}

.pull-left {
  float: left !important
}

.hide {
  display: none !important
}

.show {
  display: block !important
}

.invisible {
  visibility: hidden
}

.text-hide {
  font: 0/0 a;
  color: transparent;
  text-shadow: none;
  background-color: transparent;
  border: 0
}

.hidden {
  display: none !important
}

.affix {
  position: fixed
}

@-ms-viewport {
  width: device-width
}

.visible-xs {
  display: none !important
}

.visible-sm {
  display: none !important
}

.visible-md {
  display: none !important
}

.visible-lg {
  display: none !important
}

.visible-xs-block,
.visible-xs-inline,
.visible-xs-inline-block,
.visible-sm-block,
.visible-sm-inline,
.visible-sm-inline-block,
.visible-md-block,
.visible-md-inline,
.visible-md-inline-block,
.visible-lg-block,
.visible-lg-inline,
.visible-lg-inline-block {
  display: none !important
}

@media (max-width: 767px) {
  .visible-xs {
    display: block !important
  }
  table.visible-xs {
    display: table !important
  }
  tr.visible-xs {
    display: table-row !important
  }
  th.visible-xs,
  td.visible-xs {
    display: table-cell !important
  }
}

@media (max-width: 767px) {
  .visible-xs-block {
    display: block !important
  }
}

@media (max-width: 767px) {
  .visible-xs-inline {
    display: inline !important
  }
}

@media (max-width: 767px) {
  .visible-xs-inline-block {
    display: inline-block !important
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .visible-sm {
    display: block !important
  }
  table.visible-sm {
    display: table !important
  }
  tr.visible-sm {
    display: table-row !important
  }
  th.visible-sm,
  td.visible-sm {
    display: table-cell !important
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .visible-sm-block {
    display: block !important
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .visible-sm-inline {
    display: inline !important
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .visible-sm-inline-block {
    display: inline-block !important
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-md {
    display: block !important
  }
  table.visible-md {
    display: table !important
  }
  tr.visible-md {
    display: table-row !important
  }
  th.visible-md,
  td.visible-md {
    display: table-cell !important
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-md-block {
    display: block !important
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-md-inline {
    display: inline !important
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-md-inline-block {
    display: inline-block !important
  }
}

@media (min-width: 1200px) {
  .visible-lg {
    display: block !important
  }
  table.visible-lg {
    display: table !important
  }
  tr.visible-lg {
    display: table-row !important
  }
  th.visible-lg,
  td.visible-lg {
    display: table-cell !important
  }
}

@media (min-width: 1200px) {
  .visible-lg-block {
    display: block !important
  }
}

@media (min-width: 1200px) {
  .visible-lg-inline {
    display: inline !important
  }
}

@media (min-width: 1200px) {
  .visible-lg-inline-block {
    display: inline-block !important
  }
}

@media (max-width: 767px) {
  .hidden-xs {
    display: none !important
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .hidden-sm {
    display: none !important
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .hidden-md {
    display: none !important
  }
}

@media (min-width: 1200px) {
  .hidden-lg {
    display: none !important
  }
}

.visible-print {
  display: none !important
}

@media print {
  .visible-print {
    display: block !important
  }
  table.visible-print {
    display: table !important
  }
  tr.visible-print {
    display: table-row !important
  }
  th.visible-print,
  td.visible-print {
    display: table-cell !important
  }
}

.visible-print-block {
  display: none !important
}

@media print {
  .visible-print-block {
    display: block !important
  }
}

.visible-print-inline {
  display: none !important
}

@media print {
  .visible-print-inline {
    display: inline !important
  }
}

.visible-print-inline-block {
  display: none !important
}

@media print {
  .visible-print-inline-block {
    display: inline-block !important
  }
}

@media print {
  .hidden-print {
    display: none !important
  }
}

</style>
</head>
<body>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Tim Robert-Fitzgerald is freshmen at Oberlin College, and a freelance web developer on the weekends.">
    <meta name="author" content="Tim Robert-Fitzgerald">
    <title>Tim Robert-Fitzgerald</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:600,800' rel='stylesheet' type='text/css'>
    <!-- Favicons -->
    <link rel="apple-touch-icon" sizes="57x57" href="http://timothy.expert/apple-touch-icon-57x57.png?v=2">
    <link rel="apple-touch-icon" sizes="60x60" href="http://timothy.expert/apple-touch-icon-60x60.png?v=2">
    <link rel="apple-touch-icon" sizes="72x72" href="http://timothy.expert/apple-touch-icon-72x72.png?v=2">
    <link rel="apple-touch-icon" sizes="76x76" href="http://timothy.expert/apple-touch-icon-76x76.png?v=2">
    <link rel="apple-touch-icon" sizes="114x114" href="http://timothy.expert/apple-touch-icon-114x114.png?v=2">
    <link rel="apple-touch-icon" sizes="120x120" href="http://timothy.expert/apple-touch-icon-120x120.png?v=2">
    <link rel="apple-touch-icon" sizes="144x144" href="http://timothy.expert/apple-touch-icon-144x144.png?v=2">
    <link rel="apple-touch-icon" sizes="152x152" href="http://timothy.expert/apple-touch-icon-152x152.png?v=2">
    <link rel="apple-touch-icon" sizes="180x180" href="http://timothy.expert/apple-touch-icon-180x180.png?v=2">
    <link rel="icon" type="image/png" href="http://timothy.expert/favicon-32x32.png?v=2" sizes="32x32">
    <link rel="icon" type="image/png" href="http://timothy.expert/favicon-194x194.png?v=2" sizes="194x194">
    <link rel="icon" type="image/png" href="http://timothy.expert/favicon-96x96.png?v=2" sizes="96x96">
    <link rel="icon" type="image/png" href="http://timothy.expert/android-chrome-192x192.png?v=2" sizes="192x192">
    <link rel="icon" type="image/png" href="http://timothy.expert/favicon-16x16.png?v=2" sizes="16x16">
    <link rel="manifest" href="http://timothy.expert/manifest.json?v=2">
    <link rel="shortcut icon" href="http://timothy.expert/favicon.ico?v=2">
    <meta name="msapplication-TileColor" content="#2d89ef">
    <meta name="msapplication-TileImage" content="http://timothy.expert/mstile-144x144.png?v=2">
    <meta name="theme-color" content="#ffffff">
    <!-- Open Graph data -->
    <meta property="og:title" content="Tim Robert-Fitzgerald" />
    <meta property="og:type" content="website" />
    <meta property="og:image" content="http://timothy.expert/images/og-image.jpg" />
    <meta property="og:image:width" content="1200" />
    <meta property="og:image:height" content="630" />
    <meta property="og:site_name" content="Tim Robert-Fitzgerald"/>
    <meta property="og:description" content="Tim Robert-Fitzgerald is freshmen at Oberlin College, and a freelance web developer on the weekends." />
    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Tim Robert-Fitzgerald">
    <meta name="twitter:description" content="Tim Robert-Fitzgerald is freshmen at Oberlin College, and a freelance web developer on the weekends.">
    <meta name="twitter:image" content="http://timothy.expert/images/og-image.jpg">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <!-- Modal -->
    <div class="modal fade" id="post" tabindex="-1" role="dialog" aria-labelledby="postLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="postLabel"></h4>
          </div>
          <div class="modal-body">
            <h2 class="text center">Loading&hellip;</h2>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>

    <section class="cover-wrapper" id="index">
      <div class="cover-wrapper-inner">
        <div class="cover-container">
          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand"><img src="${pageContext.request.contextPath}/resources/img/commaLogo.png" alt="Code" class="img-responsive logo"> </h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a href="#" data-hide=".cover-wrapper">Home</a></li>
                  <li><a href="blog" data-hide=".cover-wrapper">Blog</a></li>
                  <li><a href="projects" data-hide=".cover-wrapper">Projects</a></li>
                  <li><a href="/CommaProjectTest/contact.jsp" data-hide=".cover-wrapper">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
<!--           메인글
 -->            <h1 class="cover-heading">Comma Project</h1>
            <p class="lead">I&apos;m a freshmen at Oberlin College, and a freelance web developer in my spare time. I occasionally <a href="blog" data-hide=".cover-wrapper">write</a> about tech, work on various <a href="projects" data-hide=".cover-wrapper">projects</a>, draft demos on <a href="https://codepen.io/terf/">CodePen</a>, and spend a lot of time expirementing with web technologies.</p>
            <p><a href="/CommaProjectTest/contact.jsp" class="btn btn-lg btn-default" data-hide=".cover-wrapper"><c:choose><c:when test="${not empty loginInfo}">My Page</c:when><c:otherwise>Join with us</c:otherwise></c:choose></a></p>
          </div>

          <div class="mastfoot">
            <div class="inner">
              <p>&copy; Comma Project 2019</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <section class="hide" id="blog">
      <div class="jumbotron blog-jumbotron">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="inner">
                <h3 class="masthead-brand"><img src="http://timothy.expert/images/logo.svg?v=1" alt="Code" class="img-responsive logo"> Timothy.Expert</h3>
                <nav>
                  <ul class="nav masthead-nav">
                    <li><a href="index" data-hide="#blog">Home</a></li>
                    <li class="active"><a href="#" data-hide="#blog">Blog</a></li>
                    <li><a href="projects" data-hide="#blog">Projects</a></li>
                    
                    
                    <li><a href="contact" data-hide="#blog">Login</a></li>
                    
                    
                    
                  </ul>
                </nav>
              </div>
              <h1 class="text-center">Blog</h1>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
                              <div class="col-md-4">
            <div class="post">
              <div class="page-header">
                <h2 class="h3">Creating a Search Engine with PHP, PDO, and MySQL</h2>
                <p class="text-muted">August 23<sup>rd</sup>, 2015</p>
              </div>
              <p>The Problem

Search engines are a fundemental component to many web applications as they allow users to quickly and painlessly traverse the countless rows in large databases. The idea itself is simple enough, however, creating even a simple search engine can be challenging; because users will rarely type a query that exactly corresponds to a record in the database, a method of returning all releva…</p>
              <p><a href="#" data-toggle="modal" data-target="#post" data-title="Creating a Search Engine with PHP, PDO, and MySQL" data-post="&lt;h2&gt;The Problem&lt;/h2&gt;

&lt;p&gt;Search engines are a fundemental component to many web applications as they allow users to quickly and painlessly traverse the countless rows in large databases. The idea itself is simple enough, however, creating even a simple search engine can be challenging; because users will rarely type a query that exactly corresponds to a record in the database, a method of returning all relevant queries — not just those that are an exact match — is necessary. But how can such a thing be accomplished? SQL is a precise language which demands input that corresponds exactly with a record in the database. You can only request records where a columns value equals &lt;em&gt;X&lt;/em&gt;, not where a columns value would be relevant to &lt;em&gt;X&lt;/em&gt;.&lt;/p&gt;

&lt;h2&gt;The Solution?&lt;/h2&gt;

&lt;p&gt;The most fluidity SQL allows in queries is the use of wildcards (&lt;code&gt;%&lt;/code&gt;), which match anything in the database. For a search engine, this is especially useful as a user does not have to know all the information to get results. For example, if a user wanted to search through a list of employees by name, they would normally need the entire employees name to have results returned to them. Consider the following SQL&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;SELECT name, street_address, phone FROM employees WHERE name = '$users_input'
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;In this basic example (which for simplicity ignores the obvious risk of SQL injection), the aferomentioned problem arises — an employees information can only be retrieved if a user enters in the &lt;strong&gt;exact&lt;/strong&gt; name of an employee. Searching for &quot;Tim&quot; when an employees name in the database is &quot;Tim Fitzgerald&quot; would return nothing. With wildcards, however, a user can enter in an employees first name, or simply any part of their name and get results. Consider the following query&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;SELECT name, street_address, phone FROM employees WHERE name LIKE '%$users_input%'
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;Notice the wildcards wrapped around the users input. As the wildcards will match any text, searching for an employee named &quot;Tim Fitzgerald&quot; with the query &quot;Tim&quot; would correctly return a result as &quot;Tim&quot; matches part of &quot;Tim Fitzgerald,&quot; and the wildcard matches everything else. Additionally, the &lt;code&gt;LIKE&lt;/code&gt; operator is used instead of &lt;code&gt;=&lt;/code&gt;, as wildcards are incompatible with &lt;code&gt;=&lt;/code&gt;.&lt;/p&gt;

&lt;h4&gt;Search engine using wildcards&lt;/h4&gt;

&lt;pre&gt;&lt;code class=&quot;php&quot;&gt;&amp;lt;?php
// Users search terms is saved in $_POST['q']
$q = $_POST['q'];
// Prepare statement
$search = $db-&amp;gt;prepare(&quot;SELECT `id`, `name` FROM `users` WHERE `name` LIKE ?&quot;);
// Execute with wildcards
$search-&amp;gt;execute(array(&quot;%$q%&quot;));
// Echo results
foreach($search as $s) {
  echo $s['name'];
}
?&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;Still, the above code is rather limited. I used this method of searching databases for a while, and while it works adequately with efficiently fetching results that are close to but don't exactly match the users query, it still doesn't return all relevant results; the user's query still has to have an exact match to something in the database. For example, if I had a database with the name &quot;Tim&quot; as a row, searching for &quot;Timothy&quot; wouldn't work. Wildcards help retrieve records that partly match a users query, but do not help with retrieving records that may actually be relevant.&lt;/p&gt;

&lt;h2&gt;An Alternative Solution&lt;/h2&gt;

&lt;p&gt;SQL has reached the limits of what it can accomplish, so the only viable solution is to use PHP to filter results. The drawback of this solution, however, is that all rows in a database are needed to be retrieved &lt;em&gt;and then&lt;/em&gt; sorted, which creates an unnecessarily large SQL query, not to mention the high computational cost of the functions used to then sort out the irrelevant results. Nevertheless, it appears to be the only way solution to providing more relevant results. Two functions in PHP that are especially handing in this situation are &lt;a rel=&quot;nofollow&quot; href=&quot;http://php.net/manual/en/function.levenshtein.php&quot;&gt;&lt;code&gt;levenshtein()&lt;/code&gt;&lt;/a&gt;, which calculates the Levenshtein distance (or the &quot;minimal number of characters you have to replace, insert or delete to transform&quot; one string into another), and &lt;a rel=&quot;nofollow&quot; href=&quot;http://php.net/manual/en/function.metaphone.php&quot;&gt;&lt;code&gt;metaphone()&lt;/code&gt;&lt;/a&gt;, which calculates the metaphone key of a string (or simply the phonetic distance between two strings). By first calculating the phonetic keys of the users search query and database records, poor spelling does not render the search engine useless (&quot;carrrot&quot; and &quot;carrot&quot; have the same phonetic keys), and the levenshtein distance between phonetic keys can determine how closely a users search has to be to records in the database.&lt;/p&gt;

&lt;h4&gt;Search engine using the Levenshtein distance&lt;/h4&gt;

&lt;pre&gt;&lt;code class=&quot;php&quot;&gt;&amp;lt;?php
// Users search terms is saved in $_POST['q']
$q = $_POST['q'];
// Create array for the names that are close to or match the search term
$results = array();
foreach($db-&amp;gt;query('SELECT `id`, `name` FROM `employees`') as $name) {
  // Keep only relevant results
  // First takes the phonetic keys from each word, and compares the difference between them
  // If more than 3 charachters need to be added, deleted, or replaced, the word is thrown out
  // To get broader results, change the 3 to a higher number (and vice versa — for narrower results use a number below 3)
  if (levenshtein(metaphone($q), metaphone($name['name'])) &amp;lt; 3) {
    array_push($results,$name['name']);
  }
}
// Echo out results
foreach ($results as $result) {
  echo $result.&quot;\n&quot;;
}
?&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;To raise or lower the threshold of what is deemed relevant, change the minimium levenshtein distance to a different number. Higher numbers would include broader results (because the distance between two strings can be greater) while lower numbers would narrow search results including only close matches. The threshold you pick should align with how big your database is; larger databases should have more precise searches, while smaller ones can have more vague searches.&lt;/p&gt;

&lt;p&gt;Admittedly, this search engine is not very robust, and the second method is very computationally expensive. The limit of what SQL/server side code can accomplish has been reached and a more robust search engine would require a completely &lt;a rel=&quot;nofollow&quot; href=&quot;https://lucene.apache.org&quot;&gt;different approach&lt;/a&gt;. Both methods do work, however, and for simple search engines more robust solutions may be like trying to swat a fly with a sledgehammer; if the requirement is that you query a database using non-exact user input, the methods above work well.&lt;/p&gt;

&lt;h2&gt;TL;DR?&lt;/h2&gt;

&lt;p&gt;Take a look at the code for&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;&lt;a rel=&quot;nofollow&quot; href=&quot;#search-engine-using-wildcards&quot;&gt;Search engine using wildcards&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a rel=&quot;nofollow&quot; href=&quot;#search-engine-using-the-levenshtein-distance&quot;&gt;Search engine using the Levenshtein distance&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;">Read more →</a></p>
            </div>
          </div>
                              <div class="col-md-4">
            <div class="post">
              <div class="page-header">
                <h2 class="h3">Paginated Content With PHP</h2>
                <p class="text-muted">July 13<sup>th</sup>, 2015</p>
              </div>
              <p>You see a lot of front end demos of pagination on CodePen, but that's only half the work in implementing paginated content on a dynamic website. This post is supposed to be the other half.


If you're looking for pagination, I presume you have a bunch of rows in a MySQL database, and you want to split the content into more managable chunks by pulling down only some of the content. While there are …</p>
              <p><a href="#" data-toggle="modal" data-target="#post" data-title="Paginated Content With PHP" data-post="&lt;blockquote&gt;
&lt;p&gt;You see a lot of front end demos of pagination on CodePen, but that's only half the work in implementing paginated content on a dynamic website. This post is supposed to be the other half.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;If you're looking for pagination, I presume you have a bunch of rows in a MySQL database, and you want to split the content into more managable chunks by pulling down only some of the content. While there are multiple approaches, my favorite is just to stick the page number in a query string, then pull it down and use it in conjunction with &lt;code&gt;OFFSET&lt;/code&gt;.&lt;/p&gt;

&lt;p&gt;In this article, I'll assume our URL is &lt;code&gt;example.com?page=1&lt;/code&gt;. If you prefer &lt;code&gt;example.com/1&lt;/code&gt;, there is apparently a way to &lt;a rel=&quot;nofollow&quot; href=&quot;http://stackoverflow.com/a/13003447/2624391&quot;&gt;rewrite the query string as a path using &lt;code&gt;.htaccess&lt;/code&gt;.&lt;/a&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code class=&quot;php&quot;&gt;&amp;lt;?php
// For easier access
$page = $_GET['page'];

// This 1. Makes sure no one tampered with the query tring by making sure it's a number
//      2. If someone landed on example.com and the query string doesn't exist, they should be on the first page
if (empty($page) || is_numeric($page) == FALSE) {
  $page = 1;
}
else {
  $page = $_GET['page'];
}

// Number of items per page
$items = 5;
// Figure out how much to OFFSET by
$offset = ($page * $items) - $items;

// That's essentially all there is too it. The only thing left would be to write the SQL
// It'll probably look something like this:
$sql = &quot;SELECT * FROM table LIMIT $items OFFSET $offset&quot;;

?&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;And that's it. The pagination controls would just be links adding or subtracting a page:&lt;/p&gt;

&lt;pre&gt;&lt;code class=&quot;html&quot;&gt;&amp;lt;a href=&quot;www.example.com?page=&amp;lt;?php echo $page + 1; ?&amp;gt;&quot;&amp;gt;Next Page&amp;lt;/a&amp;gt;
&amp;lt;?php if ($page != 1) { ?&amp;gt;
&amp;lt;a href=&quot;www.example.com?page=&amp;lt;?php echo $page - 1; ?&amp;gt;&quot;&amp;gt;Previous Page&amp;lt;/a&amp;gt;
&amp;lt;?php } ?&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;">Read more →</a></p>
            </div>
          </div>
                              <div class="col-md-4">
            <div class="post">
              <div class="page-header">
                <h2 class="h3">PHP/PDO Functions</h2>
                <p class="text-muted">July 10<sup>th</sup>, 2015</p>
              </div>
              <p>Writing safe and robust SQL queries with PDO is already pretty easy; you just need to prepare statements with placeholders and then execute those statements. However, the process can be streamlined a bit by packing the procedures into a function. In the code block below, I first connect to an example database, then create the function called sql, which takes three arguments: the database connectio…</p>
              <p><a href="#" data-toggle="modal" data-target="#post" data-title="PHP/PDO Functions" data-post="&lt;p&gt;Writing safe and robust SQL queries with PDO is already pretty easy; you just need to prepare statements with placeholders and then execute those statements. However, the process can be streamlined a bit by packing the procedures into a function. In the code block below, I first connect to an example database, then create the function called &lt;code&gt;sql&lt;/code&gt;, which takes three arguments: the database connection (&lt;code&gt;$db&lt;/code&gt;), the SQL query (&lt;code&gt;$q&lt;/code&gt;), and the values of the placeholders (&lt;code&gt;$params&lt;/code&gt;).&lt;/p&gt;

&lt;pre&gt;&lt;code class=&quot;php&quot;&gt;&amp;lt;?php
// Configs
define(&quot;HOST&quot;, &quot;localhost&quot;);
define(&quot;USER&quot;, &quot;username&quot;);
define(&quot;PASS&quot;, &quot;password&quot;);
define(&quot;NAME&quot;, &quot;database&quot;);

// Connect to database
try {
  $db = new PDO(&quot;mysql:host=&quot;.HOST.&quot;;dbname=&quot;.NAME.&quot;;charset=utf8&quot;, &quot;&quot;.USER.&quot;&quot;, &quot;&quot;.PASS.&quot;&quot;);
  $db-&amp;gt;setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  // PDO fetch docs: http://php.net/manual/en/pdostatement.fetch.php
  $db-&amp;gt;setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
  echo $e-&amp;gt;getMessage();
}

// Simple function to handle PDO prepared statements
function sql($db, $q, $params, $return) {
  // Prepare statement
  $stmt = $db-&amp;gt;prepare($q);
  // Execute statement
  $stmt-&amp;gt;execute($params);
  // Decide whether to return the rows themselves, or just count the rows
  if ($return == &quot;rows&quot;) {
    return $stmt-&amp;gt;fetchAll();
  }
  elseif ($return == &quot;count&quot;) {
    return $stmt-&amp;gt;rowCount();
  }
}
?&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;The usage of the function would look something like this&lt;/p&gt;

&lt;pre&gt;&lt;code class=&quot;php&quot;&gt;&amp;lt;?php
// With SELECT
// Call function
$rows = sql($db, &quot;SELECT * FROM table WHERE id = ?&quot;, array($id), &quot;rows&quot;);
// Get results
foreach($rows as $row) {
    echo $row['field1'].' '.$row['field2']; //etc...
}

// With INSERT
// Call function
sql($db, &quot;INSERT INTO table (field1, field2, field3) VALUES (?, ?, ?)&quot;, array($id, $name, $pass));

// With UPDATE
// Call function
sql($db, &quot;UPDATE table SET name = ? WHERE id = ?&quot;, array($name, $id));

// With DELETE
// Call function
sql($db, &quot;DELETE FROM table WHERE id = ?&quot;, array($id));
?&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;Arguably, such a function has little use as it's so simple, but if your web application is littered with SQL queries, using this function might reduce code duplication and improve readability.&lt;/p&gt;">Read more →</a></p>
            </div>
          </div>
                              <div class="col-md-4">
            <div class="post">
              <div class="page-header">
                <h2 class="h3">PHP Mail Function</h2>
                <p class="text-muted">July 1<sup>st</sup>, 2015</p>
              </div>
              <p>Sending an email with PHP isn't too difficult, but gets messy if you try to stuff everything into mail(). So the function below attempts to streamline the process by doing the annoying stuff — like setting the headers — and asks only for the relevant information.


  &lt;?php
function sendmail($to, $name, $email, $subject, $message) {
  // From form
  $name = htmlspecialchars($name, ENT_QUOTES…</p>
              <p><a href="#" data-toggle="modal" data-target="#post" data-title="PHP Mail Function" data-post="&lt;p&gt;Sending an email with PHP isn't too difficult, but gets messy if you try to stuff everything into &lt;code&gt;mail()&lt;/code&gt;. So the function below attempts to streamline the process by doing the annoying stuff — like setting the headers — and asks only for the relevant information.&lt;/p&gt;

&lt;pre&gt;&lt;code class=&quot;php&quot;&gt;&amp;lt;?php
function sendmail($to, $name, $email, $subject, $message) {
  // From form
  $name = htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
  $email = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
  $subject = htmlspecialchars($subject, ENT_QUOTES, 'UTF-8');
  $message = htmlspecialchars($message, ENT_QUOTES, 'UTF-8');

// Note: leave indentation as it is
  $message = &amp;lt;&amp;lt;&amp;lt;HTML
$message
HTML;

  $headers = &quot;From: $name &amp;lt;$email&amp;gt;\r\n&quot;;
  $headers .= &quot;Content-type: text/html\r\n&quot;;

  mail($to, $subject, $message, $headers);
}
/*
// Usage
sendmail(&quot;myemail@example.com&quot;, $_POST['name'], $_POST['email'], $_POST['subject'], $_POST['message'])
*/
?&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;Then you can just use &lt;code&gt;sendmail()&lt;/code&gt;, with whatever information you have. If you're using this in a form, the HTML would probably look something like&lt;/p&gt;

&lt;pre&gt;&lt;code class=&quot;html&quot;&gt;&amp;lt;form action=&quot;&quot; method=&quot;post&quot;&amp;gt;
    &amp;lt;input type=&quot;text&quot; name=&quot;name&quot; placeholder=&quot;Your Name&quot;&amp;gt;
    &amp;lt;input type=&quot;email&quot; name=&quot;email&quot; placeholder=&quot;Your Email&quot;&amp;gt;
    &amp;lt;input type=&quot;text&quot; name=&quot;subject&quot; placeholder=&quot;Subject&quot;&amp;gt;
    &amp;lt;textarea name=&quot;message&quot; cols=&quot;30&quot; rows=&quot;10&quot;&amp;gt;&amp;lt;/textarea&amp;gt;
    &amp;lt;input type=&quot;submit&quot; value=&quot;Send&quot;&amp;gt;
&amp;lt;/form&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;">Read more →</a></p>
            </div>
          </div>
                              <div class="col-md-4">
            <div class="post">
              <div class="page-header">
                <h2 class="h3">PayPal Shopping Cart &amp; IPN</h2>
                <p class="text-muted">June 29<sup>th</sup>, 2015</p>
              </div>
              <p>PayPal Payments is an easy and free way to install a shopping cart on your site. All you need to do is set up a form (the shopping cart) that sends information to PayPal and catch all the information from that order with an IPN script. An IPN will notfiy you when an order was placed, along with all the details of that order—it is your choice with what to do with that information. For simplicity,…</p>
              <p><a href="#" data-toggle="modal" data-target="#post" data-title="PayPal Shopping Cart &amp; IPN" data-post="&lt;p&gt;PayPal Payments is an easy and free way to install a shopping cart on your site. All you need to do is set up a form (the shopping cart) that sends information to PayPal and catch all the information from that order with an IPN script. An IPN will notfiy you when an order was placed, along with all the details of that order—it is your choice with what to do with that information. For simplicity, I'm just going to send out the information in an email, however, you could do anything, including putting it in a database.&lt;/p&gt;

&lt;hr /&gt;

&lt;h3&gt;The Cart: Where your form is&lt;/h3&gt;

&lt;pre&gt;&lt;code class=&quot;html&quot;&gt;&amp;lt;form method=&quot;post&quot; name=&quot;paypal_form&quot; id=&quot;paypal_form&quot; action=&quot;https://www.paypal.com/cgi-bin/webscr&quot;&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;rm&quot; value=&quot;2&quot;/&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;cmd&quot; value=&quot;_cart&quot;/&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;business&quot; value=&quot;email@example.com&quot;/&amp;gt;
    &amp;lt;!-- Where people will be sent after a successful order --&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;return&quot; value=&quot;http://example.com/thanks.php&quot;/&amp;gt;
    &amp;lt;!-- Where people will be sent after a cancelled order --&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;cancel_return&quot; value=&quot;http://example.com/cancel.php&quot;/&amp;gt;
    &amp;lt;!-- The location of your IPN. PayPal needs to know this so it knows where to send the infomation about the order --&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;notify_url&quot; value=&quot;http://example.com/ipn.php&quot;/&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;item_name_1&quot; value=&quot;Item Name&quot;/&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;amount_1&quot; value=&quot;19.95&quot;/&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;upload&quot; value=&quot;1&quot;/&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;txn_type&quot; value=&quot;cart&quot;/&amp;gt;
    &amp;lt;input type=&quot;hidden&quot; name=&quot;currencyCode&quot; value=&quot;USD&quot;/&amp;gt;
    &amp;lt;input type=&quot;submit&quot; value=&quot;Proceed to Checkout&quot;&amp;gt;
&amp;lt;/form&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;hr /&gt;

&lt;h3&gt;The IPN: The script for processing orders&lt;/h3&gt;

&lt;pre&gt;&lt;code class=&quot;php&quot;&gt;&amp;lt;?php
// Send an empty HTTP 200 OK response to acknowledge receipt of the notification
header('HTTP/1.1 200 OK');

// Assign payment notification values to local variables. There are more variables, however, these are the most essential ones. If you passed more variables through your form see https://developer.paypal.com/docs/classic/ipn/integration-guide/IPNandPDTVariables/ for a full list of variables
$payer_email = $_POST['payer_email'];
$address_country = $_POST['address_country'];
$address_city = $_POST['address_city'];
$address_name = $_POST['address_name'];
$address_state = $_POST['address_state'];
$address_street = $_POST['address_street'];
$address_zip = $_POST['address_zip'];
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$payer_business_name = $_POST['payer_business_name'];
$memo = $_POST['memo'];
$item_name = $_POST['item_name1'];
$quantity = $_POST['quantity1'];
$payment_amount = $_POST['mc_gross_1'];
$name = $first_name .&quot; &quot;. $last_name .&quot; &quot;. $payer_business_name;
$address = $address_name .&quot;&amp;lt;br&amp;gt;&quot;. $address_street .&quot;&amp;lt;br&amp;gt;&quot;. $address_city .&quot; &quot;. $address_state .&quot; &quot;. $address_zip .&quot;&amp;lt;br&amp;gt;&quot;. $address_country;

// Mail variables
$to = 'email@example.com';
// Need to set timezone for date() to work
date_default_timezone_set('America/New_York');
$subject = 'Order placed on '.date(&quot;F d, Y&quot;);
$headers = &quot;MIME-Version: 1.0\r\n&quot;;
$headers .= &quot;Content-Type: text/html; charset=ISO-8859-1\r\n&quot;;
$message = '&amp;lt;html&amp;gt;&amp;lt;body&amp;gt;';
$message .= '&amp;lt;center&amp;gt;&amp;lt;h1&amp;gt;An order has been placed.&amp;lt;/h1&amp;gt;&amp;lt;/center&amp;gt;';
$message .= '&amp;lt;p&amp;gt;Customer email:&amp;lt;br&amp;gt;'.$payer_email.'&amp;lt;/p&amp;gt;';
$message .= '&amp;lt;p&amp;gt;Customer name:&amp;lt;br&amp;gt;'.$name.'&amp;lt;/p&amp;gt;';
$message .= '&amp;lt;p&amp;gt;Customer address:&amp;lt;br&amp;gt;'.$address.'&amp;lt;/p&amp;gt;';
if (!empty($memo)) { $message .= '&amp;lt;p&amp;gt;Message from customer:&amp;lt;br&amp;gt;'.$memo.'&amp;lt;/p&amp;gt;';}
$message .= '&amp;lt;p&amp;gt;Item placed:&amp;lt;br&amp;gt;'.$item_name.'&amp;lt;/p&amp;gt;';
$message .= '&amp;lt;p&amp;gt;Item quantity:&amp;lt;br&amp;gt;'.$quantity.'&amp;lt;/p&amp;gt;';
$message .= '&amp;lt;p&amp;gt;Payment amount:&amp;lt;br&amp;gt;$'.$payment_amount.'&amp;lt;/p&amp;gt;';
$message .= '&amp;lt;/body&amp;gt;&amp;lt;/html&amp;gt;';


// Build the required acknowledgement message out of the notification just received
$req = 'cmd=_notify-validate';               // Add 'cmd=_notify-validate' to beginning of the acknowledgement

foreach ($_POST as $key =&amp;gt; $value) {         // Loop through the notification NV pairs
  $value = urlencode(stripslashes($value));  // Encode these values
  $req  .= &quot;&amp;amp;$key=$value&quot;;                   // Add the NV pairs to the acknowledgement
}


// Set up the acknowledgement request headers
$header .= &quot;POST /cgi-bin/webscr HTTP/1.0\r\n&quot;;
$header .= &quot;Host: www.paypal.com\r\n&quot;;
$header .= &quot;Content-Type: application/x-www-form-urlencoded\r\n&quot;;
$header .= &quot;Content-Length: &quot; . strlen($req) . &quot;\r\n\r\n&quot;;

// Open a socket for the acknowledgement request
$fp = fsockopen ('ssl://www.paypal.com', 443, $errno, $errstr, 30);

// Send the HTTP POST request back to PayPal for validation
fputs($fp, $header . $req);

while (!feof($fp)) {                     // While not EOF
  $res = fgets($fp, 1024);               // Get the acknowledgement response
  if (strcmp ($res, &quot;VERIFIED&quot;) == 0) {  // Response contains VERIFIED - process notification

    // IPN is verified
    // Code here
    mail($to, $subject, $message, $headers);

  }
  else if (strcmp ($res, &quot;INVALID&quot;) == 0) { //Response contains INVALID - reject notification

    // Something went wrong -- begin error handling
    // Code here
    mail($to, &quot;Invalid IPN&quot;, &quot;Invalid IPN&quot;, $headers);

  }
}
fclose($fp);  // Close the file
?&amp;gt;

&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;This article was intended to me more introductory, and you will probably have to find out more information. Here are some useful links:&lt;/p&gt;

&lt;ol&gt;
&lt;li&gt;&lt;a rel=&quot;nofollow&quot; href=&quot;https://developer.paypal.com/docs/classic/ipn/integration-guide/IPNIntro/&quot;&gt;IPN Introduction&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a rel=&quot;nofollow&quot; href=&quot;https://developer.paypal.com/docs/classic/ipn/integration-guide/IPNandPDTVariables/&quot;&gt;IPN Variables&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a rel=&quot;nofollow&quot; href=&quot;https://developer.paypal.com/docs/classic/ipn/ht_ipn/&quot;&gt;How To Process IPN Messages&lt;/a&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;Note that PayPal's examples are sometimes wrong, &lt;a rel=&quot;nofollow&quot; href=&quot;http://stackoverflow.com/questions/17718722/paypal-ipn-sandbox-ipn-listener-no-verified-or-invalid&quot;&gt;especially in the last link&lt;/a&gt; where they totally screw up the code. But, it still does provide a lot of good information.&lt;/p&gt;">Read more →</a></p>
            </div>
          </div>
                              <div class="col-md-4">
            <div class="post">
              <div class="page-header">
                <h2 class="h3">Filter Divs With jQuery</h2>
                <p class="text-muted">October 23<sup>rd</sup>, 2014</p>
              </div>
              <p>I recently needed to filter divs by their class when people pressed the appropriate button. At first I took a look at plugins like Isotope and MixItUp, but they bring in thousands of lines of unwanted code and layout features that are useless to me. So, this is my definitive and lightweight way of sorting divs by their class:


First is the HTML. It's just a group of buttons with ids which will po…</p>
              <p><a href="#" data-toggle="modal" data-target="#post" data-title="Filter Divs With jQuery" data-post="&lt;p&gt;I recently needed to filter &lt;code&gt;div&lt;/code&gt;s by their class when people pressed the appropriate button. At first I took a look at plugins like &lt;a rel=&quot;nofollow&quot; href=&quot;https://isotope.metafizzy.co&quot;&gt;Isotope&lt;/a&gt; and &lt;a rel=&quot;nofollow&quot; href=&quot;https://mixitup.kunkalabs.com&quot;&gt;MixItUp&lt;/a&gt;, but they bring in thousands of lines of unwanted code and layout features that are useless to me. So, this is my definitive and lightweight way of sorting &lt;code&gt;div&lt;/code&gt;s by their class:&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;First is the HTML. It's just a group of buttons with &lt;code&gt;id&lt;/code&gt;s which will point to the classes they are intended to filter and a parent element (with the literal &lt;code&gt;id&lt;/code&gt; of &lt;code&gt;parent&lt;/code&gt;) containing all of the &lt;code&gt;div&lt;/code&gt;s with their classes.&lt;/li&gt;
&lt;/ul&gt;

&lt;pre&gt;&lt;code class=&quot;html&quot;&gt;&amp;lt;button class=&quot;active btn&quot; id=&quot;all&quot;&amp;gt;Show All&amp;lt;/button&amp;gt;
&amp;lt;button class=&quot;btn&quot; id=&quot;a&quot;&amp;gt;Show A&amp;lt;/button&amp;gt;
&amp;lt;button class=&quot;btn&quot; id=&quot;b&quot;&amp;gt;Show B&amp;lt;/button&amp;gt;
&amp;lt;button class=&quot;btn&quot; id=&quot;c&quot;&amp;gt;Show C&amp;lt;/button&amp;gt;
&amp;lt;button class=&quot;btn&quot; id=&quot;d&quot;&amp;gt;Show D&amp;lt;/button&amp;gt;

&amp;lt;!-- An element with an id is needed for the jQuery --&amp;gt;
&amp;lt;div id=&quot;parent&quot;&amp;gt;
  &amp;lt;!-- The base class is the box. Categories are then given as accessory classes. Any div can be in more than one category --&amp;gt;
  &amp;lt;div class=&quot;box a b&quot;&amp;gt;A &amp;amp;amp; B&amp;lt;/div&amp;gt;
  &amp;lt;div class=&quot;box a&quot;&amp;gt;A&amp;lt;/div&amp;gt;
  &amp;lt;div class=&quot;box b&quot;&amp;gt;B&amp;lt;/div&amp;gt;
  &amp;lt;div class=&quot;box c&quot;&amp;gt;C&amp;lt;/div&amp;gt;
  &amp;lt;div class=&quot;box d&quot;&amp;gt;D&amp;lt;/div&amp;gt;
&amp;lt;/div&amp;gt;
&lt;/code&gt;
&lt;/pre&gt;

&lt;ul&gt;
&lt;li&gt;Second in the jQuery.&lt;/li&gt;
&lt;/ul&gt;

&lt;pre&gt;&lt;code class=&quot;javascript&quot;&gt;var $btns = $('.btn').click(function() {
  if (this.id == 'all') {
    $('#parent &amp;gt; div').fadeIn(450);
  } else {
    var $el = $('.' + this.id).fadeIn(450);
    $('#parent &amp;gt; div').not($el).hide();
  }
  $btns.removeClass('active');
  $(this).addClass('active');
})
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;&lt;/p&gt;&lt;hr /&gt;
All together:

&lt;p&gt;&lt;p data-slug-hash=&quot;vGeqC&quot; data-default-tab=&quot;result&quot; data-height=&quot;300&quot; data-theme-id=&quot;0&quot; class=&quot;codepen&quot;&gt;&lt;/p&gt;&lt;/p&gt;">Read more →</a></p>
            </div>
          </div>
                              <div class="col-md-4">
            <div class="post">
              <div class="page-header">
                <h2 class="h3">The Quintessential .htaccess</h2>
                <p class="text-muted">October 23<sup>rd</sup>, 2014</p>
              </div>
              <p>Every project needs a .htaccess and just about every project uses the same one. For the future reference of myself and others, below is my classic .htaccess scheme.


  RewriteEngine On

# Remove www.
&lt;IfModule mod_rewrite.c&gt;
    RewriteCond %{HTTPS} !=on
    RewriteCond %{HTTP_HOST} ^www\.(.+)$ [NC]
    RewriteRule ^ http://%1%{REQUEST_URI} [R=301,L]
&lt;/IfModule&gt;

# Expires caching (Ca…</p>
              <p><a href="#" data-toggle="modal" data-target="#post" data-title="The Quintessential .htaccess" data-post="&lt;p&gt;Every project needs a .htaccess and just about every project uses the same one. For the future reference of myself and others, below is my classic .htaccess scheme.&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;RewriteEngine On

# Remove www.
&amp;lt;IfModule mod_rewrite.c&amp;gt;
    RewriteCond %{HTTPS} !=on
    RewriteCond %{HTTP_HOST} ^www\.(.+)$ [NC]
    RewriteRule ^ http://%1%{REQUEST_URI} [R=301,L]
&amp;lt;/IfModule&amp;gt;

# Expires caching (Caching static files for longer drastically improves performance, you might even want to put even more aggressive times)
&amp;lt;IfModule mod_expires.c&amp;gt;
ExpiresActive On
ExpiresByType image/jpg &quot;access 1 year&quot;
ExpiresByType image/jpeg &quot;access 1 year&quot;
ExpiresByType image/gif &quot;access 1 year&quot;
ExpiresByType image/png &quot;access 1 year&quot;
ExpiresByType text/css &quot;access 1 month&quot;
ExpiresByType text/html &quot;access 1 month&quot;
ExpiresByType text/x-javascript &quot;access 1 month&quot;
ExpiresByType image/x-icon &quot;access 1 year&quot;
ExpiresDefault &quot;access 1 month&quot;
&amp;lt;/IfModule&amp;gt;

# Gzip 
&amp;lt;ifmodule mod_deflate.c&amp;gt;
AddOutputFilterByType DEFLATE text/text text/html text/plain text/xml text/css application/x-javascript application/javascript
&amp;lt;/ifmodule&amp;gt;

# 404 Page
ErrorDocument 404 /404.html

# Remove file extensions
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^([^\.]+)$ $1.html [NC,L]

# Force UTF-8
AddDefaultCharset utf-8
&lt;/code&gt;
&lt;/pre&gt;

&lt;p&gt;You could definetly go further with this—just look at &lt;a rel=&quot;nofollow&quot; href=&quot;https://github.com/h5bp/html5-boilerplate/blob/master/dist/.htaccess&quot;&gt;HTML5 BPs&lt;/a&gt; insane 777 line .htaccess. But that's a bit of an overkill and it feels like there is some unneccessary bloat. This .htaccess contains the essential rules that are always used. I rarely add much to what's above, except when I have a project where I want to password protect a directory using .htaccess. But to do that, I create a seperate .htaccess (and .htpasswd) in a subdirectory. I would go on about it here, but &lt;a rel=&quot;nofollow&quot; href=&quot;http://davidwalsh.name/password-protect-directory-using-htaccess&quot;&gt;David Walsh&lt;/a&gt; does it best.&lt;/p&gt;">Read more →</a></p>
            </div>
          </div>
                  </div>
        <div class="row">
          <div class="col-md-12">
            <hr>
            <p class="text-center text-muted">All posts are originally published on <a href="https://codepen.io/terf/blog/">CodePen</a>, and then republished here.</p>
          </div>
        </div>
      </div>
    </section>

    <section class="hide" id="projects">
      <div class="jumbotron projects-jumbotron">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="inner">
                <h3 class="masthead-brand"><img src="http://timothy.expert/images/logo.svg?v=1" alt="Code" class="img-responsive logo"> Timothy.Expert</h3>
                <nav>
                  <ul class="nav masthead-nav">
                    <li><a href="index" data-hide="#projects">Home</a></li>
                    <li><a href="blog" data-hide="#projects">Blog</a></li>
                    <li class="active"><a href="#" data-hide="#projects">Projects</a></li>
                    <li><a href="contact" data-hide="#projects">Contact</a></li>
                  </ul>
                </nav>
              </div>
              <h1 class="text-center">Projects</h1>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">HereCut</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-4">
                    <p class="description">A small up-and-coming startup, HereCut makes it easy for college students to get affordable, quality haircuts. HereCut completely removes the friction associated with getting a haircut as a busy college student.</p>
                    <p><a href="http://getherecut.com" class="btn btn-primary">View Project</a></p>
                  </div>
                  <div class="col-md-8"><img src="http://timothy.expert/images/herecut-729x455.jpg" alt="http://getherecut.com" class="img-responsive"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">GivingShops</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-4">
                    <p class="description">Launched in 2013, GivingShops is an organization that aims to help people earn for their causes, just by shopping. It works by providing users with affiliate links that forwards the proceeds to their cause.</p>
                    <p><a href="http://givingshops.com" class="btn btn-primary">View Project</a></p>
                  </div>
                  <div class="col-md-8"><img src="http://timothy.expert/images/givingshops-729x455.jpg" alt="http://givingshops.com" class="img-responsive"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">4THEWIN</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-4">
                    <p class="description">4THEWIN is a new fantasy football platform that allows users to bet on which teams will win. From a technical standpoint, 4THEWIN is one of my most interactive applications yet: statistics, depth charts, injury reports, and current scores are all dynamically generated by scraping and parsing data from ESPN.</p>
                    <p><a href="http://4thewin.us" class="btn btn-primary">View Project</a></p>
                  </div>
                  <div class="col-md-8"><img src="http://timothy.expert/images/4thewin-729x455.jpg" alt="http://4thewin.us" class="img-responsive"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Team Flight Basketball</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-4">
                    <p class="description">Built for the needs of the Chicago based youth basketball organization, Team Flight Basketball, this project focused on providing a high degree of customizability to Team Flight Basketball. Behind the scenes, <a href="http://teamflightbasketball.com">teamflightbasketball.com</a> is powered by a custom <abbr title="Content Management System">CMS</abbr> that gives control of both content and design to Team Flight, allowing the organization to quickly and painlessly provide users with relevant content.</p>
                    <p><a href="http://teamflightbasketball.com" class="btn btn-primary">View Project</a></p>
                  </div>
                  <div class="col-md-8"><img src="http://timothy.expert/images/teamflight-729x455.jpg" alt="http://teamflightbasketball.com" class="img-responsive"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

   
       
       
       
       
       
            </form>
          </div>
        </div>
      </div>
    </section>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://timothy.expert/js/bootstrap.min.js"></script>
    <script src="http://timothy.expert/js/highlight.pack.js"></script>
</body>
</html>