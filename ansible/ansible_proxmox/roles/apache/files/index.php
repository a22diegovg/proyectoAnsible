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
        $servername = "10.0.1.200";
        $username = "apache";
        $password = "abc123.";
        $database = "prueba";

        // Crear conexión
        //$conn = mysqli_connect($servername, $username, $password, $database);
        $conn = mysqli_connect($servername, $username, $password);

        // Verificar la conexión
        if (!$conn) {
            echo "Fallo en la conexion";
            die("Conexión fallida: " . mysqli_connect_error());
        } 

        // Obtener el nombre del host del servidor MariaDB
        $query = "SELECT @@hostname AS server_hostname";
        $result = mysqli_query($conn, $query);

        if ($result) {
            $row = mysqli_fetch_assoc($result);
            $server_hostname = $row['server_hostname'];
        } else {
            $server_hostname = "No se pudo obtener el nombre del host del servidor.";
        }

        // Cerrar la conexión
        mysqli_close($conn);
    ?>
    <h2>Servidor base de datos: <?php echo $server_hostname ?></h2>

</body>
</html>