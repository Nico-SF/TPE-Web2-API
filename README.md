
# API de Productos - TiendaGamer

  

Esta API proporciona operaciones (Crear, Leer, Actualizar) para gestionar productos.

  

## Introducción

  

La API utiliza el campo "status" en las respuestas para indicar el estado de la operacion. Este campo puede tener uno de los dos valores: "success" o "error".

  

#### Ejemplo de Respuesta de Error

```json

{

"status": "error",

"message": "Mensaje del error"

}

```

  

## Endpoints

  

### 1. Obtener todos los productos (admite ordenar por campo de forma ascendente o descendente)

  

-  **Método**: `GET`

-  **URL**: `localhost/tiendagamer/api/productos`

-  **Descripción**: Obtiene la lista de todos los productos disponibles, permitiendo filtrar por un campo (categoría u oferta), ordenar ascendente o descendentemente por un campo (nombre, categoria, precio u oferta) y paginar.

-  **Parámetros:**

-  `{filter}` (query parameter): posibles valores = ['categoria_id', 'oferta'].
-  `{value}` (query parameter): string a matchear.
- 
-  `{sort}` (query parameter): posibles valores = ['producto_nombre', 'categoria_id','precio', 'oferta'].
-  `{order}` (query parameter): posibles valores = ['ASC', 'DESC'].
- 
-  `{page}` (query parameter): número de página.
-  `{size}` (query parameter): cantidad de productos por página.

-  **Ejemplo de uso**:

```bash

curl -X GET http://BASE_URL/api/productos

```

-  **Ejemplo de respuesta**:

```json

{

"status": "success",

"data": [

{

"producto_id": 1,

"categoria_id": 2,

"producto_nombre": "Producto A",

"descripcion": "Descripcion del producto A",

"precio": "9999",

"imagen_url": "https://..."

},

{

"producto_id": 7,

"categoria_id": 3,

"producto_nombre": "Producto B",

"descripcion": "Descripcion del producto B",

"precio": "9999",

"imagen_url": "https://..."

}

]

}

```

  

### 2. Crear un nuevo producto

  

-  **Método**: `POST`

-  **URL**: `localhost/tiendagamer/api/productos`

-  **Descripción**: Crea un nuevo producto con la informacion proporcionada en el cuerpo de la solicitud, luego de validar el usuario por token.

- **Header**: 

token -> eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvX2lkIjoiMiIsInVzdWFyaW9fbm9tYnJlIjoid2ViYWRtaW4ifQ.ZzeMb5EAien5rPSQ6f5cJz-RvB27md1E7ZnDIMMjRow

-  **Ejemplo de uso**:

```bash

curl -X POST -H "Content-Type: application/json" -d '{"producto_nombre": "Nuevo Producto", "descripcion": "Descripcion del producto", "precio": 20.99}' http://BASE_URL/api/productos

```

-  **Ejemplo de respuesta**:

```json

{

"status": "success",

"message": "El producto fue insertado con el id=20"

}

```

  
  

### 3. Obtener un producto por ID

  

-  **Método**: `GET`

-  **URL**: `localhost/tiendagamer/api/productos/:ID`

-  **Descripción**: Obtiene detalles sobre un producto especifico utilizando su identificador unico.

-  **Ejemplo de uso**:

```bash

curl -X GET http://BASE_URL/api/productos/123

```

-  **Ejemplo de respuesta**:

```json

{

"status": "success",

"data": [

{

"producto_id": 1,

"categoria_id": 2,

"producto_nombre": "Producto A",

"descripcion": "Descripcion del producto A",

"precio": "9999",

"imagen_url": "https://..."

},

]

}

```

  

### 4. Actualizar un producto por ID

  

-  **Método**: `PUT`

-  **URL**: `localhost/tiendagamer/api/productos:ID`

-  **Descripción**: Actualiza la informacion de un producto específico identificado por su ID,  luego de validar el usuario por token. 

- **Header**: 

token -> eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvX2lkIjoiMiIsInVzdWFyaW9fbm9tYnJlIjoid2ViYWRtaW4ifQ.ZzeMb5EAien5rPSQ6f5cJz-RvB27md1E7ZnDIMMjRow


-  **Ejemplo de uso**:

```bash

curl -X PUT -H "Content-Type: application/json" -d '{"producto_nombre": "Producto Modificado", "precio": 25.99}' http://BASE_URL/api/productos/123

```

-  **Ejemplo de respuesta**:

```json

{

"status": "success",

"message": "El producto con id=1 ha sido modificado."

}

```