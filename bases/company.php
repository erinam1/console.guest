
  <!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../style/titan.css" media="all">
    </head>
    <body>
    	<table width="100%" border="0">
    		<tr>
                <td colspan="2">
                <iframe src="companyshow.php" width="100%" height="350px" align="left" frameborder="0"></iframe>
    			</td>
            </tr>
            <tr>
                <td>
    				<td>
<a id="add_company_but" href="#add_company"><button><img src="../image/add.png" width="30px" height="30px">Добавить компанию</button></a>
<a href="edit_company.php" target="frame"><button><img src="../image/editcom.png" width="30px" height="30px"></button></a>
                <a id="add_company" class="overlay" href="#x"></a>
                <div class="popup">
                	<form method='POST' action='update_all_company.php' target='frame_menu'>
                	<table>
                		<tr>
                			<td colspan="2"><h4>Добавление новой компании</h4></td>

                		</tr>
                		<tr>
                			<td colspan="2">Полное наименование компании</td>
                        </tr>
                        <tr>
                        <td colspan="2"><input class="full_name" type="text" name="full_name" value="" size="25" />
                        </td>
                        </tr>
                        <tr>
                			<td colspan="2">Сокращение наименования</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="short_name" type="text" name="short_name" value="" size="25" />
                            </td></tr>
                            <tr>
                			<td colspan="2">Адрес</td>
                        </tr><tr>
                            <td colspan="2"><input class="address" type="text" name="address" value="" size="25" /></td>

                		</tr>
                		
                		<tr>
                            <td colspan="0" align="right"><button type="reset" name="cancel"><a href="#x">Отменить</a></button></td>
                			<td colspan="0" align="right"><button type="sumbit" name="add_company_btn">Добавить</button></td>
                		</tr>
                	</table>
                </form>
                </div>
     </table>
<!--<img src="../image/delete.png" width="30px" height="30px">-->
<!--<img src="../image/edit.png" width="30px" height="30px">-->