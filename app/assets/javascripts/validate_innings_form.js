//Validates presence of form entries in innings form
$(document).on('turbolinks:load',function() {
  $("#innings_form").validate({
    rules: {
      "innings[byes]": {required: true, min: 0, digits: true},
      "innings[legbyes]": {required: true, min: 0, digits: true},
      "innings[penalties]": {required: true, min: 0, digits: true},
    }
  });
});
