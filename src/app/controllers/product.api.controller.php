<?php
    require_once 'api.controller.php';
    require_once './src/app/auth/auth.api.helper.php';
    require_once './src/app/models/product.model.php';

    class ProductApiController extends ApiController {
        //Atributos
        private $model;

        //Constructor
        function __construct() {
            parent::__construct();
            $this->model = new ProductModel();
        }

        //Metodos
        function get($params = []) {
            if(empty($params)) {
                $productos = $this->model->getProducts();
                $this->view->response($productos, 200);
            } else {
                $producto = $this->model->getProduct($params[':ID']);
                if(!empty($producto)) {
                    $this->view->response($producto, 200);
                } else {
                    $this->view->response('El producto con el id=' . $params[':ID'] . ' no existe.', 404);
                }
            }
        }

        // Token usado: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvX2lkIjoiMiIsInVzdWFyaW9fbm9tYnJlIjoid2ViYWRtaW4ifQ.ZzeMb5EAien5rPSQ6f5cJz-RvB27md1E7ZnDIMMjRow
        function create($params = []) {
            $body = $this->getData();
            $nombre = $body->producto_nombre;
            $descripcion = $body->descripcion;
            $precio = $body->precio;
            $token = '';
        
            if(isset($_SERVER['HTTP_TOKEN'])) {
                $token = $_SERVER['HTTP_TOKEN'];
                $usuarioId = AuthApiHelper::verificarToken($token);
        
                if ($usuarioId !== false) {
                    // Como la firma es válida, se inserta el producto (201)
                    $id = $this->model->insertProduct($nombre, $descripcion, $precio);
                    $this->view->response('El producto fue insertado con el id=' . $id, 201);
                } else {
                    // Firma inválida. 
                    $this->view->response('Token no válido!.', 403);
                }
            } else {
                // No hay header 'Token'
                $this->view->response('Se requiere un header con el Token', 401);
            }
        }

        // Token usado: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvX2lkIjoiMiIsInVzdWFyaW9fbm9tYnJlIjoid2ViYWRtaW4ifQ.ZzeMb5EAien5rPSQ6f5cJz-RvB27md1E7ZnDIMMjRow
        function update($params = []) {
            $id = $params[':ID'];
            $producto = $this->model->getProduct($id);
            
            if (isset($_SERVER['HTTP_TOKEN'])) {
                $token = $_SERVER['HTTP_TOKEN'];
                $usuarioId = AuthApiHelper::verificarToken($token);
        
                if ($usuarioId !== false) {
                    // Como la firma es válida, se modifica el producto (200)
                    $id = $params[':ID'];
                    $producto = $this->model->getProduct($id);
        
                    if ($producto) {
                        $body = $this->getData();
                        $nombre = $body->producto_nombre;
                        $descripcion = $body->descripcion;
                        $precio = $body->precio;
        
                        $this->model->updateProduct($id, $nombre, $descripcion, $precio);
                        $this->view->response('El producto con id=' . $id . ' ha sido modificado.', 200);
                    } else {
                        $this->view->response('El producto con id=' . $id . ' no existe.', 404);
                    }
                } else {
                    // Token inválido.
                    $this->view->response('Token no válido!.', 403);
                }
            } else {
                // No hay header 'Token'
                $this->view->response('Se requiere un header con el Token', 401);
            }
        }
    }
?>