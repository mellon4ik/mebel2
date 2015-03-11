<?php

class ControllerModuleCallback extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('common/header');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $name = $this->request->post['name'];
            $phone = $this->request->post['telephone'];

            $HTTP_HOST = parse_url ("http://".$_SERVER["HTTP_HOST"]);
            $HTTP_HOST = str_replace (array ("http://","www."), "", $HTTP_HOST["host"]);
            $from = "noreply@".$HTTP_HOST;

            $subject = sprintf($this->language->get('text_callback_email_subject'), $this->config->get('config_name'));

            $html = "<b>Имя: </b>$name<br /><b>Телефон: </b>$phone";
            $text = "Имя: $name\n\nТелефон: $phone";

            $mail = new Mail($this->config->get('config_mail'));
            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($from);
            $mail->setSender($this->config->get('config_name'));
            $mail->setSubject($subject);
            $mail->setHtml($html);
            $mail->setText($text);
            $mail->send();

            echo json_encode(array('status' => true));
        }
        else {
            echo json_encode(array('status' => false, 'msg' => $this->error));
        }
    }

    private function validate()
    {
        if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 32)) {
            $this->error['name'] = $this->language->get('callback_error_name');
        }

        if (utf8_strlen($this->request->post['telephone']) != 19) {
            $this->error['phone'] = $this->language->get('callback_error_phone');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}

?>
