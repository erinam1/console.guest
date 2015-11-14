<?php 
require_once 'pointdb.php';
	$variabl= $_POST['comp'];
	$query="SELECT * FROM staff, company WHERE  staff.id_comp=company.id_comp AND company.short_name='$variabl'";
	$res=mysql_query($query);
	echo "<b>" . $variabl . "</b>";
	echo"<table border='0' width='100%' height='100%' style='background:#5FBDCE;vertical-align:top;'  >";
	echo"<tr style='background:#04859D; height:20px;'><td align='center' style='
vertical-align:top;'><b> ID Сотрудника</b></td><td align='center' style='
vertical-align:top;'><b> Фамилия</b></td><td align='center' style='
vertical-align:top;'> <b>Имя</b></td><td align='center' style='
vertical-align:top;'>
	 <b>Отчество</b></td><td align='center' style='
vertical-align:top;'><b> Дата начала полномочий</b></td>
	 <td align='center' style='
vertical-align:top;'><b> Окончание полномочий</b></td><td align='center' style='
vertical-align:top;'><b> Текущий статус</b></td><td align='center' colspan='2' style='
vertical-align:top;'><b> Действия</b></td></tr>";
	while($row = mysql_fetch_array($res))
{
	echo "<tr><td align='center' style='
vertical-align:top;'>";
	echo $row['id_staff'];
	echo "</td><td align='center' style='
vertical-align:top;'>";
	echo $row ['first_name'];
	echo "</td><td align='center' style='
vertical-align:top;'>";
	echo $row['last_name'];
	echo "</td><td align='center' style='
vertical-align:top;'>";
	echo $row['second_name'];
	echo "</td><td align='center' style='
vertical-align:top;'>";
	echo $row['begin_date'];
	echo "</td><td align='center' style='
vertical-align:top;'>";
	echo $row['end_date'];
	echo "</td><td align='center' style='
vertical-align:top;'>";
	echo $row['status'];
	echo "</td>";
	echo "<td align='center' >";
	echo "<form method='POST' action='edit_staff.php' target='frame'><button name='edit' value='".$row['id_staff']."' type='sumbit'><img src='../image/edit.png' width='20px' height='20px'></button></form>";
	echo "</td>";
	echo "<td align='center' >";
	echo "<form method='POST' action='delete_staff.php' target='frame'><button name='del' value='".$row['id_staff']."' type='sumbit'><img src='../image/Delete.png' width='20px' height='20px'></button></form>";
	echo "</td>";
}
echo "</tr></table>";
?>