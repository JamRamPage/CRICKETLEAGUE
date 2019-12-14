//Validates presence of form entries in bowling_innings form
$(document).on('turbolinks:load',function() {
  $("#bowlinnings_form").validate({
    rules: {
      "bowling_innings[overs]": {required: true, min: 0.1, number: true, oversValidFormat: true},
      "bowling_innings[maidens]": {required: true, min: 0, digits: true, lessThanOvers: true},
      "bowling_innings[runs]": {required: true, min: 0, digits: true},
      "bowling_innings[wickets]": {required: true, min: 0, max: 10, digits: true},
      "bowling_innings[no_balls]": {required: true, min: 0, digits: true},
      "bowling_innings[wides]": {required: true, min: 0, digits: true},
    }
  });

  jQuery.validator.addMethod("lessThanOvers", function(value, element) {
    return Math.round($('#bowling_innings_maidens').val()) <= Math.round($('#bowling_innings_overs').val());
  }, "Number of maiden overs must be <= number of overs");

  jQuery.validator.addMethod("oversValidFormat", function(value, element) {
    // The decimal component of the number of integers must be <=5 because 6 deliveries comprises an over (you can't have 4.6 overs because that would just be 5 overs)
    return (Math.round(($('#bowling_innings_overs').val() - Math.floor($('#bowling_innings_overs').val()))*10)) < 6;
  }, "Number of overs cannot be (x).6 or more");
});
