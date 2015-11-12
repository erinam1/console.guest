<?php

$host="localhost";
$database="controlsocket";
$user="disp";
$pswd="1234";

$dbh=mysql_connect($host, $user, $pswd) or die("I can't connect to MySql :(");
mysql_select_db($database) or die("I can't connect to database :(");

if (isset($_COOKIE['id'])and isset($_COOKIE['hash']))
		{
			$query = mysql_query("SELECT *,INET_NTOA(user_ip) FROM users WHERE user_id = '".intval($_COOKIE['id'])."' LIMIT 1");
			$userdata = mysql_fetch_assoc($query);

			if(($userdata['user_hash'] !== $_COOKIE['hash']) or ($userdata['user_id'] !== $_COOKIE['id']) or (($userdata['user_ip'] !== $_SERVER['REMOTE_ADDR']) and ($userdata['user_ip'] !== "0")))
		 		{
		 			setcookie("id", "", time() - 3600*24*30*12, "/");
		 			setcookie("hash", "", time() - 3600*24*30*12, "/");

		 			print "Что-то не получилось";
		 			unset($userdata);
		 			session_destroy();
		 		}
		 		else
		 		{
		 			print "Привет, " .$userdata['user_login']. ". Начнем работу";

		 		}
			}
		 else
		 {
		 	print "Включите cookie";

		 }

?>
