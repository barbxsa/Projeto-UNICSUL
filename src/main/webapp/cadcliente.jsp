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
                     <div class="fonts title-table">
                            <h1>Relatório da tabela</h1>
                        </div>

                        <div class="table-bd fonts">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Nome</td>
                                        <td>CPF</td>
                                        <td>Telefone</td>
                                        <td>Status</td>
                                        <td>Alterar status</td>
                                    </tr>
                                    <%
		
										try{ 
											connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
											statement=connection.createStatement();
											String sql = "SELECT * from cliente where role='Cliente'";
											resultSet = statement.executeQuery(sql);
											while(resultSet.next()){
									%>	
                                    <tr>
                                        <td><%=resultSet.getString("nome_cliente") %></td>
                                        <td><%=resultSet.getString("cpf_cliente") %></td>
                                        <td><%=resultSet.getString("telefone_cliente") %></td>
                                        <td><%=resultSet.getString("status_cliente") %></td>
                                        <td>
                                       		<form method="post" action="alteruser">
                                       			<input type="hidden" value="altcliente" name="type">
                                       			<input type="hidden" value=<%=resultSet.getString("id_cliente") %> name="id_cliente">
                                       			Mudar status
                                       			<select name="status_cliente">
                                       				<option value="0">Ativo</option>
                                       				<option value="1">Inativo</option>
                                       			</select>
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