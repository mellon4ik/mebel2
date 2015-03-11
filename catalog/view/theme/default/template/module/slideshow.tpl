<div id="slideshow<?php echo $module; ?>" class="slideshow-slick">
    <?php foreach ($banners as $banner) { ?>
        <div>
            <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"/></a>
            <?php } else { ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"/>
            <?php } ?>
        </div>
    <?php } ?>
</div>
<script type="text/javascript">
    $(function () {
        $('.slideshow-slick').slick({
            accessibility: true,
            dots: true,
            arrows: true,
            draggable: true,
            fade: true,
            infinite: true,
            pauseOnHover: true,
            pauseOnDotsHover: true,
            responsive: true,
            slidesToShow: 1,
            slidesToScroll: 1
        });
    });
</script>