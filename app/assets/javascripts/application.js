// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require lightbox
//= require_tree .

$(document).ready(function(){
  setTimeout(function(){
    $('.alert-wrapper').fadeOut("slow", function(){
            $(this).remove();
              })
  }, 3000);
});

$(document).ready(function() {
    $("nav .box [href]").each(function() {
        if (this.href == window.location.href) {
            $(this).addClass("active-link");
        }
    });
});

$(".item-info li").each(function (i) {
    $(this).attr("style", "-webkit-animation-delay:" + i * 200 + "ms;"
                 + "-moz-animation-delay:" + i * 200 + "ms;"
                 + "-o-animation-delay:" + i * 200 + "ms;"
                 + "animation-delay:" + i * 200 + "ms;");
    if (i == $(".item-info li").size() -1) {
        $(".item-info").addClass("play")
    }
});

$(document).scroll(function () {
    var y = $(this).scrollTop();
    if (y > 200) {
        $('.banner').fadeIn("slow");
    }
});
