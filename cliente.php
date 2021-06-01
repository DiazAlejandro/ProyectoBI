<?php
    $conexion = mysqli_connect('localhost','root','1234','control_obras') 
                or die('Error en la conexión servidor');
    $sql_insertarCliente = "INSERT INTO cliente VALUES ('".$_POST["rfc"]."',
                                                        '".$_POST["nombre"]."',
                                                        '".$_POST["direccion"]."',
                                                        '".$_POST["telefono"]."',
                                                        '".$_POST["correo_e"]."',
                                                        '".$_POST["fecha_registro"]."')";
    $resultado = mysqli_query($conexion, $sql_insertarCliente) 
                or die ('Error en la instrucción');
    mysqli_close($conexion);
?>