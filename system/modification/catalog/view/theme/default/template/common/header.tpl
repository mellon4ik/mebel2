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

				<?php if($ajaxadvancesearch_status){ ?>
				<!--
				/**
					*Ajax advanced search starts
					*/
				-->
				<script type="text/javascript" language="javascript"><!--
					// Ajax advanced search starts						
					$(document).ready(function(){
					var afaxAdvancedSearch = $('input[name="search"]');
						var customAutocomplete = null;
						afaxAdvancedSearch.autocomplete({
							delay: 500,
							responsea : function (items){
								if (items.length) {
									for (i = 0; i < items.length; i++) {
										this.items[items[i]['value']] = items[i];
									}
								}
								var html='';
								if(items.length){
									$.each(items,function(key,item){
										if(item.product_id!=0){
										html += '<li data-value="' + item['value'] + '"><a href="#">';
										html += '<div class="ajaxadvance">';
										html += '<div class="image">';
											if(item.image){
											html += '<img title="'+item.name+'" src="'+item.image+'"/>';
											}
											html += '</div>';
											html += '<div class="content">';
											html += 	'<h3 class="name">'+item.label+'</h3>';
											if(item.model){
											html += 	'<div class="model">';
											html +=		'<?php echo $ajaxadvancedsearch_model; ?> '+ item.model;
											html +=		'</div>';
											}
											if(item.manufacturer){
											html += 	'<div class="manufacturer">';
											html +=		'<?php echo $ajaxadvancedsearch_manufacturer; ?> '+ item.manufacturer;			
											html +=		'</div>';		
											}
											if(item.price){
											html += 	'<div class="price"> <?php echo $ajaxadvancedsearch_price; ?> ';
												if (!item.special) { 
											html +=			 item.price;
												} else {	
											html +=			'<span class="price-old">'+ item.price +'</span> <span class="price-new">'+ item.special +'</span>';
												}	
											html +=		'</div>';
											}
											if(item.stock_status){
											html += 	'<div class="stock_status">';
											html +=		'<?php echo $ajaxadvancedsearch_stock; ?> '+ item.stock_status;			
											html +=		'</div>';
											}
											if (item.rating) {
											html +=		'<div class="ratings"> <?php echo $ajaxadvancedsearch_rating; ?>';
											for (var i = 1; i <= 5; i++) {
											if (item.rating < i) { 
												html +=		'<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>';
											} else {	
												html +=		'<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>';
											} 
											}
											html +=		'</div>';
											}
											html +='</div>';
											html += '</div></a></li>'
										}
									});
								}	
								if (html) {
									afaxAdvancedSearch.siblings('ul.dropdown-menu').show();
								} else {
									afaxAdvancedSearch.siblings('ul.dropdown-menu').hide();
								}

								$(afaxAdvancedSearch).siblings('ul.dropdown-menu').html(html);
							},
							source: function(request, response) {
							customAutocomplete = this;
								$.ajax({
									url: 'index.php?route=common/header/ajaxLiveSearch&filter_name=' +  encodeURIComponent(request),
									dataType : 'json',
									success : function(json) {
										customAutocomplete.responsea($.map(json, function(item) {
											return {
												label: item.name,
												name: item.name1,
												value: item.product_id,
												model: item.model,
												stock_status: item.stock_status,
												image: item.image,
												manufacturer: item.manufacturer,
												price: item.price,
												special: item.special,
												category: item.category,
												rating: item.rating,
												reviews: item.reviews,
											}
										}));
									}
								});
							},
							select : function (ui){
								return false;
							},
							selecta: function(ui) {
								if(ui.value){
									location = 'index.php?route=product/product/&product_id='+ui.value;
								}else{
								$('#search input[name=\'search\']').parent().find('button').trigger('click');
								}
								return false;
							},
							focus: function(event, ui) {
								return false;
							}
						});
						
						afaxAdvancedSearch.siblings('ul.dropdown-menu').delegate('a', 'click', function(){
							value = $(this).parent().attr('data-value');
							if (value && customAutocomplete.items[value]) {
								customAutocomplete.selecta(customAutocomplete.items[value]);
							}
						});					
					});
					//Ajax advanced search ends
				//--></script>
				<style>
				#search .dropdown-menu {z-index: 666 !important; background: #fff; width: 100%;}
				#search .dropdown-menu li:nth-child(even){background: #FFFFFF;  border: 1px solid #dbdee1;}
				#search .dropdown-menu li:nth-child(odd){background: #E4EEF7;  border: 1px solid #fff;}
				#search .dropdown-menu li, .ui-menu .ui-menu-item { margin-bottom: 10px;}
				#search .dropdown-menu a {border-radius: 0; white-space: normal; }
				#search .ajaxadvance { width: 100%; min-height: <?php echo (int)$ajaxadvancesearch_imageheight+ (int)$ajaxadvancesearch_imageheight*20/100;?>px; }
				#search .ajaxadvance .name { margin:0; }
				#search .ajaxadvance .image { display:inline-flex; float: left; margin-right:10px; width: <?php echo (int)$ajaxadvancesearch_imagewidth;?>px; }
				#search .ajaxadvance .content { display:inline-block;	max-width: 300px;}
				#search .ajaxadvance .content > div { margin-top:5px;	}
				#search .ajaxadvance .price-old {color: #ff0000; text-decoration: line-through; }
				#search .ajaxadvance .highlight {color: #38b0e3; }
				</style>
				<!--
				/**
					*Ajax advanced search ends
					*/
				-->
				<?php } ?>
			
<?php if ($categories) { ?>
    <!-- <div class="wrapper"> -->
        <nav id="menu" class="navbar">
        <div class="wrapper">
            <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><img src="<?php echo $category['thumb']; ?>"><?php echo $category['name']; ?></a>

                                <div class="dropdown-menu">
                                    <div class="dropdown-inner">
                                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                            <ul class="list-unstyled level-2">
                                                <?php foreach ($children as $child) { ?>
                                                    <li class="level_2_category">
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

        </div>
        </nav>
    <!-- </div> -->
<?php } ?>
