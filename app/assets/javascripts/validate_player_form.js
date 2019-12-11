//Validates presence of form entries in player form
$(document).on('turbolinks:load',function() {
  $("#player_form").validate({
    rules: {
      "player[name]": {required: true}
    }
  });
});
