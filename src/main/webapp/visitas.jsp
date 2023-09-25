<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
</head>
	<body>
	
		
		<div class="center-adm">
			<div class="title-admin">
				<h2>Visitas agendadas</h2>
			</div>
			<div class="table-admin">
				<table class="table">
					<thead>
						<tr>
							<td>Marca/Modelo</td>
							<td>Cliente</td>
							<td>Telefone cliente</td>
							<td>Horário visita</td>
							<td>Status visita</td>
							<td>Alterar status</td>
						</tr>
					</thead>
					<tbody>
					<%
					

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
			String sql = "SELECT su.id_visita as id_visita, su.id_veiculo_visita as id_veiculo_visita, su.cpf_cliente as cpf_cliente,su.status_visita as status_visita, su.horario_visita as horario_visita, t.cpf_cliente as cpf_cliente, t.nome_cliente as nome_cliente, t.telefone_cliente as telefone_cliente,f.id_veiculo as id_veiculo, f.marca_veiculo as marca_veiculo, f.modelo_veiculo as modelo_veiculo FROM visita su JOIN cliente AS t ON t.cpf_cliente = su.cpf_cliente JOIN veiculos f ON f.id_veiculo = su.id_veiculo_visita";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>			
			
			
						<tr>
							<td><%=resultSet.getString("marca_veiculo") %>/<%=resultSet.getString("modelo_veiculo") %></td>
							<td><%=resultSet.getString("nome_cliente") %></td>
							<td><%=resultSet.getString("telefone_cliente") %></td>
							<td><%=resultSet.getString("horario_visita") %></td>
							<td><% if("0".equals(resultSet.getString("status_visita"))){ out.println("Pendente"); }  %></td>
							<td>
								<form action="altvisita" method="post" style="display:flex;align-itens:center;">
									<input type="hidden" name="id_visita" value=<%=resultSet.getString("id_visita") %>>
									<div class="sidexforM">
										Alterar status
										<select name="status_visita">
											<option value="0">Pendente</option>
											<option value="1">Aprovada</option>
											<option value="2">Cancelada</option>
										</select>
									</div>
									<button type="submit">Alterar</button>
								
								</form>
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
		</div>
	
		
	  
	</body>
</html>