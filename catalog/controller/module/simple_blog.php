<?php
	class ControllerModuleSimpleBlog extends Controller {
		public function index($setting) {
			$this->language->load('module/simple_blog');
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$this->load->model('simple_blog/article');

            $data['text_comments'] = $this->language->get('text_comments');
            $data['text_show_all'] = $this->language->get('text_show_all');

			$data['articles'] = array();
			
			if ($setting['category_id'] == 'all') {
		    	$data['heading_title'] = $this->language->get('text_latest_all');
				$data['article_link'] = $this->url->link('simple_blog/article');
			} elseif($setting['category_id'] == 'popular') {
				$data['heading_title'] = $this->language->get('text_popular_all');
				$data['article_link'] = $this->url->link('simple_blog/article');
			} else {
				$category_info = $this->model_simple_blog_article->getCategory($setting['category_id']);
				$data['heading_title'] = $category_info['name'];
				$data['article_link'] = $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $setting['category_id']);
			}
			
			if ($setting['category_id'] == 'all') {	
				$filter_data = array(
					'start'           => 0,
					'limit'           => $setting['article_limit'] 
				);
				
			$results = $this->model_simple_blog_article->getArticleModuleWise($filter_data);	
				
			} else if($setting['category_id'] == 'popular') { 
				$filter_data = array(
					'start'           => 0,
					'limit'           => $setting['article_limit'] 
				);
				
				$results = $this->model_simple_blog_article->getPopularArticlesModuleWise($filter_data);
				
			} else {	
				$filter_data = array(
					'filter_category_id' => $setting['category_id'],
					'start'           => 0,
					'limit'           => $setting['article_limit']
				);
			
				$results = $this->model_simple_blog_article->getArticleModuleWise($filter_data);	
			}

            $this->load->model('tool/image');

            if($setting['status']) {                
            
    			foreach($results as $result) {
    				
    				$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '...';
<<<<<<< HEAD
    				
=======
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
    				if($result['featured_image']) {
    					$image = $this->model_tool_image->resize($result['featured_image'], 230, 230);
    				} else if($result['image']) {
    					$image = $this->model_tool_image->resize($result['image'], 230, 230);
    				} else {
<<<<<<< HEAD
    					$image = $this->model_tool_image->resize('no_image.jpg', 230, 230);
=======
    					$image = $this->model_tool_image->resize('no_image.png', 230, 230);
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
    				}

    				$data['articles'][] = array(
    					'simple_blog_article_id'	=> $result['simple_blog_article_id'],
    					'article_title'		=> $result['article_title'],
<<<<<<< HEAD
    					'image'				=> $image,
=======
    					'thumb'				=> $image,
>>>>>>> 5b727248a58fafe0cd14b54a2ca2e114a8ed3dd5
    					'date_added'		=> date($this->language->get('text_date_format'), strtotime($result['date_modified'])),
    					'description'		=> $description,
    					'total_comment'		=> $this->model_simple_blog_article->getTotalComments($result['simple_blog_article_id']),
    					'href'				=> $this->url->link('simple_blog/article/view', 'simple_blog_article_id=' . $result['simple_blog_article_id'], 'SSL')
    				);
    			}
            }		
			
			$data['text_no_found'] = $this->language->get('text_no_result');
			
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/simple_blog.tpl')) {
    			return $this->load->view($this->config->get('config_template') . '/template/module/simple_blog.tpl', $data);
    		} else {
    			return $this->load->view('default/template/module/simple_blog.tpl', $data);
    		}            
		}
	}
?>