$(document).ready(function() {
  $("#contact_form").validate({
    rules: {
      "name": {required: true},
      "email": {required: true},
      "telephone": {required: true},
      "message": {required: true}
    }
  });
});
