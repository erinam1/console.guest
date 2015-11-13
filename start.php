<?php
function generationCode ($length=6) {
	$chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHI JKLMNOPRQSTUVWXYZ0123456789";
	$code = "";
	$clen = strlen($chars) - 1;
	while (strlen($code)<$length) {
		$code .= $chars[mt_rand(0,$clen)];
	}
	return $code;
}
	require_once 'pointdb.php';
	if(isset($_POST['sumbit'])){
		$query = mysql_query("SELECT user_id, user_password FROM users WHERE user_login='".mysql_real_escape_string($_POST['login'])."' LIMIT 1");
			$data = mysql_fetch_assoc($query);
			if ($data['user_password'] === $_POST['password']){
				$hash = md5(generationCode(10));

				if (!@$_POST['not_attach_ip'])
				{
					$insip =", user_ip=INET_ATON('".$_SERVER['REMOTE_ADDR']."')";
				}
				mysql_query("UPDATE users SET user_hash='".$hash."' ".$insip." WHERE user_id='".$data['user_id']."'");
				setcookie("id", $data['user_id'], time()+60*60*24*30);
				setcookie("hash", $hash , time()+60*60*24*30);
			header("Location: check.php"); exit();
			}
			else{
				print "Вы ввели неправильный логин/пароль";
			}
	}
	?>
<style type="text/css">

	#line{
		width:150px;
		height: 20px;
		border-radius: 5px;
	}
	p{
		color:#644ad8;
		font-weight: bold;
		font-family: Arial, Helvetica, Verdana;
		font-size: 10pt;

	}
	form {
		font-family: Arial, Helvetica, Verdana;
		font-size: 8pt;
		display:block;
		border-radius: 5px;
		background-color: #ffdf73;
		width: 300px;
		margin-top: 10%;
		margin-left: 40%;
		padding: 40px;
		box-shadow: 0 0 10px rgba(0,0,0,0.5);
	}
	.c{
		font-family: Arial, Helvetica, Verdana;
		font-size: 10pt;
	}
</style>
	<form method="POST">
		<table border="0">
			<tr>
				<td>
		<p>Логин </p>
		</td><td> <input id="line" name="login" type="text"><br>
	</td>
	<tr>
		<td>
		<p>Пароль </p></td><td><input id="line" name="password" type="password"><br>
	</td>
	<tr><td colspan="2">
		Не прикреплять к IP <input type="checkbox" name="not_attach_ip"><br>
	</td>
	<tr><td colspan="2">
		<button name="sumbit" type="sumbit" value="Авторизоваться">Авторизоваться</button>
	</td></tr></table>
	</form>
	