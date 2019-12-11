//Validates presence of form entries in team form
$(document).on('turbolinks:load',function() {
  $("#team_form").validate({
    rules: {
      "team[name]": {required: true},
      "team[won]": {required: true},
      "team[drawn]": {required: true},
      "team[lost]": {required: true},
      "team[noresult]": {required: true},
    }
  });
});
