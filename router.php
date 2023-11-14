<?php
    require_once 'config.php';
    require_once 'libs/router.php';
    require_once 'src/app/controllers/product.api.controller.php';

    $router = new Router();

    # Endpoint para obtener todos los productos (puede incluir el parámetro sort)
    $router->addRoute('productos','GET','ProductApiController','get'); 

    # Endpoint para crear un nuevo producto
    $router->addRoute('productos', 'POST', 'ProductApiController', 'create');

    # Endpoint para obtener un producto por ID
    $router->addRoute('productos/:ID', 'GET', 'ProductApiController', 'get'   );

    # Endpoint para actualizar un producto por ID
    $router->addRoute('productos/:ID', 'PUT', 'ProductApiController', 'update');
    

    # Rutas generales: Esta línea ejecutará la lógica de enrutamiento basada en la URL y el método de solicitud.
    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
?>