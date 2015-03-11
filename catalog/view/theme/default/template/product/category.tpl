<?php echo $header; ?>
<div class="wrapper category">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?><i class="fa fa-circle"></i></h2>
      <?php if ($thumb || $description) { ?>
      <!-- <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div> -->
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
      <!-- <h3><?php echo $text_refine; ?></h3> -->
        <div class="row category-slick">
          <?php foreach($categories as $category) { ?>
              <div class="text-center">
                <div class="image">
                  <a href="<?php echo $category['href']; ?>">
                    <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive center-block"/>
                  </a>
                </div>
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
              </div>
          <?php } ?>
        </div>
        <script type="text/javascript">
          $(function () {
            $('.category-slick').slick({
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
      <?php } ?>
      <?php if ($products) { ?>
      <!-- <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p> -->
      <div class="row">
        <div class="col-md-12 text-left">
          <span><?php echo $text_sort; ?></span>
          <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <span><?php echo $sorts['text']; ?></span>
            <?php } else { ?>
              <a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
            <?php } ?>
          <?php } ?>
          <div class="col-md-2">
            <div class="btn-group hidden-xs pull-right">
              <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
              <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            </div>
          </div>
        </div>
        
      </div>
      <br />
      <div class="row" id="products">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
<<<<<<< HEAD
          <!--   <div> -->
              <div class="caption">
                <div class="grid-clearfix">
                  <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                  <?php if ($product['rating']) { ?>
                  <div class="rating">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>

                <p><?php echo $product['description']; ?></p>

                <div class="wrapper-for-list">
                  <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="button-wishlist"><i></i><span>В список желаний</span></button>
                  <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="button-compare"><i></i><span>Сравнить</span></button>
                </div>

                <?php if ($product['price']) { ?>
                <div class="price clearfix">
=======
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>

                <p><?php echo $product['description']; ?></p>

                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="button-wishlist"><i></i><span>В список желаний</span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="button-compare"><i></i><span>Сравнить</span></button>

                <?php if ($product['price']) { ?>
                <div class="price">
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                   <span class="price-old"><?php echo $product['price']; ?></span><span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                
<<<<<<< HEAD
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button-buy"> <span class="hidden-xs"><?php echo $button_cart; ?></span><i class="shopping-cart"></i></button>
=======
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button-buy"> <span class="hidden-xs"><?php echo $button_cart; ?></span><i class="shopping-cart"></i></button>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                </div>
                <?php } ?>
                </div><!-- 
              <div class="button-group col-sm-12">
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div> -->
<<<<<<< HEAD
              <div class="dropdown-caption">
=======

>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                <?php if ($product['options']) { ?>
                    <div class="options clearfix">
                            <div class="option-select col-sm-6 pull-right">
                              <div class="name-select">Размеры</div>
                        <?php foreach ($product['options'] as $option) { ?>
                              <?php if ($option['type'] == 'select') { ?>
                                  <div class="col-sm-4">
                                      <div class="name"><?php echo $option['name']; ?></div>
                                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
<<<<<<< HEAD
                                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="pull-left"/>
                                          <div class="value"><?php echo $option_value['name']; ?>
                                              
                                              <?php if ($option_value['price']) { ?>
                                                  <span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
=======
                                          <div class="value"><?php echo $option_value['name']; ?>
                                              <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="pull-left"/>
                                              <?php if ($option_value['price']) { ?>
                                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                                              <?php } ?>
                                          </div>
                                      <?php } ?>
                                  </div>
                              <?php } ?>
                <?php } ?>
                            </div>

                        <?php foreach ($product['options'] as $option) { ?>

                            <?php if ($option['type'] == 'image') { ?>
                                <div class="option-image col-sm-6">
                                    <div class="name"><?php echo $option['name']; ?></div>
                                  <div class="wrapper-value clearfix">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                      
                                        <div class="value clearfix">
                                            <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"/>
                                        </div>
                                    <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                <?php } ?>
<<<<<<< HEAD

                  <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="button-wishlist"><i></i><span>В список желаний</span></button>
                  <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="button-compare"><i></i><span>Сравнить</span></button>

              </div> <!-- end dropdown-caption-->
            <!--</div> End div-->
=======
            </div>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row" id="pagination">
        <?php if($show_next) { ?>
          <div class="next-page col-sm-12"><button id="get_next_page" onclick="pagination.next()" class="btn btn-success"><?php echo $button_next_page; ?></button></div>
        <?php } ?>
        <div class="col-sm-12"><?php echo $pagination; ?></div>
        <div class="hidden" id="total_pages"><?php echo $total_pages; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
