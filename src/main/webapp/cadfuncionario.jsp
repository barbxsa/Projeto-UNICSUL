<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    <title>Administrador master</title>
<% if((request.getSession(false).getAttribute("Admin")== null) )
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
                                    <a href="adminhome.jsp">Página inicial</a>
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
						<div class="superreal_table">
						
							<%
						
						if("cadastro".equals(request.getParameter("acao"))){
							
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
                                <h1>Formulário de Funcionarios</h1>
                                <p>Descrição teste</p>
                            </div>
                            <!-- <div class="search-base">
                                <input class="search" type="text" placeholder="Pesquise" />
                                <i></i>
                            </div> -->
                        </div>
                        <div class="form fonts">
							<form action="cadcliente">
								<input type="hidden" name="val_action" value="cadastrar">
								<input type="hidden" name="redirection" value="admin">
								<input type="hidden" name="role" value="Funcionario">
								<input type="hidden" name="type" value="cadastrar">
								
								
								<input type="text" name="nome_cliente" placeholder="Nome">
								<input type="text" name="cpf_cliente" placeholder="CPF">
								<input type="email" name="email_cliente" placeholder="E-mail">
								<input type="text" name="senha" placeholder="Senha para funcionário">
								<input type="tel" name="telefone_cliente"placeholder="Telefone">
								<input type="date" name="nascimento_cliente" placeholder="Data">
								<select name="status_cliente">
									<option value="0">Ativo</option>
									<option value="1">Inativo</option>
								</select>
																
								<div class="btn-crud flex">
	                                <input type="submit" value="Cadastrar" name="btn" class="btn-success" id="btnCadastrar">
	                            </div>
							</form>
						</div>
					</section>
					<% } else if("editar".equals(request.getParameter("acao"))){
					%>	
					<section class="dashboard fonts">
                        
                        <div class="form fonts">
							<div class="flex">
                            <div class="desc">
                                <h1>Formulário de Funcionarios</h1>
                                <p>Editando funcionário</p>
                            </div>
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
								<form action="editafuncionario">
							    <%
							    String id_func = request.getParameter("id_funcionario");
									try{ 
									connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
									statement=connection.createStatement();
									String sql = "SELECT * from cliente where id_cliente='"+id_func+"'";
									resultSet = statement.executeQuery(sql);
									while(resultSet.next()){
									%>			
									<input type="hidden" name="id_cliente" value="<%=resultSet.getString("id_cliente") %>">
									<input type="hidden" name="type" value="editar">
									<input type="hidden" name="role" value="Funcionario">
									<input type="hidden" name="redirection" value="admin">
		
									<input type="text" name="nome_cliente" placeholder="Nome"  value="<%=resultSet.getString("nome_cliente") %>">
									<input type="text" name="cpf_cliente" placeholder="CPF" value="<%=resultSet.getString("cpf_cliente") %>">
									<input type="email" name="email_cliente" placeholder="E-mail" value="<%=resultSet.getString("email_cliente") %>">
									<input type="text" name="senha" placeholder="Senha" value="<%=resultSet.getString("senha") %>">
									<input type="tel" name="telefone_cliente" placeholder="Telefone" value="<%=resultSet.getString("telefone_cliente") %>">
									<input type="date" name="nascimento_cliente" value="<%=resultSet.getString("nascimento_cliente") %>">
									<select name="status_cliente">
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
						String nome_func = request.getParameter("nome_funcionario");
						String id_func = request.getParameter("id_funcionario");
						%>
	                        <div class="flex">
	                            <div class="desc">
	                                <h1>Tem certeza que deseja excluir o funcionário <% out.println(nome_func); %>?</h1>
	                            </div>
	                            <!-- <div class="search-base">
	                                <input class="search" type="text" placeholder="Pesquise" />
	                                <i></i>
	                            </div> -->
	                        </div>
	                        <div class="form fonts">
								<a href="cadfuncionario.jsp">Não, voltar</a>
								<form action="deleta">
									<input type="hidden" name="id_cliente" value=<%out.println(id_func);%>>
									<input type="hidden" name="type" value="excluir">
									<input type="hidden" name="redirection" value="admin">
								
									
									<input type="hidden" value="vazio" name="nome_usurario">
									<input type="hidden" value="vazio" name="cpf_usuario">
									<input type="hidden" value="vazio" name="email_usuario">
									<input type="hidden" value="vazio" name="senha">
									<input type="hidden" value="vazio" name="telefone_usuario">
									<input type="hidden" value="vazio" name="nascimento_usuaro">
									<input type="hidden" value="0" name="status_cliente">
									<button type="submit" class="btn-danger">Sim, excluir</button>
								</form>
							</div>
						<% }  else if("relatorio".equals(request.getParameter("acao"))){%>
							
							
							<div class="table-bd fonts">
	                           <%
	                           		
	                           
	                           
	                           %>
							</div>
							
						<% } else { %>
							<div class="table-bd fonts">
	                           <table class="table">
									<thead>
										<tr>
											<td><b>Nome do funcionário</b></td>
											<td><b>CPF</b></td>
											<td><b>Ações</b></td>
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
										String sql ="SELECT * FROM cliente where role='Funcionario'";
										
										resultSet = statement.executeQuery(sql);
										while(resultSet.next()){
										%>
										
										<tr>
											<td><%=resultSet.getString("nome_cliente") %></td>
											<td><%=resultSet.getString("cpf_cliente") %></td>
											<td><a href="?acao=editar&id_funcionario=<%=resultSet.getString("id_cliente") %>">Editar funcionario</a> | <a href="?acao=excluir&id_funcionario=<%=resultSet.getString("id_cliente") %>&nome_funcionario=<%=resultSet.getString("nome_cliente") %>">Excluir fucionário</a></td>
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
									<a href="?acao=cadastro">Cadastrar novo usuário</a>
									<a href="?acao=relatorio">Gerar relatório</a>
	                            </div>
							</div>
					
						
					<% } %>
						
						</div>
					</div>
				</div>
			</div>
		</main>
</body>
</html>