//Validates presence of form entries in batting_innings form
$(document).on('turbolinks:load',function() {
  $("#batinnings_form").validate({
    rules: {
      "batting_innings[batsman_number]": {required: true},
      "batting_innings[runs]": {required: true},
      "batting_innings[balls]": {required: true},
      "batting_innings[fours]": {required: true},
      "batting_innings[sixes]": {required: true},
    }
  });
});
