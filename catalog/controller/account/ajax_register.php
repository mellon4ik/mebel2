<?php

class ControllerAccountAjaxRegister extends Controller
{
    private $error = array();

    public function index()
    {
        if ($this->customer->isLogged()) {
            $this->redirect($this->url->link('account/account', '', 'SSL'));
        }

        $this->load->language('account/register');

        $this->load->model('account/customer');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_account_customer->addCustomer($this->request->post);

            echo json_encode(array('status' => true));
        } else {
            echo json_encode(array('status' => false, 'msg' => $this->error));
        }
    }

    public function validate()
    {
        if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
            $this->error['firstname'] = $this->language->get('error_firstname');
        }

//		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
//			$this->error['lastname'] = $this->language->get('error_lastname');
//		}

        if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
            $this->error['email'] = $this->language->get('error_email');
        }

        if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
            $this->error['warning'] = $this->language->get('error_exists');
        }

        if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
            $this->error['telephone'] = $this->language->get('error_telephone');
        }

//		if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
//			$this->error['address_1'] = $this->language->get('error_address_1');
//		}
//
//		if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
//			$this->error['city'] = $this->language->get('error_city');
//		}

//		$this->load->model('localisation/country');
//
//		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
//
//		if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
//			$this->error['postcode'] = $this->language->get('error_postcode');
//		}
//
//		if ($this->request->post['country_id'] == '') {
//			$this->error['country'] = $this->language->get('error_country');
//		}
//
//		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
//			$this->error['zone'] = $this->language->get('error_zone');
//		}

        // Customer Group
//		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
//			$customer_group_id = $this->request->post['customer_group_id'];
//		} else {
//			$customer_group_id = $this->config->get('config_customer_group_id');
//		}

        // Custom field validation
//		$this->load->model('account/custom_field');
//
//		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);
//
//		foreach ($custom_fields as $custom_field) {
//			if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
//				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
//			}
//		}
//
        if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
            $this->error['password'] = $this->language->get('error_password');
        }

        if ($this->request->post['confirm'] != $this->request->post['password']) {
            $this->error['confirm'] = $this->language->get('error_confirm');
        }
//
//		// Agree to terms
//		if ($this->config->get('config_account_id')) {
//			$this->load->model('catalog/information');
//
//			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));
//
//			if ($information_info && !isset($this->request->post['agree'])) {
//				$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
//			}
//		}

        return !$this->error;
    }
}

?>
