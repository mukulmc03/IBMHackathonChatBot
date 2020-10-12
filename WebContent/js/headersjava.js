/*
Thanks to https://codepen.io/senff/pen/ayGvD
via https://css-tricks.com/forums/topic/menu-become-fix-header-on-scroll/
*/

$(document).ready(function(){
  
var menu = document.querySelector('.menu');
var origOffsetY = menu.offsetTop;

function scroll () {
  if ($(window).scrollTop() >= origOffsetY) {
    $('.menu').addClass('sticky');
  } else {
    $('.menu').removeClass('sticky');
  }  
  
}

document.onscroll = scroll;

  /*
  Thanks to http://stackoverflow.com/a/18607111
  */
  $('section h1, section h2, section h3').each(function () {
    $(this).html($(this).html().replace(/(\.)/g, '<span class="highlight">$1</span>'));
});
  
});