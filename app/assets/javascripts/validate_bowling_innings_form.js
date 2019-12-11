//Validates presence of form entries in bowling_innings form
$(document).on('turbolinks:load',function() {
  $("#bowlinnings_form").validate({
    rules: {
      "bowling_innings[overs]": {required: true, min: 0.1, number: true},
      "bowling_innings[maidens]": {required: true, min: 0, digits: true},
      "bowling_innings[runs]": {required: true, min: 0, digits: true},
      "bowling_innings[wickets]": {required: true, min: 0, max: 10, digits: true},
      "bowling_innings[no_balls]": {required: true, min: 0, digits: true},
      "bowling_innings[wides]": {required: true, min: 0, digits: true},
    }
  });
});
