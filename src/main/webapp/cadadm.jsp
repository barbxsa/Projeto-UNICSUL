<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="cadadm">
	<label for="nome">
		Nome 
		<input type="text" name="nome_adm">
	</label>
	<label for="nome">
		CPF
		<input type="text" name="cpf_adm">
	</label>e
	<label for="nome">
		E-mail
		<input type="email" name="email_adm">
	</label>
	<label for="nome">
		Telefone
		<input type="tel" name="telefone_adm">
	</label>
	<label for="nome">
		Endereço
		<input type="date" name="endereco_adm">
	</label>
	<label for="nome">
		Status
		<select name="status_adm">
			<option value="0">Ativo</option>
			<option value="1">Inativo</option>
		</select>
	</label>
	<input type="submit" name="btn" value="enviar"/>
</form>
</body>
</html>