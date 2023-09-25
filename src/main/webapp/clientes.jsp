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
							<table class="table">
					<thead>
						<tr>
							<td>Nome</td>
							<td>Telefone</td>
							<td>CPF</td>
							<td>Status do cliente</td>
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
			String sql = "select * from cliente where role='Cliente'";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>			
			
			
						<tr>
							<td><%=resultSet.getString("nome_cliente") %></td>
							<td><%=resultSet.getString("telefone_cliente") %></td>
							<td><%=resultSet.getString("cpf_cliente") %></td>
							<td><% if("0".equals(resultSet.getString("status_cliente"))){ out.println("Ativo"); }else{out.println("Inativo");}  %></td>
							<td>
								<form action="altcliente" method="post" style="display:flex;align-itens:center;">
									<input type="hidden" name="type" value="altcliente">
									<input type="hidden" name="id_cliente" value=<%=resultSet.getString("id_cliente") %>>
									<div class="sidexforM">
										Alterar status
										<select name="status_cliente">
											<option value="0">Ativo</option>
											<option value="1">Inativo</option>
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
				</div>
			</div>
		</main>  
	</body>
</html>