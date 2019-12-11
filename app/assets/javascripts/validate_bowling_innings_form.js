//Validates presence of form entries in bowling_innings form
$(document).on('turbolinks:load',function() {
  $("#bowlinnings_form").validate({
    rules: {
      "bowling_innings[overs]": {required: true},
      "bowling_innings[maidens]": {required: true},
      "bowling_innings[runs]": {required: true},
      "bowling_innings[wickets]": {required: true},
      "bowling_innings[no_balls]": {required: true},
      "bowling_innings[wides]": {required: true},
    }
  });
});
