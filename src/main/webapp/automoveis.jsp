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
    <link rel="shortcut icon" href="assets/svg/icon-car.svg" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="style-site.css">
    <title>ALPIS - Automoveis</title>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="nav flex">
                        <div class="logo">
                            <img src="assets/svg/icon-car.svg" alt="">
                        </div>
                        <nav class="pages">
                            <ul class="flex">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="automoveis.jsp">Veículos</a></li>
                                <li><a href="sobre.jsp">Sobre</a></li>
                                <li><a href="contato.jsp">Contato</a></li>
                            </ul>
                        </nav>
                        <div class="login flex btn-default">
                            <a href="login.jsp" class="">Cadastre-se</a>
                            <a href="login.jsp" class="yellow">Login</a>
                        </div>
                        <div class="menu-mobile">
                            <a href="javascript:void(0);" class="menu flex">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-animation">
            <nav class="pages-opened">
                <ul class="flex">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="automoveis.jsp">Veículos</a></li>
                    <li><a href="sobre.jsp">Sobre</a></li>
                    <li><a href="contato.jsp">Contato</a></li>
                </ul>
            </nav>
            <div class="pages-policy flex">
                <a href="javascript:void(0);">Instagram</a>
                <a href="javascript:void(0);">Facebook</a>
                <a href="javascript:void(0);">Whatsapp</a>
            </div>
        </div>
    </header>

    <main class="webbanner flex" style="background: url(assets/img/car8.jpg) no-repeat right; background-size: cover;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="banner font">
                        <div class="head-desc ">
                            <span>Ande com a ALPIS</span>
                            <h1>Automoveis<e>.</e></h1>
                        </div>
                        <div class="content-desc flex">
                            <div class="desc">
                                <p>
                                    A ALPIS tem os melhores automóveis, passando todas as informações <br>
                                    pertinentes a compra e sobre os veículos sendo o carro 0KM <br>
                                    ou não.
                                </p>
                            </div>
                        </div>
                        <div class="btn-default agendar">
                            <a href="automoveis.jsp#veiculos">Veículos</a>
                            <i></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <section class="aba1">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="about font center">
                        <div class="head-desc">
                            <h2>Presentes inclusos <br>com a compra<e>.</e></h2>
                            <p>Com a ALPIS você só tem a ganhar.</p>
                        </div>
                        <div class="cards destaques flex">
                            <div class="item">
                                <i></i>
                                <h4>Garantia</h4>
                                <p>Veículos com até 5 anos de garantia</p>
                            </div>
                            <div class="item">
                                <i></i>
                                <h4>Manutenção</h4>
                                <p>As duas primeiras manutenções são por conta da casa.</p>
                            </div>
                            <div class="item">
                                <i></i>
                                <h4>Taxa 0%</h4>
                                <p>Taxa 0% através de financiamento bancário junto ao Banco parceiro</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
	
    <section class="aba4" id="veiculos">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="vehicles font center">
                        <div class="head-desc">
                            <h2>Nossos veículos</h2>
                            <p>Logo logo teremos novidades.</p>
                        </div>
                        <div class="cards flex">
                            <!-- <div class="item">
                                <div class="vehicle-item" style="background: url(assets/img/car1.jpg) no-repeat center center; background-size:cover;"></div>
                                <h4>Lorem ipsum dolor sit amet.</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci!</p>
                                <div class="btn-default">
                                    <a href="javascript:void(0);" class="yellow">Agende uma visita</a>
                                </div>
                            </div>-->
                            <%
								try{ 
								connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
								statement=connection.createStatement();
								String sql = "SELECT * from veiculos";
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
							%>
						  	
						  	<div class="item">
                                <div class="vehicle-item" style="background: url(<%=resultSet.getString("fotoveiculo") %>) no-repeat center center; background-size:cover;"></div>
                                <h4><%=resultSet.getString("marca_veiculo") %> - <%=resultSet.getString("modelo_veiculo") %></h4>
                                <p>
                                	Cor:<%=resultSet.getString("cor_veiculo") %><br>
						  			Portas:<%=resultSet.getString("portas_veiculo") %><br>
						  			Km rodado:<%=resultSet.getString("km_veiculo") %><br>
						  			Cilindradas:<%=resultSet.getString("cilindradas_veiculo") %>
					  			</p>
                                <div class="btn-default">
<!--                                     <a href="javascript:void(0);" class="yellow">Agende uma visita</a> -->
                                    <% if(session.getAttribute("session") == null){ %>
						  			<a href="login.jsp" class="yellow">Entre para agendar</a>
						  			<% } else { %>
						  			<a href="agendar.jsp" class="yellow">Agende uma visita</a>
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
                        <div class="center btn-default spacing">
                            <a href="contato.jsp#contato" class="">Gostaria de algum veículo que não está aqui? Contate-nos.</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="nav-foot flex font">
                        <div class="logo-foot aside-30">
                            <img src="assets/svg/icon-car.svg" alt="">
                            <div class="content-desc">
                                <p>
                                	A Alpis é 100% transparente com os compradores
									e vendedores de automóveis, passando como informações
									pertinentes a compra e sobre os veículos.
								</p>
                            </div>
                        </div>
                        <nav class="page-link flex aside-70">
                            <ul>
                                <h4>Navegação</h4>
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="automoveis.jsp">Veículos</a></li>
                                <li><a href="sobre.jsp">Sobre</a></li>
                                <li><a href="contato.jsp">Contato</a></li>
                            </ul>
                            <ul>
                                <h4>Suporte</h4>
                                <li><a href="sobre.jsp">Sobre</a></li>
                                <li><a href="contato.jsp">Contato</a></li>
                            </ul>
                            <ul>
                                <h4>Políticas</h4>
                                <li><a href="javacript:void(0);">Privacidade</a></li>
                                <li><a href="javacript:void(0);">Termos de uso</a></li>
                                <li><a href="javacript:void(0);">FAQ</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="footer-end flex font">
                        <div class="rights">
                            <p>
                                Todos os direitos reservados ©
                            </p>
                        </div>
                        <div class="pages-policy flex">
                            <a href="javascript:void(0);">Política de Privacidade</a>
                            <a href="javascript:void(0);">Termos de uso</a>
                            <a href="javascript:void(0);">FAQ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="https://code.jquery.com/jquery-3.6.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>