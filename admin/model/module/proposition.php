<?php

class ModelModuleProposition extends Model
{
    public function install()
    {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "proposition`");
        $this->db->query("CREATE TABLE `" . DB_PREFIX . "proposition` (
            `proposition_id` int(11) NOT NULL AUTO_INCREMENT,
            `product_id` int(11) NOT NULL,
            `name` varchar(100) NOT NULL,
            PRIMARY KEY (`proposition_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8");

        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "proposition_product`");
        $this->db->query("
            CREATE TABLE `" . DB_PREFIX . "proposition_product` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `proposition_id` int(11) NOT NULL,
            `product_id` int(11) NOT NULL,
            `price_included` decimal(15,4) NOT NULL,
            `amount` int(11) NOT NULL,
            `sort` int(11) NOT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
    }

    public function uninstall()
    {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "proposition`");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "proposition_product`");
    }
}

?>