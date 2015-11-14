<?php 
require_once 'pointdb.php';
	$variabl= $_POST['edit'];
	$query="SELECT * FROM staff WHERE id_staff=$variabl;";
	$res=mysql_query($query);
	$query2="SELECT `short_name`,`id_comp` FROM company ORDER BY short_name";
	$res2=mysql_query($query2);
	$row = mysql_fetch_array($res);
	$example='';
	 while($row2 = mysql_fetch_array($res2))
                		$example=$example."<option value='".$row2['id_comp']. "' />" . $row2['short_name']. "</option>";
	$form = ' <!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../style/titan.css" media="all">
    </head>
    <body><tr><td>
<a id="add_staff_but" href="#add_staff"><img src="image/add.png" width="30px" height="30px"></a>
                <a id="add_staff" class="overlay" href="#x"></a>
                <div class="popup">
                	<form method="POST" action="edit_all_staff.php" target="frame">
                	<table>
                		<tr>
                			<td colspan="3"><h4>Редактирование данных пользователя</h4></td>

                		</tr>
                		<tr>
                			<td>Фамилия</td>
                			<td>Имя</td>
                			<td>Отчество</td>
                		</tr>
                		<tr>
                			<td><input class="second_name" type="text" name="second_name" value="'.$row['second_name'].'" size="30" /></td>
                			<td><input class="first_name" type="text" name="first_name" value="'.$row['first_name'].'" size="30" /></td>
                			<td><input class="last_name" type="text" name="last_name" value="'.$row['last_name'].'" size="30" /></td>
                		</tr>
                			<tr>
                			<td>Компания</td>
                			<td>Дата начала</td>
                			<td>Дата окончания</td>
                		</tr>
                		<tr>
                			<td><select name="id_comp">
                			'.$example.'</select></td>
                			<td><input class="begin_date" type="text" name="begin_date" value="'.$row['begin_date'].'" size="30" /></td>
                			<td><input class="end_date" type="text" name="end_date" value="'.$row['end_date'].'" size="30" /></td>
                		
                		</tr>
                		<tr>
                			<td>Статус</td>
                			<tr>
                			<td><input class="status" type="text" name="status" value="'.$row['status'].'" size="30" /></td>
                		</tr>
						<tr>
                            <td colspan="2" align="right"><button type="reset" name="cancel"><a href="staff.php">Отменить</a></button></td>
                			<td colspan="1" align="right"><button type="sumbit" name="edit_staff_btn" value="'.$variabl.'">Изменить</button></td>
                		</tr>
                	</table>
                </form>
                </div>';

         echo $form;

	?>