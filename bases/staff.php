<?php 

	require_once 'pointdb.php';
	$query="SELECT id_staff, concat(staff.second_name,' ',staff.first_name,' ',staff.last_name) AS full_name,company.short_name,staff.begin_date,staff.end_date,staff.status 
	FROM company,staff WHERE company.id_comp=staff.id_comp ORDER BY full_name;";
	$res=mysql_query($query);
	echo"<table border='0' width='100%' height='100%' style='background:#5FBDCE;' >";
	echo"<tr style='background:#04859D;'><td align='center'><b> Ф.И.О</b></td><td align='center'><b> Предприятие</b></td><td align='center'><b> Дата начала полномочий</b></td>
	 <td align='center'><b> Окончание полномочий</b></td><td align='center'><b> Текущий статус</b></td><td align='center' colspan='2' style='
vertical-align:top;'><b> Действия</b></td></tr>";
	while($row = mysql_fetch_array($res))
{
	echo "<tr><td align='left'>";
	echo $row['full_name'];
	echo "</td><td align='left'>";
	echo $row['short_name'];
	echo "</td><td align='center'>";
	echo $row['begin_date'];
	echo "</td><td align='center'>";
	echo $row['end_date'];
	echo "</td><td align='center'>";
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

