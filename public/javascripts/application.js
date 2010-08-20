// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(function() {
  $("#accordion").accordion({
    fillSpace: true
  });
});
$(function() {
  $("button, a", ".demo").button();
  $("button, a", ".demo").click(function() { return false; });
});
$(function() {
  $("#radio").buttonset();
  $("#choices").change(function() {
    var whatButton = $('#choices input:radio:checked').attr("id");
    alert(whatButton);
    //var the_action = $(this).attr("action");
    //alert(the_action);
    //$.get(this.href, { button: whatButton }, null, "script");
    $.post($(this).attr("action"), $(this).serialize(), null, "script");
    //alert('clicked');
    return false;
  });
});
