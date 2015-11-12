<?php

		$host="localhost";
		$database="controlsocket";
		$user="disp";
		$pswd="1234";
		$dbh=mysql_connect($host, $user, $pswd) or die("I can't connect to MySql :(");
		mysql_select_db($database) or die("I can't connect to database :(");
session_start();
class AuthClass {



	public function isAuth(){
		if (isset($_SESSION["is_auth"])){
			return $_SESSION["is_auth"];
		}
		else return false;
	}

	public function auth($_login, $_password){
	   if (!empty($_POST['user_login']) && !empty($_POST['user_password'])){
	   	$_login=($_POST['user_login']);
	   	$_password=($_POST['user_password']);
	   	$query=mysql_query("SELECT * FROM `users` WHERE `user_login`='" . $_login ."' AND `user_password`='" .$_password."'");
	   	$numrows=mysql_num_rows($query);
	   	if ($numrows!=0){
	   		while($row=mysql_fetch_assoc($query)){
	   			$dbuser=$row['user_login'];
	   			$dbpass=$row['user_password'];
	   		}
	   		if ($_login == $dbuser && $_password == $dbpass){
	   			$_SESSION["is_auth"] = true;
				$_SESSION["login"] = $login;
				return true;
	   		}
	   	
			
			
		}
	}
		else {
			$_SESSION["is_auth"]=false;
			return  false;
		}
	}
	public function getLogin(){
		if($this->isAuth()){
			return $_SESSION["login"];
		}
	}
	public function out(){
		$_SESSION=array();
		session_destroy();
	}
}
$auth = new AuthClass();

if (isset($_POST["login"]) && isset($_POST["password"])){
	if (!$auth->auth($_POST["login"], $_POST["password"])){
		echo "Логи/пароль введены неверно";
		echo $data["user_password"];
	}
}
if (isset($_GET["is_exit"])){
	if ($_GET["is_exit"] == 1){
		$auth->out();
		header("Location: ?is_exit=0");
	}
}
?>
<?php
if ($auth->isAuth()){
	echo "Hello" . $auth->getLogin();
	echo "</br><a href='?is_exit=1'>Exit</a>";
}
else{
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
		<p>Логин</p>
		</td><td> <input id="line" name="login" type="text"  ><br>
	</td>
	<tr>
		<td>
		<p>Пароль </p></td><td><input id="line" name="password" type="password"><br>
	</td>
	<tr><td colspan="2">
		<button name="sumbit" type="sumbit" value="Авторизоваться">Авторизоваться</button>
	</td></tr></table>
	</form>
<?php
} ?>
