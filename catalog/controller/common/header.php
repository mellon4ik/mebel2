<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
<<<<<<< HEAD
		$data['text_register_button'] = $this->language->get('text_register_button');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_header_login'] = $this->language->get('text_header_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_button_login'] = $this->language->get('text_button_login');
=======
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
		$data['text_about'] = $this->language->get('text_about');
		$data['text_delivery'] = $this->language->get('text_delivery');
		$data['text_guarantee'] = $this->language->get('text_guarantee');
		$data['text_credit'] = $this->language->get('text_credit');
		$data['text_help'] = $this->language->get('text_help');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['about'] = $this->url->link('information/information', 'information_id=4', 'SSL');
		$data['delivery'] = $this->url->link('information/information', 'information_id=6', 'SSL');
		$data['guarantee'] = $this->url->link('information/information', 'information_id=3', 'SSL');
		$data['credit'] = $this->url->link('information/information', 'information_id=5', 'SSL');
		$data['help'] = $this->url->link('information/information', 'information_id=7', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['contact'] = $this->url->link('information/contact');
		$data['login_forgotten_password'] = $this->url->link('account/forgotten');

		$data['telephone_1'] = $this->config->get('config_telephone');
		$data['telephone_2'] = $this->config->get('config_telephone_2');
		$data['telephone_3'] = $this->config->get('config_telephone_3');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					// Level 3
					$children_data_2 = array();

					$children_2 = $this->model_catalog_category->getCategories($child['category_id']);

					foreach ($children_2 as $child_2) {
						$filter_data = array(
							'filter_category_id'  => $child_2['category_id'],
							'filter_sub_category' => true
						);

						if($child_2['image']) {
							$image = $this->model_tool_image->resize($child_2['image'], $this->config->get('config_image_main_menu_width'), $this->config->get('config_image_main_menu_height'));
						}
						else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_main_menu_width'), $this->config->get('config_image_main_menu_width'));
						}

						$children_data_2[] = array(
							'name'  => $child_2['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
							'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_2['category_id']),
							'thumb' => $image
						);
					}

					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					if($child['image']) {
						$image = $this->model_tool_image->resize($child['image'], $this->config->get('config_image_main_menu_width'), $this->config->get('config_image_main_menu_height'));
					}
					else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_main_menu_width'), $this->config->get('config_image_main_menu_width'));
					}

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						'thumb' => $image,
						'children' => $children_data_2
					);
				}

<<<<<<< HEAD
				if($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_top_menu_width'), $this->config->get('config_image_top_menu_height'));
				}
				else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_top_menu_width'), $this->config->get('config_image_top_menu_height'));
				}

=======
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
<<<<<<< HEAD
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
					'thumb' => $image,
=======
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}