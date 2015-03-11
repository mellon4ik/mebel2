<<<<<<< HEAD
<?php echo $header; ?><?php echo $column_left; ?>
=======
<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
    <div id="content" class="clearfix"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
<?php echo $footer; ?>