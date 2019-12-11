//Validates presence of form entries in batting_innings form
$(document).on('turbolinks:load',function() {
  $("#batinnings_form").validate({
    rules: {
      "batting_innings[batsman_number]": {required: true, min: 1, max: 11, digits: true},
      "batting_innings[runs]": {required: true, min: 0, digits: true},
      "batting_innings[balls]": {required: true, min: 0, digits: true},
      "batting_innings[fours]": {required: true, min: 0, digits: true},
      "batting_innings[sixes]": {required: true, min: 0, digits: true},
    }
  });
});
