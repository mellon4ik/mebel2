<?php

class ModelSalenewssubscribers extends Model
{
    private function check_db()
    {

        $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "subscribe (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `option1` varchar(225) NOT NULL,
  `option2` varchar(225) NOT NULL,
  `option3` varchar(225) NOT NULL,
  `option4` varchar(225) NOT NULL,
  `option5` varchar(225) NOT NULL,
  `option6` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;");

    }

    public function addEmail($data)
    {
        $this->db->query("INSERT INTO " . DB_PREFIX . "subscribe SET email='" . $data['email'] . "',name='" . $data['name'] . "'");
    }

    public function editEmail($id, $data)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "subscribe SET email='" . $data['email'] . "',name='" . $data['name'] . "' WHERE id = '" . (int)$id . "'");
    }

    public function deleteEmail($id)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . "subscribe WHERE id = '" . (int)$id . "'");
    }

    public function getEmail($id)
    {
        $query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "subscribe WHERE id = '" . (int)$id . "'");

        return $query->row;
    }

    public function getEmails($start, $limit)
    {


        $sql = "SELECT * FROM " . DB_PREFIX . "subscribe LIMIT $start,$limit";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function exportEmails()
    {

        $this->check_db();

        $sql = "SELECT name,email FROM " . DB_PREFIX . "subscribe";

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalEmails()
    {

        $this->check_db();

        $sql = "SELECT * FROM " . DB_PREFIX . "subscribe";

        $query = $this->db->query($sql);

        return $query->num_rows;
    }

    public function checkmail($data, $id = FALSE)
    {

        if ($id)
            $sql = "SELECT * FROM " . DB_PREFIX . "subscribe WHERE email='" . $data . "' AND id!='" . $id . "'";
        else
            $sql = "SELECT * FROM " . DB_PREFIX . "subscribe WHERE email='" . $data . "'";


        $query = $this->db->query($sql);

        return $query->num_rows;
    }


}

?>