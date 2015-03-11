<<<<<<< HEAD
<div class="block-subscribe">
    <h3 class="title-subscribe"><?php echo $heading_title; ?></h3>
    <div class="wrapper">
        <div class="row" id="frm_subscribe">
            <form name="subscribe" id="subscribe">
                <div class="wrapper-subscribe-name">
                    <input type="text" class="form-control" id="subscribe_name" name="subscribe_name" placeholder="<?php echo $entry_name; ?>">
                </div>
                <div class="wrapper-subscribe-email">
                    <input type="email" class="form-control" id="subscribe_email" name="subscribe_email" placeholder="<?php echo $entry_email; ?>">
                </div>
                <?php if ($option_unsubscribe) { ?>
                    <button type="button" class="btn btn-default col-sm-2" onclick="email_subscribe()"><?php echo $entry_button; ?></button>
                    <button type="button" class="btn btn-default col-sm-2" onclick="email_unsubscribe()"><?php echo $entry_unbutton; ?></button>
                <?php } else { ?>
                    <button type="button" class="btn btn-default button-subscribe" onclick="email_subscribe()"><?php echo $entry_button; ?></button>
                <?php } ?>
                <p class="bg-danger" id="subscribe_result"></p>
            </form>
        </div>
    </div>
=======
<h3><?php echo $heading_title; ?></h3>
<div class="row" id="frm_subscribe">
    <form name="subscribe" id="subscribe">
        <div class="col-sm-4">
            <input type="text" class="form-control" id="subscribe_name" name="subscribe_name" placeholder="<?php echo $entry_name; ?>">
        </div>
        <div class="col-sm-4">
            <input type="email" class="form-control" id="subscribe_email" name="subscribe_email" placeholder="<?php echo $entry_email; ?>">
        </div>
        <?php if ($option_unsubscribe) { ?>
            <button type="button" class="btn btn-default col-sm-2" onclick="email_subscribe()"><?php echo $entry_button; ?></button>
            <button type="button" class="btn btn-default col-sm-2" onclick="email_unsubscribe()"><?php echo $entry_unbutton; ?></button>
        <?php } else { ?>
            <button type="button" class="btn btn-default col-sm-4" onclick="email_subscribe()"><?php echo $entry_button; ?></button>
        <?php } ?>
        <p class="bg-danger" id="subscribe_result"></p>
    </form>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
</div>
<script language="javascript">
    function email_subscribe() {
        $.ajax({
            type: 'post',
            url: 'index.php?route=module/newslettersubscribe/subscribe',
            dataType: 'html',
            data: $("#subscribe").serialize(),
            success: function (html) {
                eval(html);
            }
        });
    }
    function email_unsubscribe() {
        $.ajax({
            type: 'post',
            url: 'index.php?route=module/newslettersubscribe/unsubscribe',
            dataType: 'html',
            data: $("#subscribe").serialize(),
            success: function (html) {
                eval(html);
            }
        });
    }
</script>
