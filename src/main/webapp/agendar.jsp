<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="obj" class="model.UsuarioDto"/>  

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
</head>
<body>
	
	<header>
		<div class="container">
			<div class="row">
				<nav>
					<ul>
						<li><a href="logincliente.jsp">Entrar</a></li>|
						<li><a href="cadcliente.jsp">Cadastrar</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	
	<div class="banner-site">
	</div>
	
	
	<%

	String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "alpis_base";
	String userId = "root";
	String password = "root";

	try {
	Class.forName(driverName);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	
	%>
	<div class="body-lista">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="title-lista-carros">
						  <h3>Você está agendando:</h3>
						  <p>
						  <%
							String nomecarro = request.getParameter("nome_veiculo");
							String id_veiculo = request.getParameter("id_veiculo");
							%>
						  - <%out.println(nomecarro);%><br>
						  </p>
					</div>
					<div class="formspadroes">
						
						<form action="cadvisita">
							<input type="hidden" name="id_veiculo_visita" value=<%out.println(id_veiculo);%>>
							Selecione a data e hora desejada<Br>
							<input type="datetime-local" name="horario_visita"><br>
							<input type="text" name="cpf_cliente" placeholder="Digite seu CPF">
							<input type="submit" value="Agendar visita para <%out.println(nomecarro);%>">
						</form>
						
					</div>
				</div>
			</div>
		</div>
	  
	</div>

</body>
</html>