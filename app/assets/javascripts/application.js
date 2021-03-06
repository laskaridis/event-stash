// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

var EventStash = {

  removeTableRow: function( link ) {
    var $link = $( link );

    $link.prev( "input[type=hidden]" ).val("1");
    $link.closest( "tr" ).hide();
  },

  addTableRow: function( link ) {
    var $link = $( link );
    var content = $link.attr("data-content");
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_row_id", "g");

    var last_row = $link.prev("table").find("tbody");
    $(last_row).append(content.replace(regexp, new_id));
  },

  submitParentForm: function( link ) {
    $( link ).closest( "form" ).submit();
  }
};

$(document).ready(function() {

  $( "a[data-role=remove_table_row" ).click(function( e ) {
    // e.preventDefault();
    //
    // EventStash.removeTableRow( this );
  });

  $( "a[data-role=add_table_row" ).click(function( e ) {
    // e.preventDefault();
    //
    // EventStash.addTableRow( this );
  });
});
