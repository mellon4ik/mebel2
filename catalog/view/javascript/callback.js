var callback = {
    'submit': function(form) {
        $.ajax({
            url: 'index.php?route=module/callback',
            type: 'post',
            data: $(form).serialize(),
            dataType: 'json',
            success: function(json) {
                var errors = $(form).find('p.text-danger');
                errors.addClass('hidden');
                errors.html("");
                if(json.status) {
                    $('#callback').modal('hide');
                    $('#callback_success').modal('show');
                }
                else {
                    errors.removeClass('hidden');
                    var message = "";
                    for(var key in json.msg) {
                        message += json.msg[key] + "<br />";
                    }
                    errors.html(message);
                }
            }
        });
    }
}