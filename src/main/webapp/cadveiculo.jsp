<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="cadveiculo">
	Marca: <input name="marca_veiculo"/><br/>
	Modelo: <input name="modelo_veiculo"/><br/>
	Foto do veículo (URL): <input name="fotoveiculo"/><br/>
	Cor: <input name="cor_veiculo"/><br/>
	Portas: <input name="portas_veiculo"/><br/>
	Cilindradas: <input name="cilindradas_veicuo"/><br/>
	Kms corridos: <input name="km_veiculo"/><br/>
	Status<select name="status_veiculo">
	 <option value="0">Ativo</option>
	 <option value="1">Inativo</option>
	</select>
	<input type="submit" name="btn" value="enviar"/>
</form>
</body>
</html>