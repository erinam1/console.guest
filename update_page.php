<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <p><b>Загрузка данных с flash-носителя</b></p>
        <p>Для загрузки новых данных подключите flash-носитель устройства</br>
            к компьютеру, нажмите на кнопку выбора файла, выберите файл базы</br>
            нажмите кнопку "Открыть", затем кнопку "Загрузить".
        <form name="upload" action="update.php" method="POST" enctype="multipart/form-data">
        <input type="file" name="userfile" value="" width="200" /> 
        <input type="submit" value="Загрузить" name="upload" />
        </form>
        
    </body>
</html>
