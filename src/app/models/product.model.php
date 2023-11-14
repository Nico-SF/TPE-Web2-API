<?php
    require_once './src/app/models/model.php';

    class ProductModel  extends Model {
        //Constructor
        function __construct() {
            parent::__construct();
        }

        //Metodos
        function getProducts() {
            // Valores por defecto
            $sort = 'producto_id';
            $order = 'ASC';
            $page = 1;
            $size = 10;

            // Filtrar por un campo con un valor
            if(isset($_GET['filter']) && isset($_GET['value'])) {
                $filter = strtolower($_GET['filter']);
                $allowedFilterColumns = ['categoria_id', 'oferta']; // No agregamos los demás campos de la tabla porque no tiene sentido filtrar por ellos
                $filter = in_array($filter, $allowedFilterColumns) ? $filter : '';
                $value = strtolower($_GET['value']); 
            }

            // Ordenar por un campo de forma ascendente o descendente
            if(isset($_GET['sort'])) {
                $sort = strtolower($_GET['sort']);
                $allowedSortColumns = ['producto_nombre', 'categoria_id','precio', 'oferta']; // No agregamos los demás campos de la tabla porque no tiene sentido ordenar por ellos
                $sort = in_array($sort, $allowedSortColumns) ? $sort : 'producto_id';
            }
            if(isset($_GET['order'])) {
                $order = strtoupper($_GET['order']);
                $allowedOrderValues = ['ASC', 'DESC'];
                $order = in_array($order, $allowedOrderValues) ? $order : 'ASC';
            }

            // Determinar el numero y el tamaño de página
            if(isset($_GET['page'])) {
                $page = $_GET['page'];
            }
            if(isset($_GET['size'])) {
                $size = $_GET['size'];
            }
            $start = ($page - 1) * $size;
            
            // Armar la query, con o sin WHERE, pero siempre con ORDER BY
            $where = empty($filter) ? '' : 'WHERE ' . $filter . ' = :where ';
            $query = $this->db->prepare('SELECT * FROM productos ' . $where . 'ORDER BY ' . $sort . ' ' . $order . ' LIMIT :limit, :offset');
            
            // Ejecutar la consulta pasando los valores directamente
            if (!empty($where)) {
                $query->bindParam(':where', $value, PDO::PARAM_STR);
            }
            $query->bindParam(':limit', $start, PDO::PARAM_INT);
            $query->bindParam(':offset', $size, PDO::PARAM_INT);
            $query->execute();

            $products = $query->fetchAll(PDO::FETCH_OBJ);
            return $products;
        }

        function getProduct($id) {
            $query = $this->db->prepare('SELECT * FROM productos WHERE producto_id = ?');
            $query->execute([$id]);
            $product = $query->fetch(PDO::FETCH_OBJ);
            return $product;
        }

        function insertProduct($nombre, $description, $precio) {
            $query = $this->db->prepare('INSERT INTO productos (producto_nombre, descripcion, precio) VALUES(?,?,?)');
            $query->execute([$nombre, $description, $precio]);
            return $this->db->lastInsertId();
        }

        function updateProduct($id, $nombre, $descripcion, $precio) {
            $query = $this->db->prepare('UPDATE productos SET producto_nombre = ?, descripcion = ?, precio = ? WHERE producto_id = ?');
            $query->execute([$nombre, $descripcion, $precio, $id]);
        }
    }
?>