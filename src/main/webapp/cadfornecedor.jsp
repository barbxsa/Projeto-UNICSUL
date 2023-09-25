<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <title>Formulário</title>
</head>
<body>
    <header class="header-adm">
        <div class="container">
            <div class="row">
                <div class="col12">
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
                                    <h2>Olá, Nome</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    
    <main class="content fonts">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="aside-left width">
                        <ul>
                            <li><a href="index.jsp" target="_blank"><i></i>Dashboard</a></li>
                            <li><a href="cadcliente.jsp"><i></i>Clientes</a></li>
                            <li><a href="cadfuncionario.jsp"><i></i>Funcionarios</a></li>
                            <li><a href="cadfornecedor.jsp"><i></i>Fornecedores</a></li>
                            <li><a href="veiculos.jsp"><i></i>Veículos</a></li>
                        </ul>
                    </nav>
					<% if("cadastro".equals(request.getParameter("acao"))){
							
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
					<section class="dashboard fonts">
                        <div class="flex">
                            <div class="desc">
                                <h1>Formulário de Fornecedores</h1>
                                <p>Descrição teste</p>
                            </div>
                            <!-- <div class="search-base">
                                <input class="search" type="text" placeholder="Pesquise" />
                                <i></i>
                            </div> -->
                        </div>
                        <div class="form fonts">
							<form action="cadfornecedor" method="post">
								<input type="hidden" value="cadastrar" name="val_action">
								<input type="text" name="nome_fornecedor" placeholder="Nome">
						        <input type="text" name="cnpj_fornecedor" placeholder="CNPJ">
						        <input type="text" name="endereco_fornecedor" placeholder="Endereço">
						        <select name="status_fornecedor">
									<option value="0">Ativo</option>
									<option value="1">Inativo</option>
							    </select>
								<input type="submit" name="btn" value="enviar"/>
							</form>
						</div>
					</section>
					<% } else if("editar".equals(request.getParameter("acao"))){
					%>	
					<section class="dashboard fonts">
                        <div class="flex">
                            <div class="desc">
                                <h1>Formulário de Funcionarios</h1>
                                <p>Editando funcionário</p>
                            </div>
                            <!-- <div class="search-base">
                                <input class="search" type="text" placeholder="Pesquise" />
                                <i></i>
                            </div> -->
                        </div>
                        <div class="form fonts">
					
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
							<form action="editarfornecedor">
						    <%
						    String id_fornecedor = request.getParameter("id_fornecedor");
					    
								try{ 
								connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
								statement=connection.createStatement();
								String sql = "select * from fornecedores where id_fornecedor="+id_fornecedor;
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
								%>			
								<input type="hidden" name="id_fornecedor" value="<%=resultSet.getString("id_fornecedor") %>">
								<input type="hidden" name="val_action" value="editar">
								 <input type="text" name="nome_fornecedor" value="<%=resultSet.getString("nome_fornecedor") %>">
								 <input type="text" name="cnpj_fornecedor" value="<%=resultSet.getString("cnpj_fornecedor") %>">
								 <input type="text" name="endereco_fornecedor" value="<%=resultSet.getString("endereco_fornecedor") %>">
								 <select name="status_fornecedor">
									<option value="0">Ativo</option>
									<option value="1">Inativo</option>
								</select>								
								<% 
								}
								
								} catch (Exception e) {
								e.printStackTrace();
								}
							%>
							<div class="btn-crud flex">
								<input type="submit" name="btn" value="Alterar" class="btn btn-warning">
							</div>
					</form>
				</div>
			</section>

				<% } else if("excluir".equals(request.getParameter("acao"))){
			%>				
				<%  
				String nome_fornecedor = request.getParameter("nome_fornecedor");
				String id_fornecedor = request.getParameter("id_fornecedor");
				%>
				<section class="dashboard fonts">
                     <div class="flex">
                         <div class="desc">
                             <h1>Tem certeza que deseja excluir o funcionário <% out.println(nome_fornecedor); %>?</h1>
                             <p>Apagando funcionário</p>
                         </div>
                         <!-- <div class="search-base">
                             <input class="search" type="text" placeholder="Pesquise" />
                             <i></i>
                         </div> -->
                     </div>
                     <div class="form fonts">
						<a href="cadfornecedor.jsp">Não, voltar</a>
						<form action="deleta_fornecedor">
							<input type="hidden" name="id_fornecedor" value=<%out.println(id_fornecedor);%>">
							<input type="hidden" name="cnpj_fornecedor" value="0">
							<input type="hidden" name="endereco_fornecedor" value="0">
							<input type="hidden" name="status_fornecedor" value="0">
							<input type="hidden" name="val_action" value="excluir">
							<button type="submit" class="btn-danger">Sim, excluir</button>
						</form>
						</div>
					</div>
					<% } else {%>
					
					<section class="dashboard fonts">
	                        <div class="flex">
	                            <!-- <div class="desc">
	                                <h1>Formulário de Funcionário?</h1>
	                                <p>Lista de funcionários</p>
	                            </div>
	                            <!- <div class="search-base">
	                                <input class="search" type="text" placeholder="Pesquise" />
	                                <i></i>
	                            </div> -->
	                        </div>
	                        <div class="fonts title-table">
	                           <h1>Relatório da tabela</h1>
	                       	</div>
	
	                       	<div class="table-bd fonts">
	                           <table class="table">
									<thead>
										<tr>
											<td>Nome </td>
											<td>CNPJ</td>
											<td>Ações</td>
										</tr>
									</thead>
									<tbody>
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
										
										try{ 
										connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
										statement=connection.createStatement();
										String sql ="SELECT * FROM fornecedores";
										
										resultSet = statement.executeQuery(sql);
										while(resultSet.next()){
										%>
										
										<tr>
											<td><%=resultSet.getString("nome_fornecedor") %></td>
											<td><%=resultSet.getString("cnpj_fornecedor") %></td>
											<td><a href="?acao=editar&id_fornecedor=<%=resultSet.getString("id_fornecedor") %>">Editar fornecedor</a> | <a href="?acao=excluir&id_fornecedor=<%=resultSet.getString("id_fornecedor") %>&nome_fornecedor=<%=resultSet.getString("nome_fornecedor") %>">Excluir fornecedor</a></td>
										</tr>		
										
										<% 
										}
										
										} catch (Exception e) {
										e.printStackTrace();
										}
									%>
									</tbody>
								</table>
								<div class="btn-crud flex">
									<a href="?acao=cadastro">Cadastrar novo fornecedor</a>
	                            </div>
							</div>
						</section>

	
<% } %>
</body>
</html>