var ajaxLogin = {
    'submit': function(form) {
        $.ajax({
            url: 'index.php?route=account/ajax_login',
            type: 'post',
            data: $(form).serialize(),
            dataType: 'json',
            success: function(json) {
                var errors = $(form).find('p.text-danger');
                errors.addClass('hidden');
                errors.html("");
                if(json.status) {
                    location.reload();
                }
                else {
                    errors.removeClass('hidden');
                    errors.html(json.msg.warning);
                }
            }
        });
    },
    'show': function() {
        $('#register').modal('hide');
        $('#login').modal('show');
    }
}

var ajaxRegister = {
    'submit': function(form) {
        $.ajax({
            url: 'index.php?route=account/ajax_register',
            type: 'post',
            data: $(form).serialize(),
            dataType: 'json',
            success: function(json) {
                var errors = $(form).find('p.text-danger');
                errors.addClass('hidden');
                errors.html("");
                if(json.status) {
                    $('#register').modal('hide');
                    $('#register_success').modal('show');
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
    },
    'show': function() {
        $('#login').modal('hide');
        $('#register').modal('show');
    }
}
