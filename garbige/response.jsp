<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : 05.10.2015, 2:29:49
    Author     : tomnuk
--%>
 <sql:query var="tables_menu" dataSource="jdbc/cntsocket">
            SHOW TABLES
 </sql:query>
            
<c:set var="tbles_from_menu" value="${show_tables_menu.rows[0]}"/>
               
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <sql:query var="votono" scope="session" dataSource="jdbc/cntsocket">
            SELECT * FROM staff
        </sql:query>
            
        <table border="0" width="100%" height="100%" style="background:#E8D289;">
            <!-- column headers -->
            <tr style="background:#DFBE51;">
                <c:forEach var="columnName" items="${votono.columnNames}">
                    <th  valign="top"><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${votono.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                      <td ><input type="checkbox" name="typy" value="ON" /> <c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
