<?php

class ModelModuleProductOptionImage extends Model
{
    public function install()
    {
        if (!$this->existColumn()) {
            $this->addColumn();
        }
    }

    public function uninstall() {
        if($this->existColumn()) {
            $this->removeColumn();
        }
    }

    public function existColumn()
    {
        $result = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_option_value LIKE 'image'");
        return $result->num_rows ? true : false;
    }

    public function removeColumn()
    {
        $this->db->query("ALTER TABLE " . DB_PREFIX . "product_option_value DROP COLUMN image");
    }

    public function addColumn()
    {
        $this->db->query("ALTER TABLE " . DB_PREFIX . "product_option_value ADD COLUMN image VARCHAR (255) NOT NULL DEFAULT ''");
    }
}

?>