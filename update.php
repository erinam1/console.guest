<?php

$uploaddir='updates/';
$type='.thuui';
$uploadfile=$uploaddir . basename($_FILES['userfile']['name']);

if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile))
{
    echo "Обновления успешно загружены";
} 
else 
{
    echo "При обновлении файлов произошла ошибка. Проверьте правильность расширения файла";
}

?>


