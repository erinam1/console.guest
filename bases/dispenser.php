<?php 
$host="localhost";
$database="controlsocket";
$user="disp";
$pswd="1234";

$dbh=mysql_connect($host, $user, $pswd) or die("I can't connect to MySql :(");
mysql_select_db($database) or die("I can't connect to database :(");
	$query="SELECT * FROM `dispenser`";
	$res=mysql_query($query);
	echo"<table border='0' width='100%' height='100%' style='background:#E8D289;' >";
	echo"<tr style='background:#DFBE51;'><td align='center'><b> ID Оборудования</b></td><td align='center'><b> Наименование</b></td><td align='center'> <b>Тип Оборудования</b></td><td align='center'> <b>Количество</b></td><td align='center'><b> Примечание</b></td></tr>";
	while($row = mysql_fetch_array($res))
{
	echo "<tr><td align='center'>";
	echo $row['id_disp'];
	echo "</td><td align='center'>";
	echo $row ['name'];
	echo "</td><td align='center'>";
	echo $row['id_type'];
	echo "</td><td align='center'>";
	echo $row['count_eq'];
	echo "</td><td align='center'>";
	echo $row['note'];
	echo "</td>";
}
echo "</tr></table>";
?>