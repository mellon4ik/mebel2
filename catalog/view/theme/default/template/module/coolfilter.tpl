<?php if ($coolfilters) { ?>
    <noindex>
        <div class="box coolfilter">
            <!-- <div class="box-heading"><?php echo $heading_title; ?></div> -->
<<<<<<< HEAD
            <div class="box-name">Параметры</div>
            <div class="box-content">
                <!-- <h3>Цена:</h3> -->
=======
            <div class="box-content">
                <h3> Сортировка по цене </h3>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                <?php foreach ($coolfilters as $coolfilter) { ?>
                    <?php if (isset($coolfilter['coolfilters'])) { ?>
                        <?php if ($coolfilter['style_id'] == 'list') { ?>
                            <div class="coolfilter-item coolfilter-item-list">
                                <b><?php echo $coolfilter['name']; ?></b>
                                <ul>
                                    <?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
                                        <?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
                                            <li><a href="<?php echo $coolfilter_value['href']; ?>" <?php if ($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>"
                                                   data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?></a> <?php echo $coolfilter_value['view_count']; ?></li>
                                        <?php } else { ?>
                                            <li><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?></li>
                                        <?php } ?>
                                    <?php } ?>
                                </ul>
                            </div>
                        <?php } ?>
                        <?php if ($coolfilter['style_id'] == 'checkbox') { ?>
                            <div class="coolfilter-item coolfilter-item-checkbox">
                                <b><?php echo $coolfilter['name']; ?></b>
                                <ul>
                                    <?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
                                        <?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
                                            <li class="active_my">
<<<<<<< HEAD
                                                <div class="inputChackWrap clearfix"><input type="checkbox" <?php if ($coolfilter_value['active']) { ?>checked="checked"<?php } ?>>
                                                <a href="<?php echo $coolfilter_value['href']; ?>" <?php if ($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>"
                                                   data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?></a> <span><?php echo $coolfilter_value['view_count']; ?></span></div></li>
                                        <?php } else { ?>
                                            <li class="disable_my">
                                                <div class="inputChackWrap clearfix"><input type="checkbox" disabled="disabled"></div>
=======
                                                <div class="inputChackWrap"><input type="checkbox" <?php if ($coolfilter_value['active']) { ?>checked="checked"<?php } ?>></div>
                                                <a href="<?php echo $coolfilter_value['href']; ?>" <?php if ($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>"
                                                   data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?></a> <span><?php echo $coolfilter_value['view_count']; ?></span></li>
                                        <?php } else { ?>
                                            <li class="disable_my">
                                                <div class="inputChackWrap"><input type="checkbox" disabled="disabled"></div>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                                                <span><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?></span></li>
                                        <?php } ?>
                                    <?php } ?>
                                </ul>
                            </div>
                        <?php } ?>

                        <?php if ($coolfilter['style_id'] == 'select') { ?>
                            <div class="coolfilter-item coolfilter-item-select">
                                <div class="coolfilter-item-select-head"><?php echo $coolfilter['name']; ?>
                                    <div class="coolfilter-item-select-button"></div>
                                </div>
                                <div class="coolfilter-item-select-list">
                                    <ul>
                                        <?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
                                            <?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
                                                <li><input type="checkbox" <?php if ($coolfilter_value['active']) { ?>checked="checked"<?php } ?>><a href="<?php echo $coolfilter_value['href']; ?>"
                                                                                                                                                     <?php if ($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?>
                                                                                                                                                     data-key="<?php echo $coolfilter_value['key']; ?>"
                                                                                                                                                     data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?></a> <?php echo $coolfilter_value['view_count']; ?>
                                                </li>
                                            <?php } else { ?>
                                                <li><input type="checkbox" disabled="disabled"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?></li>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                        <?php } ?>

                        <?php if ($coolfilter['style_id'] == 'image') { ?>
                            <div class="coolfilter-item coolfilter-item-image">
                                <div class="coolfilter-item-image-head"><?php echo $coolfilter['name']; ?></div>
                                <?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
                                    <?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
                                        <a href="<?php echo $coolfilter_value['href']; ?>" <?php if ($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>"
                                           data-value="<?php echo $coolfilter_value['value']; ?>"><img src="<?php echo $coolfilter_value['image']; ?>" alt="<?php echo $coolfilter_value['name']; ?><?php echo $coolfilter_value['view_count']; ?>"
                                                                                                       title="<?php echo $coolfilter_value['name']; ?><?php echo $coolfilter_value['view_count']; ?>"></a>
                                    <?php } else { ?>
                                        <img src="<?php echo $coolfilter_value['image']; ?>" alt="<?php echo $coolfilter_value['name']; ?><?php echo $coolfilter_value['view_count']; ?>"
                                             title="<?php echo $coolfilter_value['name']; ?><?php echo $coolfilter_value['view_count']; ?>">
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        <?php } ?>

                        <?php if ($coolfilter['style_id'] == 'slider') { ?>
                            <div class="coolfilter-item coolfilter-item-slider" id="<?php echo($coolfilter['type_index']); ?>">
                                <div class="coolfilter-item-slider-body">
                                    <input type="text" id="price"  style="display: none;" data-key="p" data-value="<?php echo $coolfilter['coolfilters'][0]['value'] . ',' . $coolfilter['coolfilters'][1]['value']; ?>" />
                                    <div id="slider-range" data-key="p" class="slider-range coolfilter_active"></div>
                                </div>
                                <script>
                                    function initSlider() {
                                        if (/\Wp:[\d\.]+,[\d\.]+/.test(location.href)) {
                                            var myRe = /\Wp:([\d\.]+),([\d\.]+)/;
                                            var pricecoolfilterValue = myRe.exec(location.href);
                                            startValue = pricecoolfilterValue[1];
                                            endValue = pricecoolfilterValue[2];
                                            $("#price").attr('data-value', startValue + ',' + endValue);
                                            $("#slider-range").attr('data-value', startValue + ',' + endValue);
                                        } else {
                                            startValue = <?php echo $coolfilter['coolfilters'][0]['value']; ?>;
                                            endValue = <?php echo $coolfilter['coolfilters'][1]['value']; ?>;
                                        }
                                        min = <?php echo $coolfilter['coolfilters'][0]['value']; ?>;
                                        max = <?php echo $coolfilter['coolfilters'][1]['value']; ?>;
                                        values: [startValue, endValue];

                                        $("#<?php echo($coolfilter['type_index']); ?> .slider-range").ionRangeSlider({
                                            min: min,
                                            max: max,
                                            type: "double",
                                            hasGrid: true,
                                            postfix: '<?php echo $currency_symbol_right; ?>',
                                            from: startValue,
                                            to: endValue,
                                            onFinish: function (obj) {
                                                value = obj.fromNumber + "," + obj.toNumber;
                                                $("#<?php echo($coolfilter['type_index']); ?> div#slider-range").attr('data-value', value);
//                                            $("#<?php //echo($coolfilter['type_index']); ?>// input").addClass("coolfilter_active");
                                                apply();
                                            },
                                            onLoad: function (obj) {

                                            }
                                        });
                                    }
                                    initSlider();
                                </script>
                            </div>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>

                <!--<a onclick="apply();"; id="coolfilter_apply_button" class="button"><span><?php echo $text_apply; ?></span></a>-->

            </div>
            <div class="bottom">&nbsp;</div>
        </div>
    </noindex>
<?php } ?>

<script>
    $(document).ready(function () {

        if ($(".coolfilter_active").not("#price").length > 0) {

            var arr = {};
            $(".coolfilter-item").not("#price").each(function (i) {

                var urls = {};
                $(this).find(".coolfilter_active").each(function (i) {
                    urls[+i] = $(this).parent('').find('a')[0].outerHTML;
                });

                name = $(this).find('b').text();
                arr[+i] = {
                    'name': name,
                    'urls': urls,
                };

            });


            var selected = '<div class="coolfilter-item coolfilter-item-checkbox coolfilter-selected" id="coolfilter-selected"><div>Выбранные параметры:</div>';
            $.each(arr, function (index, val) {

                if (!$.isEmptyObject(val.urls)) {
                    selected += '<div class="coolfilter-selected-group"><b>' + val.name + '</b><ul>';
                    urls = '';
                    $.each(val.urls, function (index, val) {
                        selected += '<li>' + val + '</li>';
                        ;
                    })
                    selected += '</div></ul>';
                }
                ;

            });
            selected += '<br><a onclick="resetcoolfilter();"><?php echo $text_reset_coolfilter; ?></a><br>';
            selected += '</div>';

            $(".coolfilter .box-heading").after(selected);
            $(".coolfilter-selected ul li a").each(function () {
                $(this).removeClass('coolfilter_active');
                $(this).html('<span style="color:red">&times; </span>' + $(this).html());
            });

        }
    });


</script>

<script>
    function apply() {

        $(".coolfilter").addClass('disable');


        var coolfilter = '';
        var arr = {};
        $(".coolfilter_active").each(function (i) {
            var key = $(this).attr("data-key");
            var value = $(this).attr("data-value");
            if (arr[key] === undefined) {
                arr[key] = '';
                arr[key] += value;
            } else {
                arr[key] += ',' + value;
            }

        });

        $.each(arr, function (index, val) {
            coolfilter += index + ':' + val + ';';
        });
        coolfilter = coolfilter.substr(0, coolfilter.length - 1);
        setUrl(coolfilter);
    }
    ;

    function setUrl(coolfilter) {
        var href = location.href;

        var exp = /&page=(.*?)(&|$)/g;
        href = href.replace(exp, "");
        var exp = /&coolfilter=(.*?)(&|$)/g;
        href = href.replace(exp, "");
        href = href.replace(exp, "$2") + '&coolfilter=' + coolfilter;

        window.history.pushState(null, null, href);

        $.ajax({
            url: href,
            type: 'GET',
            success: function(data) {
                var products = $(data).find('#products').html();
                var pagination = $(data).find('#pagination').html();
                var filter = $(data).find('.coolfilter').html();
                $('#products').html(products);
                $('#pagination').html(pagination);
                $('.coolfilter').html(filter);

                if (localStorage.getItem('display') == 'list') {
                    $('#list-view').trigger('click');
                } else {
                    $('#grid-view').trigger('click');
                }

                initSlider();
                filterClick();
            }
        });

        $(".coolfilter").removeClass('disable');
    }

    /*
     function addButtonReset() {
     var href = location.href;
     if (/(\?|&)coolfilter=(.*?)/.test(href)) {
     $(".coolfilter-selected").append('<br><a onclick="resetcoolfilter();"><?php echo $text_reset_coolfilter; ?></a><br>');
     }
     }

     addButtonReset();
     */
    function resetcoolfilter() {
        var href = location.href;
        var exp = /(\?|\&)coolfilter=(.*)?(&|$)/g;
        href = href.replace(exp, "");
        location = href;
    }

    $(".coolfilter-item-select-head").click(function () {
        $(".coolfilter-item-select-list").not($(this).next(".coolfilter-item-select-list")).hide();
        $(this).next(".coolfilter-item-select-list").toggle();
        return false;
    });

    $(document).click(function (e) {
        var $target = $(e.target);
        if (!$target.is("a") && !$target.is("input:checkbox")) {
            $(".coolfilter-item-select-list").hide();
        }
    });

    function filterClick() {
        $(".coolfilter-item a").on('click', function (e) {
            e.preventDefault();
            $(this).toggleClass("coolfilter_active");
            var checkbox = $(this).siblings("input:checkbox");
            if (checkbox.is(':checked')) {
                checkbox.attr('checked', false);
                $(this).parent().find('.inputChackWrap').css('background', 'transparent');
            } else {
                checkbox.attr('checked', true);
            }
            apply();
        });

        $(".coolfilter-item-checkbox .inputChackWrap, .coolfilter-item-checkbox input:checkbox,  .coolfilter-item-checkbox a, .coolfilter-item-select input:checkbox").on('click', function () {
            $(this).siblings("a").toggleClass("coolfilter_active");
            apply();
        });
    }
    filterClick();

</script>