<html>
<%@page import="controller.LoginController"%>  
<%@page import="model.UsuarioDto"%>  
<jsp:useBean id="obj" class="model.UsuarioDto"/>  
<jsp:setProperty property="*" name="obj"/>  

<%  
	UsuarioDto usuario = new UsuarioDto();
	boolean status=LoginController.validate(obj);
	if(status){  
%>
Acessou!
<a href="agendamento.jsp">Fazer agendamento</a>
<% 
	session.setAttribute("session","TRUE");  
	} else {  
%>
	
	<h2 style=" text-align: center; width: 100%; position: absolute; color: red; ">Login ou senha incorretos!</h2>
	
	<%
		%>  
		<jsp:include page="login.jsp"></jsp:include>  
		<%
	}  
%>
</html>