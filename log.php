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
		<p>Логин </p>
		</td><td> <input id="line" name="login" type="text" value="<?php echo (isset($_POST["login"])) ? $_POST["login"] : null; ?>" ><br>
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
<?php
} ?>
