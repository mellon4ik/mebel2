<<<<<<< HEAD
<!-- <h3><?php echo $heading_title; ?><a href="<?php echo $article_link; ?>" class="pull-right"><?php echo $text_show_all; ?></a> </h3>-->
<div class="wrapper wrapper-simple-blog">
    <div class="content-home">
        <?php if ($articles) { ?>
            <?php foreach ($articles as $article) { ?>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

                    <h4>
                        <a href="<?php echo $article['href']; ?>">
                            <img src="<?php echo $article['image']; ?>" class="img-responsive img-thumbnail"/>
                        </a>
                    </h4>

                    <div class="text-center">
                        <a href="<?php echo $article['href']; ?>"><?php echo $article['article_title']; ?></a>
                    </div>
                    <p>
                        <?php echo $article['description']; ?>
                    </p>
                    <p class="text-info">
                        <?php echo $article['date_added']; ?><br />
                        <?php echo $text_comments.$article['total_comment']; ?>
                    </p>
                </div>
            <?php } ?>
        <?php } ?>
    </div>
=======
<h3><?php echo $heading_title; ?><a href="<?php echo $article_link; ?>" class="pull-right"><?php echo $text_show_all; ?></a></h3>
<div class="row">
    <?php if ($articles) { ?>
        <?php foreach ($articles as $article) { //var_dump($article);?>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

                <h4>
                    <a href="<?php echo $article['href']; ?>">
                        <img src="<?php echo $article['thumb']; ?>" class="img-responsive img-thumbnail"/>
                    </a>
                </h4>

                <div class="text-center">
                    <a href="<?php echo $article['href']; ?>"><?php echo $article['article_title']; ?></a>
                </div>
                <p>
                    <?php echo $article['description']; ?>
                </p>
                <p class="text-info">
                    <?php echo $article['date_added']; ?><br />
                    <?php echo $text_comments.$article['total_comment']; ?>
                </p>
            </div>
        <?php } ?>
    <?php } ?>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
</div>