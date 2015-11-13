  <?php 

require_once 'pointdb.php';
	$query="SELECT `short_name`,`id_comp` FROM company ORDER BY short_name";
	$res=mysql_query($query);

  ?>
  <!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/titan.css" media="all">
    </head>
    <body>
    	<table width="100%">
    		<tr>
    			<td>
<iframe src="bases/staff.php" width="100%" height="350px" align="left" frameborder="0"></iframe>
</td></tr>
<tr>
	<td>
<a id="add_staff_but" href="#add_staff"><img src="image/add.png" width="30px" height="30px"></a>
                <a id="add_staff" class="overlay" href="#x"></a>
                <div class="popup">
                	<form method='POST' action='update_all_staff.php' target='frame'>
                	<table>
                		<tr>
                			<td colspan="3"><h4>Добавление нового пользователя</h4></td>

                		</tr>
                		<tr>
                			<td>Фамилия</td>
                			<td>Имя</td>
                			<td>Отчество</td>
                		</tr>
                		<tr>
                			<td><input class="second_name" type="text" name="second_name" value="" size="30" /></td>
                			<td><input class="first_name" type="text" name="first_name" value="" size="30" /></td>
                			<td><input class="last_name" type="text" name="last_name" value="" size="30" /></td>
                		</tr>
                			<tr>
                			<td>Компания</td>
                			<td>Дата начала</td>
                			<td>Дата окончания</td>
                		</tr>
                		<tr>
                			<td><select name="id_comp"><?php while($row = mysql_fetch_array($res))
                			 echo "<option value='".$row['id_comp']. "' />" . $row['short_name']. "</option>"?>
                			</select></td>
                			<td><input class="begin_date" type="text" name="begin_date" value="" size="30" /></td>
                			<td><input class="end_date" type="text" name="end_date" value="" size="30" /></td>
                		
                		</tr>
                		<tr>
                			<td>Статус</td>
                			<tr>
                			<td><input class="status" type="text" name="status" value="" size="30" /></td>
                		</tr>
						<tr>
                            <td colspan="2" align="right"><button type="reset" name="cancel"><a href="#x">Отменить</a></button></td>
                			<td colspan="1" align="right"><button type="sumbit" name="add_staff_btn">Добавить</button></td>
                		</tr>
                	</table>
                </form>
                </div>
             <form method='POST' action='excel_staff.php' target='frame'>
                <button name="excel_staff" type="sumbit">
                <img src="image/excel.png" width="30px" height="30px">
                </button>
</form>
                 <img src="image/print.png" width="30px" height="30px">
</td></tr></table>