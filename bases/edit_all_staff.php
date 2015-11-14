<?php 
require_once 'pointdb.php';
	$id_staff= $_POST['edit_staff_btn'];

	$first_name=$_POST['first_name'];
	$last_name=$_POST['last_name'];
	$second_name=$_POST['second_name'];
	$id_comp=$_POST['id_comp'];
	$begin_date=$_POST['begin_date'];
	$end_date=$_POST['end_date'];
	$status=$_POST['status'];
	$query="UPDATE staff SET first_name='".$first_name."', last_name='".$last_name."', second_name='".$second_name."', id_comp=".$id_comp.", begin_date='".$begin_date."', end_date='".$end_date."', status='".$status."' WHERE id_staff=".$id_staff;
	$res=mysql_query($query);
	echo "Редактирование выполнено успешно!";
	echo "<a href='../area.php'><button>OK</button></a>";
?>