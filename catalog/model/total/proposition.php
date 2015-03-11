<?php
class ModelTotalProposition extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		$this->load->language('total/proposition');
        $this->load->model('catalog/product');

        $proposition_total = 0;

        $products = $this->cart->getProducts();
        $proposition_products = $this->model_catalog_product->getAllPropositionProducts();
        foreach($products as $product) {
            if(isset($proposition_products[$product['product_id']])) {
                $proposition_total += ($proposition_products[$product['product_id']]['price'] - $proposition_products[$product['product_id']]['price_included'] ) * $product['quantity'];
            }
        }

		$total_data[] = array(
			'code'       => 'proposition',
			'title'      => $this->language->get('text_total'),
			'value'      => '-'.$proposition_total,
			'sort_order' => $this->config->get('total_sort_order')
		);

        $total -= $proposition_total;
	}
}