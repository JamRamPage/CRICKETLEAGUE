//Validates presence of form entries in team form
$(document).on('turbolinks:load',function() {
  $("#team_form").validate({
    rules: {
      "team[name]": {required: true},
      "team[won]": {required: true, min: 0, digits: true},
      "team[drawn]": {required: true, min: 0, digits: true},
      "team[lost]": {required: true, min: 0, digits: true},
      "team[noresult]": {required: true, min: 0, digits: true},
    }
  });
});
