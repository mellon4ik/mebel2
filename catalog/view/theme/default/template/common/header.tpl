<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>"/>
    <?php } ?>

    <link href="catalog/view/theme/default/style/style.css" rel="stylesheet" type="text/css"/>
<<<<<<< HEAD
=======
    <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet" type="text/css"/>
    <link href="catalog/view/theme/default/stylesheet/selectordie.css" rel="stylesheet" type="text/css"/>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5

    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/category_image.js" type="text/javascript"></script>
    <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php echo $google_analytics; ?>
    <script src="catalog/view/javascript/jquery.maskedinput.min.js" type="text/javascript"></script>
    <script>
        $(function() {
            $('input[name=telephone]').mask("+380 (999) 999-99-99");
        });
    </script>
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
    <div class="wrapper">
        <?php //echo $currency; ?>
        <?php //echo $language; ?>
        <div class="nav pull-left">
            <ul class="list-inline">
                <li><a href="<?php echo $about; ?>"><span class="hidden-xs"><?php echo $text_about; ?></span></a></li>
                <li><a href="<?php echo $delivery; ?>"><span class="hidden-xs"><?php echo $text_delivery; ?></span></a></li>
                <li><a href="<?php echo $guarantee; ?>"><span class="hidden-xs"><?php echo $text_guarantee; ?></span></a></li>
                <li><a href="<?php echo $credit; ?>"><span class="hidden-xs"><?php echo $text_credit; ?></span></a></li>
                <li><a href="<?php echo $help; ?>"><span class="hidden-xs"><?php echo $text_help; ?></span></a></li>
                <li><a href="<?php echo $contact; ?>"><span class="hidden-xs"><?php echo $text_contact; ?></span></a></li>
            </ul>
        </div>
        <div id="top-links" class="nav pull-right modal-">
            <ul class="list-underlined">
                <?php if ($logged) { ?>
                    <li><a href="<?php echo $account; ?>" class="a-enter"><span class="span-enter hidden-xs"><?php echo $text_account; ?></span></a></li>
                    <li><a href="<?php echo $logout; ?>" class="a-registration"><span class="span-registration hidden-xs"><?php echo $text_logout; ?></span></a></li>
                <?php } else { ?>
                    <li><a href="<?php echo $login; ?>" class="a-enter"><span class="span-enter hidden-xs"><?php echo $text_login; ?></span></a></li>
                    <li><a href="<?php echo $register; ?>" class="a-registration"><span class="span-registration hidden-xs"><?php echo $text_register; ?></span></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
</nav>
<header>
    <div class="wrapper">
        <div class="row">
            <div class="col-sm-3">
                <div id="logo">
                    <?php if ($logo) { ?>
                        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/></a>
                    
                        <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>
                </div>
            </div>
            <div class="col-sm-6"><?php echo $search; ?>
            </div>
            <div class="col-sm-3 telephone">
                <span><?php echo $telephone_1; ?></span><br/>
                <span><?php echo $telephone_2; ?></span><br/>
                <span><?php echo $telephone_3; ?></span><br/>
            </div>
        </div>
    </div>
</header>
<?php if ($categories) { ?>
<<<<<<< HEAD
    <!-- <div class="wrapper"> -->
        <nav id="menu" class="navbar">
        <div class="wrapper">
=======
    <div class="wrapper">
        <nav id="menu" class="navbar">
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
            <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
<<<<<<< HEAD
                            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><img src="<?php echo $category['thumb']; ?>"><?php echo $category['name']; ?></a>
=======
                            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5

                                <div class="dropdown-menu">
                                    <div class="dropdown-inner">
                                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                            <ul class="list-unstyled level-2">
                                                <?php foreach ($children as $child) { ?>
<<<<<<< HEAD
                                                    <li class="level_2_category">
=======
                                                    <li id="level_2_category">
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                                                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                        <img src="<?php echo $child['thumb']; ?>" id="category_image" />
                                                        <?php if ($child['children']) { ?>
                                                            <ul class="list-unstyled level-3">
                                                                <?php foreach ($child['children'] as $child_2) { ?>
                                                                    <li>
                                                                        <a href="<?php echo $child_2['href']; ?>" data-image="<?php echo $child_2['thumb']; ?>"><?php echo $child_2['name']; ?></a>
                                                                    </li>
                                                                <?php } ?>
                                                            </ul>
                                                        <?php } ?>
                                                    </li>
                                                <?php } ?>
                                            </ul>
                                        <?php } ?>
                                    </div>
                                    <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a></div>
                            </li>
                        <?php } else { ?>
                            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    <?php } ?>
                </ul>
                <div class="col-sm- pull-right"><?php echo $cart; ?></div>
            </div>
<<<<<<< HEAD

        </div>
        </nav>
    <!-- </div> -->
=======
        </nav>
    </div>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
<?php } ?>
