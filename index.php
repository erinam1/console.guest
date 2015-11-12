  <!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="image/ico.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/titan.css" media="all">
        <title>Консоль использования разъемов электрооборудования</title>
        <script type="text/javascript" src="plugins/jqu.js"></script>
        <script>$("file").click(function(){$("div[type='file'").trigger('click');]});</script>
    </head>
    <body>
        <div class="top">
            <table border="0"  width="100%" >
            <tr>
            <td width="15%"><div class="punkt"><a href="#" ><img src="image/rep.png" width="30" height="30" alt="rep"/>Отчеты</a></div></td>
            <td width="15%">
              
                    <div type="file" name="file" class="punkt"><a href="update_page.php" target="arena"><img src="image/download.png" width="30" height="30" alt="download"/>Получить данные</a></div></td>
              
                <td width="15%"><div class="punkt" ><a href="uploading.php" target="arena"><img src="image/users.png" width="30" height="30" alt="users"/>Пользователи</a></div></td>
            <td width="15%"><div class="punkt"><a href="bases/dispenser.php" target="arena"><img src="image/sht.png" width="30" height="30" alt="sht"/>Оборудование</a></div></td>
            <td width="15%"><div class="punkt"><a href="http://#"><img src="image/mag.png" width="30" height="30" alt="mag"/>Журнал</a></div></td>
            <td width="25%"><img src="image/log.png" width="200" height="100" alt="log" align="right"/></td>
            </tr>    
            </table>
        </div>
        <div class="search">
            <input class="searchline" type="text" name="search" value="Поиск" size="30" />
            <input type="submit" value="Поиск" name="searchbtn" class="searchbtn" />
        </div>
    <div class="workingarea">
        <table border="0" width="100%">
           <thead>
             <tr>
                <th width="20%">Вывод</th>
                
             </tr>
           </thead>
         <tbody>
          <tr>
            <td width="100%" colspan="2">
                <iframe name="arena" src="login.php" width="100%" height="500px" align="left" border="0">
                    Ваш браузер не поддерживает плавающие фреймы!
                </iframe>
            </td>
            </tr>
                </tbody>
            </table>
        </div>
        <div class="footer"><table border="0" width="100%" height="100%">
            <tbody>
                <tr>
                  <td valign="bottom">
                      <div class="tech"><p>(c)"ЭнергоМет"-Сус"</p></div>
                  </td>
                  <td></td>
                  <td>
                      <div class="tech"><p>Техническая поддержка:emsys@open.com</p></div>
                  </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
