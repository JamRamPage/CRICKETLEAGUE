//Validates presence of form entries in batting_innings form
$(document).on('turbolinks:load',function() {
  $("#batinnings_form").validate({
    rules: {
      "batting_innings[batsman_number]": {required: true, min: 1, max: 11, digits: true},
      "batting_innings[runs]": {required: true, min: 0, digits: true},
      "batting_innings[balls]": {required: true, min: 0, digits: true},
      "batting_innings[fours]": {required: true, min: 0, digits: true, notTooManyFours: true, enoughBallsForFours: true},
      "batting_innings[sixes]": {required: true, min: 0, digits: true, notTooManySixes: true, enoughBallsForSixes: true},
    }
  });
  jQuery.validator.addMethod("notTooManyFours", function(value, element) {
    return Math.round($('#batting_innings_fours').val() * 4) <= Math.round($('#batting_innings_runs').val());
  }, "Too many fours for the number of runs");

  jQuery.validator.addMethod("notTooManySixes", function(value, element) {
    return Math.round(($('#batting_innings_sixes').val() * 6)) <= Math.round($('#batting_innings_runs').val());
  }, "Too many sixes for the number of runs");

  jQuery.validator.addMethod("enoughBallsForFours", function(value, element) {
    return Math.round($('#batting_innings_fours').val()) <= Math.round($('#batting_innings_balls').val());
  }, "Number of fours too high for number of deliveries");

  jQuery.validator.addMethod("enoughBallsForSixes", function(value, element) {
    return Math.round($('#batting_innings_sixes').val()) <= Math.round($('#batting_innings_balls').val());
  }, "Number of sixes too high for number of deliveries");

});
