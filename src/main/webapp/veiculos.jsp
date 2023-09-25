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
                    
                    <section class="dashboard fonts">
                        <div class="flex">
                            <div class="desc">
                                <h1>Formulário de Veículos</h1>
                                <p>Descrição teste</p>
                            </div>
                            <!-- <div class="search-base">
                                <input class="search" type="text" placeholder="Pesquise" />
                                <i></i>
                            </div> -->
                        </div>
                        <div class="form fonts">
							<form action="cadveiculo">
								<input type="hidden" name="type" value="cadastrar">
								<input type="text" name="marca_veiculo" placeholder="Marca"/>
								<input type="text"  name="modelo_veiculo" placeholder="Modelo"/>
								<input type="text"  name="fotoveiculo" placeholder="Foto do veículo (URL)"/>
								<input type="text"  name="cor_veiculo" placeholder="Cor"/>
								<input type="text"  name="portas_veiculo" placeholder="Portas"/>
								<input type="text"  name="cilindradas_veiculo" placeholder="Cilindradas"/>
								<input type="text"  name="km_veiculo" placeholder="KM"/>
								<select name="status_veiculo">
								 <option value="0">Ativo</option>
								 <option value="1">Inativo</option>
								</select>
								<!-- <input type="submit" name="btn" value="enviar"/> -->
								<div class="btn-crud flex">
	                            	<input type="submit" value="Cadastrar" name="btn" class="btn-success" id="btnCadastrar">
	                            </div>
							</form>
                        </div>
                        <div class="fonts title-table">
                            <h1>Relatório da tabela</h1>
                        </div>

                        <div class="table-bd fonts">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Marca</td>
                                        <td>Modelo</td>
                                        <td>Cor</td>
                                        <td>Portas</td>
                                        <td>Cilindradas</td>
                                        <td>Quilometragem</td>
                                        <td>Status</td>
                                        <td>Ação</td>
                                    </tr>
                                    <%
		
										try{ 
											connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
											statement=connection.createStatement();
											String sql = "SELECT * from veiculos order by id_veiculo desc";
											resultSet = statement.executeQuery(sql);
											while(resultSet.next()){
									%>	
                                    <tr>
                                        <td><%=resultSet.getString("marca_veiculo") %></td>
                                        <td><%=resultSet.getString("modelo_veiculo") %></td>
                                        <td><%=resultSet.getString("cor_veiculo") %></td>
                                        <td><%=resultSet.getString("portas_veiculo") %></td>
                                        <td><%=resultSet.getString("cilindradas_veiculo") %></td>
                                        <td><%=resultSet.getString("km_veiculo") %></td>
                                        <td><%=resultSet.getString("status_veiculo") %></td>
                                        <td>
                                        	<div class="bnts-acoes">
                                        		<a href="javascript:void(0)"
												data-nomeveiculo="<%=resultSet.getString("marca_veiculo") %>/<%=resultSet.getString("modelo_veiculo") %>"
												data-marca="<%=resultSet.getString("marca_veiculo") %>"
												data-modelo="<%=resultSet.getString("modelo_veiculo") %>"
												data-cor="<%=resultSet.getString("cor_veiculo") %>"
												data-portas="<%=resultSet.getString("portas_veiculo") %>"
												data-foto="<%=resultSet.getString("fotoveiculo") %>"
												data-status="<%=resultSet.getString("status_veiculo") %>"
												data-km="<%=resultSet.getString("km_veiculo") %>"
												data-cilindradas="<%=resultSet.getString("cilindradas_veiculo") %>"
												data-idveiculo="<%=resultSet.getString("id_veiculo") %>"
												data-toggle="modal" data-target="#exampleModal"
												>
													Editar
												</a>
												<a href="javascript:void(0)"
												data-nomeveiculo="<%=resultSet.getString("marca_veiculo") %>/<%=resultSet.getString("modelo_veiculo") %>"
												data-idveiculo="<%=resultSet.getString("id_veiculo") %>"
												data-toggle="modal" data-target="#exampleModal2"
												>Excluir</a>                                        	
											</div>
                                        </td>
                                    </tr>
                                   <% 
										}
										
										} catch (Exception e) {
										e.printStackTrace();
										}
									%>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Editar veículo -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Editar <span id="nomeveic"></span></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form method="post" action="editaveiculo">
	        	<input type="hidden" id="id_veiculo" name="id_veiculo">
	        	<input type="hidden" name="type" value="editar">
	        	<input type="text" id="fd1" name="marca_veiculo" placeholder="Marca"/>
				<input type="text" id="fd2" name="modelo_veiculo" placeholder="Modelo"/>
				<input type="text" id="fd3" name="fotoveiculo" placeholder="Foto do veículo (URL)"/>
				<input type="text" id="fd4" name="cor_veiculo" placeholder="Cor"/>
				<input type="text" id="fd5" name="portas_veiculo" placeholder="Portas"/>
				<input type="text" id="fd6" name="cilindradas_veiculo" placeholder="Cilindradas"/>
				<input type="text" id="fd7" name="km_veiculo" placeholder="KM"/>
				<select name="status_veiculo">
					<option value="0">Ativo</option>
					<option value="1">Inativo</option>
				</select>
				<input type="submit" value="Enviar">
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
    <!-- Editar veículo -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Excluir <span id="nomeveic2"></span>?</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form method="post" action="apagaveiculo">
	        	<input type="hidden" id="id_veiculo2" name="id_veiculo">
	        	<input type="hidden" name="type" value="excluir">
	        	<div class="modal-footer">
			        <button type="submit" class="btn btn-primary" >Sim, excluir</button>
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
    	  var nome = button.data('nomeveiculo');
    	  var marca = button.data('marca');
    	  var modelo = button.data('modelo');
    	  var cor = button.data('cor');
    	  var portas = button.data('portas');
    	  var foto = button.data('foto');
    	  var km = button.data('km');
    	  var cilindradas = button.data('cilindradas');
    	  var idveiculo = button.data('idveiculo');
    	 
    	  $('#nomeveic').html(nome);
    	  $('#fd1').val(marca);
    	  $('#fd2').val(modelo);
    	  $('#fd3').val(foto);
    	  $('#fd4').val(cor);
    	  $('#fd5').val(portas);
    	  $('#fd6').val(cilindradas);
    	  $('#fd7').val(km);
    	  $('#id_veiculo').val(idveiculo);
    	})
	
    	$('#exampleModal2').on('show.bs.modal', function (event) {
    	  var button = $(event.relatedTarget) // Button that triggered the modal
    	  var nome = button.data('nomeveiculo');
    	  var idveiculo = button.data('idveiculo');
    	 
    	  $('#nomeveic2').html(nome);
    	  $('#id_veiculo2').val(idveiculo);
    	})
    </script>
</body>
</html>