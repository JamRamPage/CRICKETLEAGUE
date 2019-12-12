//Validates presence of form entries in match form
$(document).on('turbolinks:load',function() {
  //Used to validate that the two teams are different
  jQuery.validator.addMethod("notEqual", function(value, element) {
    return $('#match_hometeam_id').val() != $('#match_awayteam_id').val()
  }, "Home team and Away team must be different");
  $("#match_form").validate({
    rules: {
      "match[stadium]": {required: true},
      "match[awayteam_id]": {notEqual: true},
    }
  });
});
