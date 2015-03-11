var arrow_enabled = 1; // 0 выключить стрелочку вверх
var container = ''; //определяется в функции getContainer
var page = 1;
var wh = 0;
var load = false;
var ct = 0;
var pages = [];
var filter_ajax = false;
var tmp_data_container = '';
var container_first_div = '';

function getNextPage() {
    if (load) return;
    if (!filter_ajax) {
        if (page > pages.length) return;
        page++;
    } else {
        if ($('.pagination b').next().length == 0) return;
    }
    load = true;

    if (filter_ajax) {
        h = parseFloat($(container).css('height'));
        $(container).css('height', h + 'px');
        tmp_data_container = $(container).html();
        container_first_div = $(container).find('div').eq(0).html();
    }
    w = parseFloat($(container).css('width'));
    $(container).parent().append('<div class="ajaxblock" style="width:' + w + 'px;height:30px;margin-top:20px;text-align:center;border:none !important;"><img src="image/loader.gif" /></div>');

    if (!filter_ajax) {
        console.log(pages);
        $.ajax({
            url: pages[page - 2],
            type: "GET",
            data: '',
            success: function (data) {
                $data = $(data);
                $('.ajaxblock').remove();
                if ($data) {
                    if ($data.find('.product-list').length > 0) {
                        $(container).parent().append($data.find('.product-list').parent().html());
                    } else if ($data.find('.product-grid').length > 0) {
                        $(container).parent().append($data.find('.product-grid').parent().html());
                    } else {
                        $(container).parent().append($data.find(container).parent().html());
                    }

                    var cur_page = $data.find(".pagination .active span").text();
                    var total_pages = $data.find("#total_pages").text();

                    if (cur_page === total_pages) {
                        $('.next-page #get_next_page').addClass('hidden');
                    }

                    $(".pagination").html($data.find(".pagination").html());
                }

                if (localStorage.getItem('display') == 'list') {
                    $('#list-view').trigger('click');
                } else {
                    $('#grid-view').trigger('click');
                }

                load = false;
            }
        });
    } else {
        $('.pagination b').next().click();
        setTimeout('checkData()', 100);
    }

}

function checkData() {
    if (container_first_div == $(container).find('div').eq(0).html()) {
        setTimeout('checkData()', 100);
    } else {
        $(container).prepend(tmp_data_container);
        $('#ajaxblock').remove();
        $(container).css('height', 'auto');
        load = false;
    }
}

function scroll_top_page() {
    $('html, body').animate({
        scrollTop: 0
    }, 400, function () {
        $('.arrow-scroll-top').remove();
    });

}

function getContainer() {
    if ($('.product-list').length > 0) {
        container = '.product-list';
    } else if ($('.product-grid').length > 0) {
        container = '.product-grid';
    } else {
        container = '.класс';
    }
    return container;
}

$(document).ready(function () {
    wh = $(window).height();
    container = getContainer();

    if ($(container).length > 0) {
        ct = parseFloat($(container).offset().top);
        filter_ajax = (typeof doFiltergs == 'function') || (typeof doFilter == 'function');

        $(window).scroll(function () {
            container = getContainer();
            ch = $(container).height();
            scroll_t = $(this).scrollTop();
            if (arrow_enabled) {
                if (scroll_t > 100) {
                    if ($('.arrow-scroll-top').length == 0) {
                        $('body').append('<a class="arrow-scroll-top" onclick="scroll_top_page();"></a>')
                    }
                } else {
                    $('.arrow-scroll-top').remove();
                }
            }
        });
    }
});

var pagination = {
    'next': function() {
        $('.pagination a').each(function () {
            href = $(this).attr('href');
            if (jQuery.inArray(href, pages) == -1) {
                pages.push(href);
            }
        });

        getNextPage();
    }
}