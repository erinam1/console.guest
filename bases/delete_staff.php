<?php 
require_once 'pointdb.php';
	$variabl= $_POST['del'];
	$query2="SELECT  concat(staff.second_name,' ',staff.first_name,' ',staff.last_name) AS full_name FROM staff WHERE  id_staff=$variabl;";
	$res2=mysql_query($query2);/*<<=Доделать*/
	$view= mysql_fetch_array($res2);
	$query4="SELECT * FROM staff_card WHERE id_staff=$variabl";
	$res4=mysql_query($query4);
	$del_staff=true;
	while ($row4 = mysql_fetch_array($res4)) {
		$card=$row4['number'];
		$query3="SELECT * ,count(id_trans) as trans_act FROM transaction where card='12365478'";
		$res3=mysql_query($query3);
		$row3 = mysql_fetch_array($res3);
		if ($row3['trans_act']!=false){ 
			$del_staff=false;
		}
		
	}

	if ($del_staff==true){
	$query="DELETE FROM staff WHERE  id_staff=$variabl";
	$res=mysql_query($query);
	echo "Удаление пользователя ".$view['full_name']." выполнено успешно";
		}
		else {
			echo "Удаление пользователя ".$view['full_name']." невозможно, так как с ним связано ".$row3['trans_act']." записей.";
		}
	
?>