<?php 
require_once 'pointdb.php';
	$variabl= $_POST['comp'];
	$query="SELECT * FROM staff, company WHERE  staff.id_comp=company.id_comp AND company.short_name='$variabl'";
	$res=mysql_query($query);
	echo "<b>" . $variabl . "</b>";
	echo"<table border='0' width='100%' height='100%' style='background:#E8D289;' >";
	echo"<tr style='background:#DFBE51;'><td align='center'><b> ID Сотрудника</b></td><td align='center'><b> Фамилия</b></td><td align='center'> <b>Имя</b></td><td align='center'>
	 <b>Отчество</b></td><td align='center'><b> Дата начала полномочий</b></td>
	 <td align='center'><b> Окончание полномочий</b></td><td align='center'><b> Текущий статус</b></td></tr>";
	while($row = mysql_fetch_array($res))
{
	echo "<tr><td align='center'>";
	echo $row['id_staff'];
	echo "</td><td align='center'>";
	echo $row ['first_name'];
	echo "</td><td align='center'>";
	echo $row['last_name'];
	echo "</td><td align='center'>";
	echo $row['second_name'];
	echo "</td><td align='center'>";
	echo $row['begin_date'];
	echo "</td><td align='center'>";
	echo $row['end_date'];
	echo "</td><td align='center'>";
	echo $row['status'];
	echo "</td>";
}
echo "</tr></table>";
?>