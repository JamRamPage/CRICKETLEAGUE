//Validates the presence of user inputs in the contact mailer form
$(document).on('turbolinks:load',function() {
  $("#contact_form").validate({
    rules: {
      "name": {required: true},
      "email": {required: true},
      "telephone": {required: true},
      "message": {required: true}
    }
  });
});
