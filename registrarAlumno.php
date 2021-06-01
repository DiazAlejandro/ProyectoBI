<?php
    $conexion = mysqli_connect('localhost','root','1234','alumnos') or die('Error en la conexión servidor');
    $sql_insertarAlumno = "INSERT INTO alumnos values ('".$_POST["nombre"]."',
                                                       '".$_POST["edad"]."')";
    $resultado = mysqli_query($conexion,$sql_insertarAlumno) or die ('Error en la instrucción');
    mysqli_close($conexion)
?>