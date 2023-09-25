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
						  <h3>Agendamento feito com sucesso</h3>
					</div>
					<div class="flex-classificados">
						<%
					    
								try{ 
								connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
								statement=connection.createStatement();
								String sql = "SELECT * from veiculos";
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
						%>		
					  	<div class="unicoveiculo">
					  		<div class="coverveiculo" style="background-image:url(<%=resultSet.getString("fotoveiculo") %>)"></div>
					  		<div class="desc-veiculo">
					  			<h3><%=resultSet.getString("marca_veiculo") %> - <%=resultSet.getString("modelo_veiculo") %></h3>
					  			<div class="detalhes">
					  				<p>
					  				Cor:<%=resultSet.getString("cor_veiculo") %><br>
					  				Portas:<%=resultSet.getString("portas_veiculo") %><br>
					  				Km rodado:<%=resultSet.getString("km_veiculo") %><br>
					  				Cilindradas:<%=resultSet.getString("cilindradas_veiculo") %>
					  				</p>
					  			</div>
					  			<% if(session.getAttribute("session") == null){ %>
					  			<a href="login.jsp">Entre para agendar</a>
					  			<% } else { %>
					  			<a href="agendar.jsp">Agendar agora</a>
					  			<% } %>
					  		</div>
					  	</div>
					  	<% 
							}
							
							} catch (Exception e) {
							e.printStackTrace();
							}
						%>
						
					  </div>
				</div>
			</div>
		</div>
	  
	</div>

</body>
</html>