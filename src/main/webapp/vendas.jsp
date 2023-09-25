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
	
	%>
    
    <main class="content fonts">
        <div class="container">
            <div class="row">
                <div class="col-12">
					<div class="superreal_loginform bigformao">
						
						
						<div class="unica-acao">
							<div class="title-cardacao">
								<h2>Realizar venda</h2>
							</div>
							<div class="cards_visitas">
								<form method="post" action="vender">
				<input type="hidden" name="type" value="vender">
				<label>
					Veículo para venda
					<select name="id_veiculo">
					 
					<%
					
						try{ 
							
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql = "select * from veiculos";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>		
					
						<option value="<%=resultSet.getString("id_veiculo") %>"><%=resultSet.getString("marca_veiculo") %>/<%=resultSet.getString("modelo_veiculo") %></option>
					
					<% 
						}
						
						} catch (Exception e) {
						e.printStackTrace();
						}
					%>
										</select>
									</label>
									<label>
										CPF do cliente
										<input type="text" name="cpf_cliente">
									</label>
									<input type="submit" value="Efetuar venda">
								</form>
							</div>
						</div>
						
						
						<div class="unica-acao">
							<div class="title-cardacao">
								<h2>Vendas realizadas</h2>
							</div>
							<div class="cards_visitas">
								<%


									try{ 
										connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
										statement=connection.createStatement();
										String sql = "select c.id_veiculo_compra as id_veiculo_compra, c.id_cliente_compra as id_cliente_compra, cli.id_cliente as id_cliente, cli.nome_cliente as nome_cliente, v.id_veiculo as id_veiculo, v.marca_veiculo as marca_veiculo, v.modelo_veiculo as modelo_veiculo from compra c inner join cliente cli on c.id_cliente_compra = cli.id_cliente inner join veiculos v on c.id_veiculo_compra = v.id_veiculo";
										resultSet = statement.executeQuery(sql);
										while(resultSet.next()){
								%>	
								
									<div class="unicapill-visita">
										<h3>Veículo vendido: <%=resultSet.getString("marca_veiculo") %> - <%=resultSet.getString("modelo_veiculo") %></h3>
										<h3>Cliente: <%=resultSet.getString("nome_cliente") %></h3>
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
		</div>				
    </main>
    
    

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
	      
	        <form method="post" action="cancelarvisita">
	        	<input type="hidden" name="id_visita" id="id_visita">
	        	<input type="hidden" name="type" value="cancelarvisita">
	        	<input type="hidden" val="1999-10-10" name="horario_visita">
	        	<input type="hidden" id="id_veiculo_visita" value="0" name="id_veiculo_visita">
	        	<input type="hidden" name="status_visita" value="1">
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
 
    	$('#exampleModal2').on('show.bs.modal', function (event) {
    	  var button = $(event.relatedTarget) // Button that triggered the modal
    	  var nome = button.data('idvisita');
    	  var idveiculo = button.data('idveiculo');
    	 $('#id_visita').val(nome);
    	})
    </script>
</body>
</html>




