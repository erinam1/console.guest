<?php 
require_once 'pointdb.php';
	$query="SELECT * FROM `staff_card`";
	$res=mysql_query($query);
	echo"<table border='1'>";
	while($row = mysql_fetch_array($res))
{
	echo "<tr><td>";
	echo $row['id_card'];
	echo "</td><td>";
	echo $row ['number'];
	echo "</td><td>";
	echo $row['id_staff'];
	echo "</td><td>";
	echo $row['date_create'];
	echo "</td><td>";
	echo $row['date_begin'];
	echo "</td><td>";
	echo $row['date_end'];
	echo "</td><td>";
	
	echo $row['note'];
	echo "</td>";
}
echo "</tr></table>";
?>