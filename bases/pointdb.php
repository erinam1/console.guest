<?php
$host="localhost";
$database="controlsocket";
$user="disp";
$pswd="1234";

$dbh=mysql_connect($host, $user, $pswd) or die("I can't connect to MySql :(");
mysql_select_db($database) or die("I can't connect to database :(");
?>