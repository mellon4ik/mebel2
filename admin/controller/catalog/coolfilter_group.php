<?php 
class ControllerCatalogCoolfilterGroup extends Controller { 
	private $error = array();
   
  	public function index() {
		$this->load->language('catalog/coolfilter_group');
	
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/coolfilter_group');
		
    	$this->getList();
  	}
              
  	public function insert() {
		$this->load->language('catalog/coolfilter_group');
	
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/coolfilter_group');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
      		$this->model_catalog_coolfilter_group->addcoolfilterGroup($this->request->post);
		  	
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
      		$this->response->redirect($this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
    	$this->getForm();
  	}

  	public function update() {
		$this->load->language('catalog/coolfilter_group');
	
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/coolfilter_group');
		
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
	  		$this->model_catalog_coolfilter_group->editcoolfilterGroup($this->request->get['coolfilter_group_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}
	
    	$this->getForm();
  	}

  	public function delete() {
		$this->load->language('catalog/coolfilter_group');
	
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/coolfilter_group');
		
    	if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $coolfilter_group_id) {
				$this->model_catalog_coolfilter_group->deletecoolfilterGroup($coolfilter_group_id);
			}
			      		
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . $url, 'SSL'));
   		}
	
    	$this->getList();
  	}
    
  	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
				
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);

		$data['add'] = $this->url->link('catalog/coolfilter_group/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/coolfilter_group/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$data['coolfilter_groups'] = array();

        $filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$coolfilter_group_total = $this->model_catalog_coolfilter_group->getTotalcoolfilterGroups();
	
		$results = $this->model_catalog_coolfilter_group->getcoolfilterGroups($filter_data);

    	foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/coolfilter_group/update', 'token=' . $this->session->data['token'] . '&coolfilter_group_id=' . $result['coolfilter_group_id'] . $url, 'SSL')
			);
			
			$group_categories = $this->model_catalog_coolfilter_group->getGroupCategories($result['coolfilter_group_id']);
		
			$data['coolfilter_groups'][] = array(
				'coolfilter_group_id'    => $result['coolfilter_group_id'],
				'name'               => $result['name'],
				'categories'		 => $result['categories'],
				'sort_order'         => $result['sort_order'],
				'selected'           => isset($this->request->post['selected']) && in_array($result['coolfilter_group_id'], $this->request->post['selected']),
				'action'             => $action
			);
		}	
	
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_categories'] = $this->language->get('column_categories');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');		
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_edit'] = $this->language->get('button_edit');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['sort_name'] = $this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . '&sort=agd.name' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . '&sort=ag.sort_order' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $coolfilter_group_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($coolfilter_group_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($coolfilter_group_total - $this->config->get('config_limit_admin'))) ? $coolfilter_group_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $coolfilter_group_total, ceil($coolfilter_group_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/coolfilter_group_list.tpl', $data));
  	}
  
  	private function getForm() {
     	$data['heading_title'] = $this->language->get('heading_title');
	
    	$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_categories'] = $this->language->get('entry_categories');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

    	$data['button_save'] = $this->language->get('button_save');
    	$data['button_cancel'] = $this->language->get('button_cancel');
    
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}
		
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),    		
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['coolfilter_group_id'])) {
			$data['action'] = $this->url->link('catalog/coolfilter_group/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('catalog/coolfilter_group/update', 'token=' . $this->session->data['token'] . '&coolfilter_group_id=' . $this->request->get['coolfilter_group_id'] . $url, 'SSL');
		}
			
		$data['cancel'] = $this->url->link('catalog/coolfilter_group', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['coolfilter_group_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$coolfilter_group_info = $this->model_catalog_coolfilter_group->getcoolfilterGroup($this->request->get['coolfilter_group_id']);
		}
				
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['coolfilter_group_description'])) {
			$data['coolfilter_group_description'] = $this->request->post['coolfilter_group_description'];
		} elseif (isset($this->request->get['coolfilter_group_id'])) {
			$data['coolfilter_group_description'] = $this->model_catalog_coolfilter_group->getcoolfilterGroupDescriptions($this->request->get['coolfilter_group_id']);
		} else {
			$data['coolfilter_group_description'] = array();
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($coolfilter_group_info)) {
			$data['sort_order'] = $coolfilter_group_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}
		
		$this->load->model('catalog/category');
		$data['categories'] = $this->model_catalog_category->getCategories(0);

		if (isset($this->request->post['option_categories'])) {
		  $data['option_categories'] = $this->request->post['option_categories'];
		} elseif (isset($coolfilter_group_info)) {
		  $data['option_categories'] = $this->model_catalog_coolfilter_group->getGroupCategories($this->request->get['coolfilter_group_id']);
		} else {
		  $data['option_categories'] = array();
		}

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/coolfilter_group_form.tpl', $data));
  	}
  	
	private function validateForm() {
    	if (!$this->user->hasPermission('modify', 'catalog/coolfilter_group')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
	
    	foreach ($this->request->post['coolfilter_group_description'] as $language_id => $value) {
      		if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 64)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		}
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}

  	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/coolfilter_group')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
		
		$this->load->model('catalog/coolfilter');
		
		foreach ($this->request->post['selected'] as $coolfilter_group_id) {
			$coolfilter_total = $this->model_catalog_coolfilter->getTotalcoolfiltersBycoolfilterGroupId($coolfilter_group_id);

			if ($coolfilter_total) {
				$this->error['warning'] = sprintf($this->language->get('error_coolfilter'), $coolfilter_total);
			}
			
			$coolfilter_modules = $this->config->get('coolfilter_module');
			
			$coolfilter_modules_total = 0;
			
			foreach ($coolfilter_modules as $coolfilter_module)
			{
			
				if ($coolfilter_module['coolfilter_group_id'] == $coolfilter_group_id)
				{
					$coolfilter_modules_total++;
				}
				
			}
			
			if ($coolfilter_modules_total > 0)
			{
				$this->error['warning'] = sprintf($this->language->get('error_coolfilter_module'), $coolfilter_modules_total);
			}
	  	}
		
		if (!$this->error) { 
	  		return true;
		} else {
	  		return false;
		}
  	}	  
}
?>