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
    <link rel="stylesheet" href="style.css">
    <title>Administrador - funcionários</title>
<% if((request.getSession(false).getAttribute("Editor")== null) )
{
%>
<jsp:forward page="login2.jsp"></jsp:forward>
<%} %>
</head>
<body>
    <header class="header-adm">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="flex fonts">
                        <div class="logo aside-left">
                            <img src="assets/img/logo.png" alt="">
                        </div>
                        <div class="navigation flex">
                            <div class="flex left">
                                <div class="menu">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                                <h1>Dashboard</h1>
                            </div>
                            <div class="right">
                                <i></i>
                                <i></i>
                                <i></i>
                                <div class="perfil flex">
                                    <i></i>
                                    <h2>Olá, <%=session.getAttribute("nomecliente") %></h2>
                                    <a href="<%=request.getContextPath()%>/LogoutServlet">Sair</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
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
	ResultSet resultSet2 = null;
	
	
	%>
    <main class="content fonts">
        <div class="container">
            <div class="row">
                <div class="col-12">
					<div class="superreal_loginform bigformao">
						
						<div class="links-funcionario">
							<div class="title-funcionario-page">
								<h3>Painel de controle</h3>
							</div>
							<div class="menu-funcionario">
								<ul>
									<li><a href="veiculos.jsp">Veículos</a></li>
									<li><a href="cadcliente.jsp">Clientes</a></li>
									<li><a href="listaagenda.jsp">Agendamentos</a></li>
									<li><a href="vendas.jsp">Vendas</a></li>
								</ul>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</main>
    
   
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Agendar</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="detalhes_carro">
	      		<h3>Veículo <span id="recebename"></span></h3>
				<h4>Cor: <span id="recebe_cor"></span></h4>
				<h4>Cilindradas: <span id="recebe_cilindradas"></span></h4>
				<h4>Portas: <span id="recebe_portas"></span></h4>
	      	</div>
	        <form method="post" action="cadvisita">
	        	<span>Data para visita</span>
	        	<input type="date" name="horario_visita">
	        	<input type="hidden" name="type" value="agendar">
	        	<input type="hidden" id="id_veiculo_visita" name="id_veiculo_visita">
	        	<input type="hidden" name="status_visita" value="1">
	        	<input type="hidden" name="id_cliente" value="<%=session.getAttribute("idcliente")%>">
	        	<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
			        <button type="submit" class="btn btn-primary">Realizar agendamento</button>
		     	</div>
	        </form>
	        
	      </div>
	     
	    </div>
	  </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Cancelar visita?</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	        <form method="post" action="altervisita">
	        	<input type="hidden" name="id_visita" id="id_visita">
	        	<input type="hidden" name="type" value="cancelarvisita">
	        	<input type="hidden" name="id_cliente" value="<%=session.getAttribute("idcliente")%>">
	        	
	        	<input type="hidden" val="1999-10-10" name="horario_visita">
	        	<input type="hidden" id="id_veiculo_visita" value="0" name="id_veiculo_visita">
	        	<input type="hidden" name="status_visita" value="1">
	        	<input type="hidden" name="id_cliente" value="<%=session.getAttribute("idcliente")%>">
	        	
	        	<div class="modal-footer">
			        <button type="submit" class="btn btn-primary" >Sim, cancelar</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
		     	</div>
	        </form>
	        
	      </div>
	     
	    </div>
	  </div>
	</div>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="assets/js/main.js"></script>
    <script>
   		$('#exampleModal').on('show.bs.modal', function (event) {
    	  var button = $(event.relatedTarget) // Button that triggered the modal
    	  var cor = button.data('cor');
    	  var portas = button.data('portas');
    	  var cilindradas = button.data('cilindradas');
    	  var nome = button.data('nomeveiculo');
    	  var id = button.data('idveiculo');
    	  
    	  $('#recebe_cor').html(cor);
    	  $('#recebe_cilindradas').html(cilindradas);
    	  $('#recebe_portas').html(portas);
    	  $('#recebename').html(nome);
    	  $('#id_veiculo_visita').val(id);
    	})
    	
    	$('#exampleModal2').on('show.bs.modal', function (event) {
    	  var button = $(event.relatedTarget) // Button that triggered the modal
    	  var idivista = button.data('idvisita');
    	  $('#id_visita').val(idivista);
    	})
    </script>
</body>
</html>