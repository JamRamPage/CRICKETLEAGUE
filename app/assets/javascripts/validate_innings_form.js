//Validates presence of form entries in innings form
$(document).on('turbolinks:load',function() {
  $("#innings_form").validate({
    rules: {
      "innings[byes]": {required: true},
      "innings[legbyes]": {required: true},
      "innings[penalties]": {required: true},
    }
  });
});
