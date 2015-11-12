<?php 
$host="localhost";
$database="controlsocket";
$user="disp";
$pswd="1234";

$dbh=mysql_connect($host, $user, $pswd) or die("I can't connect to MySql :(");
mysql_select_db($database) or die("I can't connect to database :(");
	$query="SELECT `short_name` FROM `company`";
	$res=mysql_query($query);
	echo"<table border='1'>";
	while($row = mysql_fetch_array($res))
{
	echo "<tr><td>";
	echo "<form method='POST' action='staff_action.php' target='frame'>";
	echo "<button type='sumbit' name='comp' ' value='" . $row['short_name']. "' />" . $row['short_name']. "</button></form>";
	echo "</td>";
}
echo "</tr></table>";
?>