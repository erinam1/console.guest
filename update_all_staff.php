<?php 
$host="localhost";
$database="controlsocket";
$user="disp";
$pswd="1234";
$dbh=mysql_connect($host, $user, $pswd) or die("I can't connect to MySql :(");
mysql_select_db($database) or die("I can't connect to database :(");
	$first_name=$_POST['first_name'];
	$last_name=$_POST['last_name'];
	$second_name=$_POST['second_name'];
	$id_comp=$_POST['id_comp'];
	$begin_date=$_POST['begin_date'];
	$end_date=$_POST['end_date'];
	$status=$_POST['status'];
	$query="INSERT INTO staff(first_name,last_name,second_name,id_comp,begin_date,end_date,status) VALUES ('".$first_name."', '".$last_name."', '".$second_name."',".$id_comp.",'".$begin_date."', '".$end_date."', '".$status."');";
	/*$query="INSERT INTO staff(first_name,second_name,id_comp) VALUES ('".$first_name."', '".$second_name."', ".$id_comp.")";*/
	if(!mysql_query($query)) echo "error";
	else echo "OK";
?>
Данные добавлены
<?php
echo $first_name;
echo " ";
echo $last_name;
echo " ";
echo $second_name;
echo " ";
echo $id_comp;
echo " ";
echo $begin_date;
echo " ";
echo $end_date;
echo " ";
echo $status;
echo $query;
echo $res;
?>