$(function () {
    var elem = "";
    var oldImg = "";
    $('.dropdown-menu .level-3 li').hover(
        function () {
            var imgPath = $(this).find('a').attr('data-image');
            elem = $(this).parents('#level_2_category').find('#category_image');
            oldImg = elem.attr('src');
            elem.attr('src', imgPath);
        },
        function () {
            elem.attr('src', oldImg);
        }
    );
});