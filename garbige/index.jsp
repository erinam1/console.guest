<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 04.10.2015, 13:40:42
    Author     : tomnuk
--%>
<sql:query var="tables_menu" dataSource="jdbc/cntsocket">
    SHOW TABLES
</sql:query>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="ico.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="titan.css" media="all">
        <title>Консоль использования разъемов электрооборудования</title>
        <script type="text/javascript" src="jqu.js"></script>
        <script>$("file").click(function(){$("div[type='file'").trigger('click');]});</script>
    </head>
    <body>
        <div class="top">
            <table border="0"  width="100%" >
            <tr>
            <td width="15%"><div class="punkt"><a href="#" ><img src="rep.png" width="30" height="30" alt="rep"/>Отчеты</a></div></td>
            <td width="15%">
              
                    <div type="file" name="file" class="punkt"><a href="update.jsp" target="frame"><img src="download.png" width="30" height="30" alt="download"/>Получить данные</a></div></td>
              
                <td width="15%"><div class="punkt" ><a href="companyes.jsp" target="frame_menu"><img src="users.png" width="30" height="30" alt="users"/>Пользователи</a></div></td>
            <td width="15%"><div class="punkt"><a href="dispenser.jsp" target="frame"><img src="sht.png" width="30" height="30" alt="sht"/>Оборудование</a></div></td>
            <td width="15%"><div class="punkt"><a href="http://#"><img src="mag.png" width="30" height="30" alt="mag"/>Журнал</a></div></td>
            <td width="25%"><img src="log.png" width="200" height="100" alt="log" align="right"/></td>
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
                <th width="80%">Таблица</th>
             </tr>
           </thead>
         <tbody>
          <tr>
            <td width="20%">
                <div class="menu_area"><iframe name="frame_menu" src="companyes.jsp" width="100%" height="400px" align="left" border="0">
                    Ваш браузер не поддерживает плавающие фреймы!
                </iframe></div>
            </td>
            <td valign="top" width="80%">
                <div class="area"><iframe name="frame" src="response.jsp" width="100%" height="400px" align="left" border="0">
                    Ваш браузер не поддерживает плавающие фреймы!
                </iframe></div>
            </td>
            </tr>
            <tr>
            <td>
                <input type="submit" value="+" name="add" onclick=""/>
                <input type="submit" value="x" name="dell" />
                <input type="submit" value="/" name="edit" />
            </td>
            <td>
                <input type="submit" value="+" name="add_area" />
                <input type="submit" value="x" name="dell_area" />
                <input type="submit" value="/" name="edit_area" />
                <input type="submit" value="exel" name="exel" />
                <input type="submit" value="[__]" name="print" />
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
