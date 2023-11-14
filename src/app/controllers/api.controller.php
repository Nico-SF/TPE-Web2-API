<?php
    require_once './src/app/views/api.view.php';

    abstract class ApiController {
        //Atributos
        protected $view;
        private $data;

        //Constructor
        function __construct() {
            $this->view = new ApiView();
            $this->data = file_get_contents('php://input');
        }

        function getData() {
            return json_decode($this->data);
        }
    }
?>