<?php 
require_once 'pointdb.php';
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
	else echo "Данные добавлены";
?>

