//Validates presence of form entries in match form
$(document).on('turbolinks:load',function() {
  $("#match_form").validate({
    rules: {
      "match[stadium]": {required: true},
    }
  });
});
