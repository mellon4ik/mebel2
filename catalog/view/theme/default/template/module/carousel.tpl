<<<<<<< HEAD
<div class="wrapper wrapper-brand-border">
    <div class="wrapper-brand">
        <h3><?php echo $heading_title; ?></h3>
        <div id="carousel<?php echo $module; ?>" class="carousel-slick">
            <?php foreach ($banners as $banner) { ?>
                <div class="item text-center">
                    <?php if ($banner['link']) { ?>
                        <a href="<?php echo $banner['link']; ?>" class="center-block"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"/></a>
                    <?php } else { ?>
                        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive center-block"/>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
    </div>
=======
<h3><?php echo $heading_title; ?></h3>
<div id="carousel<?php echo $module; ?>" class="carousel-slick">
    <?php foreach ($banners as $banner) { ?>
        <div class="item text-center">
            <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>" class="center-block"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"/></a>
            <?php } else { ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive center-block"/>
            <?php } ?>
        </div>
    <?php } ?>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
</div>
<script type="text/javascript">
    $(function () {
        $('.carousel-slick').slick({
            accessibility: true,
            arrows: true,
            draggable: true,
            infinite: true,
            pauseOnHover: true,
            pauseOnDotsHover: true,
            slidesToShow: 6,
            slidesToScroll: 1,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 4
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2
                    }
                },
            ]
        });
    });
</script>