<?php
class ControllerCommonCart extends Controller {
	public function index() {
		$this->load->language('common/cart');

		if(isset($this->request->post["quantity"]) && isset($this->request->post["key"])) {
			$this->cart->update($this->request->post["key"], $this->request->post["quantity"]);
		}

		// Totals
		$this->load->model('extension/extension');

		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}

			$sort_order = array();

			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $total_data);
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_cart'] = $this->language->get('text_cart');
		$data['text_cart_modal_header'] = sprintf($this->language->get('text_cart_modal_header'), $this->cart->countProducts(), $this->currency->format($total));
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_items'] = sprintf($this->language->get('text_items'), $this->currency->format($total));
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_featured'] = $this->language->get('text_featured');
		$data['text_related'] = $this->language->get('text_related');

		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_cart'] = $this->language->get('button_cart');

		$this->load->model('tool/image');
		$this->load->model('tool/upload');

		$data['products'] = array();

		$products_in_cart_id = array();

		foreach ($this->cart->getProducts() as $product) {
			$products_in_cart_id[] = $product['product_id'];

			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
			} else {
				$image = '';
			}

			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
			} else {
				$total = false;
			}

<<<<<<< HEAD
=======
            $is_proposition = false;
            $proposition_products = $this->model_catalog_product->getAllPropositionProducts();
            if(isset($proposition_products[$product['product_id']])) {
                $is_proposition = true;
            }

>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
			$data['products'][] = array(
				'key'       => $product['key'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
				'quantity'  => $product['quantity'],
				'price'     => $price,
				'total'     => $total,
<<<<<<< HEAD
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
=======
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id']),
                'is_proposition' => $is_proposition,
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
			);
		}

		//featured
		$this->load->model('catalog/product');
		$this->load->model('extension/module');
		
		$data['products_featured'] = array();

		$products_featured = $this->model_extension_module->getModule(28);
		$products_featured = $products_featured['product'];
		
		foreach ($products_featured as $product_id) {
			if (in_array($product_id, $products_in_cart_id)) {
				continue;
			}
			$product_info = $this->model_catalog_product->getProduct($product_id);
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float) $product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}



				$data['products_featured'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb' => $image,
					'name' => $product_info['name'],
					'price' => $price,
					'special' => $special,
					'rating' => $rating,
					'reviews' => sprintf($this->language->get('text_reviews'), $this->url->link('product/product', 'product_id=' . $product_info['product_id'] . "#tab-review"), (int) $product_info['reviews']),
					'href' => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}

		//related
		$data['products_related'] = array();
		foreach ($this->cart->getProducts() as $product_in_cart) {
			$products_related = $this->model_catalog_product->getProductRelated($product_in_cart['product_id']);
			foreach ($products_related as $product) {
				if (in_array($product['product_id'], $products_in_cart_id)) {
					continue;
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float) $product['special']) {
					$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int) $product['rating'];
				} else {
					$rating = false;
				}

				$data['products_related'][] = array(
					'product_id' => $product['product_id'],
					'thumb' => $image,
					'name' => $product['name'],
					'price' => $price,
					'special' => $special,
					'rating' => $rating,
					'reviews' => sprintf($this->language->get('text_reviews'), $this->url->link('product/product', 'product_id=' . $product['product_id'] . "#tab-review"), (int) $product['reviews']),
					'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}
		}

		$data['products_related'] = array_unique($data['products_related'], SORT_REGULAR);

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}

		$data['totals'] = array();

		foreach ($total_data as $result) {
			$data['totals'][] = array(
				'title' => $result['title'],
				'text'  => $this->currency->format($result['value']),
                'code'  => $result['code'],
			);
		}

		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/cart.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/cart.tpl', $data);
		} else {
			return $this->load->view('default/template/common/cart.tpl', $data);
		}
	}

	public function info() {
		$this->response->setOutput($this->index());
	}
}