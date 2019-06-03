// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery/dist/jquery
//= require bootstrap/dist/js/bootstrap.bundle
//= require activestorage
//= require turbolinks
//= require underscore/underscore
//= require gmaps/google
//= require jquery.sticky/dist/jquery.sticky

//= require_tree .

$(document).on('turbolinks:load', function () {
    $('#esconder').click(function (e) { 
        e.preventDefault();
        $('#sidepanel').hide();
    });
    $('#mostrar').click(function (e) {
        e.preventDefault();
        $('#sidepanel').show();
    });
    //$("#main-nav").sticky({ topSpacing: 0 });
})