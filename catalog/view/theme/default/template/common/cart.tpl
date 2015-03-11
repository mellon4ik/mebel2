<div id="cart" class="btn-group btn-block">
<<<<<<< HEAD
    <button type="button" data-toggle="modal" data-target="#cart_modal" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg"><i class="img-cart-menu"></i><span
=======
    <button type="button" data-toggle="modal" data-target="#cart_modal" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg"><i class="fa fa-shopping-cart"></i> <span
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
            id="cart-total"><?php echo $text_items; ?></span></button>

    <div class="modal fade" id="cart_modal" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<<<<<<< HEAD
                    <h4 class="modal-title">Корзина</h4>
                    <div id="cartModalLabel"><?php echo $text_cart_modal_header; ?></div>
=======
                    <h4 class="modal-title" id="cartModalLabel"><?php echo $text_cart_modal_header; ?></h4>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                </div>
                <div class="modal-body">
                    <?php if ($products || $vouchers) { ?>
                        <div>
                            <table class="table table-striped">
<<<<<<< HEAD
                                <thead>
                                <tr>
                                    <td>Товар</td>
                                    <td>Кол-во</td>
                                    <td>Цена, грн</td>
                                </tr>
                                </thead>
=======
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                                <?php foreach ($products as $product) { ?>
                                    <tr>
                                        <td class="text-center"><?php if ($product['thumb']) { ?>
                                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail"/></a>
                                            <?php } ?></td>
                                        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            <?php if ($product['option']) { ?>
                                                <?php foreach ($product['option'] as $option) { ?>
                                                    <br/>
                                                    -
                                                    <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                                                <?php } ?>
                                            <?php } ?>
                                            <?php if ($product['recurring']) { ?>
                                                <br/>
                                                -
                                                <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                                            <?php } ?></td>
                                        <td class="text-right">x
<<<<<<< HEAD
                                            <i class="fa fa-plus" id="plus" onclick="cart.quantity.plus('<?php echo $product['key']; ?>', $(this).parent().find('input').val());"></i>
                                            <input type="text" size="3" value="<?php echo $product['quantity']; ?>" onchange="cart.quantity.update('<?php echo $product['key']; ?>', $(this).val())"/>
                                            <i class="fa fa-minus" id="minus" onclick="cart.quantity.minus('<?php echo $product['key']; ?>', $(this).parent().find('input').val());"></i>
=======
                                            <?php if(!$product['is_proposition']) { ?>
                                            <i class="fa fa-plus" id="plus" onclick="cart.quantity.plus('<?php echo $product['key']; ?>', $(this).parent().find('input').val());"></i>
                                            <input type="text" size="3" value="<?php echo $product['quantity']; ?>" onchange="cart.quantity.update('<?php echo $product['key']; ?>', $(this).val())"/>
                                            <i class="fa fa-minus" id="minus" onclick="cart.quantity.minus('<?php echo $product['key']; ?>', $(this).parent().find('input').val());"></i>
                                            <?php } else { ?>
                                                <?php echo $product['quantity']; ?>
                                            <?php } ?>
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
                                        </td>
                                        <td class="text-right"><?php echo $product['total']; ?></td>
                                        <td class="text-center">
                                            <button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button>
                                        </td>
                                    </tr>
                                <?php } ?>
                                <?php foreach ($vouchers as $voucher) { ?>
                                    <tr>
                                        <td class="text-center"></td>
                                        <td class="text-left"><?php echo $voucher['description']; ?></td>
                                        <td class="text-right">x&nbsp;1</td>
                                        <td class="text-right"><?php echo $voucher['amount']; ?></td>
                                        <td class="text-center text-danger">
                                            <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </table>
                        </div>
                        <div>
                            <div>
                                <table class="table table-bordered">
                                    <?php foreach ($totals as $total) { ?>
                                        <tr>
                                            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
                                            <td class="text-right" id="<?php echo $total['code']; ?>"><?php echo $total['text']; ?></td>
                                        </tr>
                                    <?php } ?>
                                </table>
                                <p class="text-right"><a href="<?php echo $cart; ?>"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $checkout; ?>"><strong><i
                                                class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
                            </div>
                        </div>
                    <?php } else { ?>
                        <div>
                            <p class="text-center"><?php echo $text_empty; ?></p>
                        </div>
                    <?php } ?>
                </div>
                <div class="modal-footer">
                    <?php if (!$products && !empty($products_featured)) { ?>
                        <table class="table table-striped">
                            <caption><?php echo $text_featured; ?></caption>
                            <?php foreach ($products_featured as $product) { ?>
                                <tr class="product-thumb">
                                    <td class="text-center">
                                        <?php if ($product['thumb']) { ?>
                                            <a href="<?php echo $product['href']; ?>">
                                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail"/>
                                            </a>
                                        <?php } ?>
                                    </td>
                                    <td class="text-left">
                                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    </td>
                                    <td class="text-right">
                                        <?php if ($product['special']) { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                            <span class="price-old"><?php echo $product['price']; ?></span>
                                        <?php } else {
                                            echo $product['price'];
                                        }
                                        ?>
                                    </td>
                                    <td class="text-center">
                                        <button onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
                                        </button>
                                    </td>
                                </tr>
                            <?php } ?>
                        </table>
                    <?php } elseif ($products && !empty($products_related)) { ?>
                        <table class="table table-striped">
                            <caption><?php echo $text_related; ?></caption>
                            <?php foreach ($products_related as $product) { ?>
                                <tr class="product-thumb">
                                    <td class="text-center">
                                        <?php if ($product['thumb']) { ?>
                                            <a href="<?php echo $product['href']; ?>">
                                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail"/>
                                            </a>
                                        <?php } ?>
                                    </td>
                                    <td class="text-left">
                                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    </td>
                                    <td class="text-right">
                                        <?php if ($product['special']) { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                            <span class="price-old"><?php echo $product['price']; ?></span>
                                        <?php } else {
                                            echo $product['price'];
                                        }
                                        ?>
                                    </td>
                                    <td class="text-center">
                                        <button onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
                                        </button>
                                    </td>
                                </tr>
                            <?php } ?>
                        </table>
                    <?php } ?>
                    <div id="fast-order">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
