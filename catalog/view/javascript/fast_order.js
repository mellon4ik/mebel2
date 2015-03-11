var fast_order = {
    'add': function(form) {
        $.ajax({
            url: 'index.php?route=module/fast_order',
            type: 'post',
            data: $(form).serialize(),
            dataType: 'json',
            success: function(json) {
                var errors = $(form).find('p.text-danger');
                errors.addClass('hidden');
                errors.html("");
                if(json.status) {
                    $('#cart_modal .modal-body').html("");
                    $('#cart_modal .modal-footer').html("");
                    $('#cart_modal .modal-header h4').remove();
                    $('#cart_modal .modal-body').html("<h4>" + json.msg + "</h4>");
                    $('#cart-total').html(json.total);
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