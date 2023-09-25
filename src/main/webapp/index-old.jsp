<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="assets/svg/favicon.svg" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="style.css">
    <title>Alpis - Venda de carro</title>
<body class="bodyhome">
	
	<header>
		<div class="container">
			<div class="row">
				<span class="alpisbrand">Alpis</span>
				<nav>
					<ul>
						<li><a href="login.jsp">Cadastrar</a></li>
						<li><a href="login.jsp">Entrar</a></li>
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
					<div class="banner-classificado">
					<%
					    
								try{ 
								connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
								statement=connection.createStatement();
								String sql = "SELECT * from veiculos  order by rand() limit 1";
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
						%>	
						<div class="sidetext-banner-classificado">
							<h1><%=resultSet.getString("marca_veiculo") %> - <%=resultSet.getString("modelo_veiculo") %></h1>
							<span class="ksbanner"><%=resultSet.getString("km_veiculo") %> Km</span>
							<a href="login2.jsp">Agende sua visita</a>
						</div>
						<div class="sidepicbanner" style="background-image:url(<%=resultSet.getString("fotoveiculo") %>)"></div>
						<% 
							}
							
							} catch (Exception e) {
							e.printStackTrace();
							}
						%>
					</div>
				
					<div class="title-lista-carros">
						  <h3>Últimos classificados</h3>
					</div>
					<div class="flex-classificados owl-carousel carouselcar">
						<%
					    
								try{ 
								connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
								statement=connection.createStatement();
								String sql = "SELECT * from veiculos";
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
						%>		
					  	<div class="unicoveiculo item">
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

 	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="assets/js/main.js"></script>
 	<script>
	 	$('.carouselcar').owlCarousel({
	 	    loop:true,
	 	    margin:10,
	 	    nav:true,
	 	    responsive:{
	 	        0:{
	 	            items:1
	 	        },
	 	        600:{
	 	            items:3
	 	        },
	 	        1000:{
	 	            items:3
	 	        }
	 	    }
	 	})
 	
 	</script>
</body>
</html>