<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Sitio web</h1>
    <h2>IP del servidor: <?php echo $_SERVER['SERVER_ADDR'] ?></h2>
    <?php
        $servidor = "10.0.1.200";
        $usuario = "apache";
        $contra = "abc123.";

        // Crear conexión
        $conn = mysqli_connect($servidor, $usuario, $contra);

        // Verificar la conexión
        if (!$conn) {
            die();
        } 

        // Obtener el nombre del host del servidor MariaDB
        $query = "SELECT @@hostname AS nombre_servidor";
        $result = mysqli_query($conn, $query);

        if ($result) {
            $row = mysqli_fetch_assoc($result);
            $nombreServidor = $row['nombre_servidor'];
        }
        // Cerrar la conexión
        mysqli_close($conn);
    ?>
    <h2>Servidor base de datos: <?php echo $nombreServidor ?></h2>

</body>
</html>