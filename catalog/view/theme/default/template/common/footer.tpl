<footer>
<<<<<<< HEAD
    <div class="wrapper top-footer">
=======
    <div class="row top-footer">
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
        <div class="container">
            <div class="col-sm-3">
                <h5><?php echo $text_company; ?></h5>
                <ul class="list-unstyled">
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
                    <li><a href="<?php echo $guarantee; ?>"><?php echo $text_guarantee; ?></a></li>
                </ul>
            </div>
            <div class="col-sm-6">
                <h5><?php echo $text_catalog; ?></h5>
                <?php foreach ($categories as $key => $category) {
                if ($key == 0) { ?>
                <ul class="list-unstyled col-sm-4">
                    <?php } ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php if (($key + 1) % 3 == 0) { ?>
                </ul>
                <ul class="list-unstyled col-sm-4">
                    <?php } ?>
                    <?php } ?>
<<<<<<< HEAD
                </ul>
=======
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
            </div>
            <div class="col-sm-3">
                <h5><?php echo $text_contact; ?></h5>
                <ul class="list-unstyled">
                    <li><?php echo $telephone_1; ?></li>
                    <li><?php echo $telephone_2; ?></li>
                    <li><?php echo $email; ?></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row bottom-footer">
        <div class="container">
        <p class="pull-left"><?php echo $powered; ?></p>

        <p class="pull-right">
            <a href="<?php echo $facebook; ?>" class="fb-footer"><span></span></a>
            <a href="<?php echo $google_plus; ?>" class="gp-footer"><span></span></a>
            <a href="<?php echo $vk; ?>" class="vk-footer"><span></span></a>

<<<<<<< HEAD

=======
           <!-- after span was  <?php echo $text_vk; ?> or $text_google_plus; $text_facebook; -->
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
        </p>
        </div>
    </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>