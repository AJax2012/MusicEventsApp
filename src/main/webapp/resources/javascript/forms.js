$(document).ready(function() {
   $('#add-event-button').click(function() {
        var url = $('#event-form-modal').data('url');

        $.get(url, function(data) {
            $('#event-form-container').html(data);

            $('#event-form-modal').modal('show');
        });
   });
});