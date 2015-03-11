<?php if ($reviews) { ?>
    <?php foreach ($reviews as $review) { ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><?php echo $review['author']; ?>
                    <small class="pull-right"><?php echo $review['date_added']; ?></small>
                </h3>

            </div>
            <div class="panel-body">
                <?php echo $review['text']; ?>
            </div>
            <div class="panel-footer">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($review['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                <?php } ?>
                <a href="javascript: void(null);" data-parent-id="<?php echo $review['review_id']; ?>" class="pull-right review-reply"><?php echo $text_reply; ?></a>

                <?php if (!empty($review['reply'])) { ?>
                    <?php foreach ($review['reply'] as $reply) { ?>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><?php echo $reply['author']; ?>
                                    <small class="pull-right"><?php echo $reply['date_added']; ?></small>
                                </h3>

                            </div>
                            <div class="panel-body">
                                <?php echo $reply['text']; ?>
                            </div>
                            <div class="panel-footer">
                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                    <?php if ($reply['rating'] < $i) { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                    <?php } else { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    <?php } ?>
    <div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
    <p><?php echo $text_no_reviews; ?></p>
<?php } ?>
