<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
</head>
	<body>
	
	
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    
<%  
			String profile_msg=(String)request.getAttribute("profile_msg");  
			if(profile_msg!=null){  
				out.print(profile_msg);  
			}  
			String login_msg=(String)request.getAttribute("login_msg");  
			if(login_msg!=null){  
				out.print(login_msg);  
			}  
		 %>  
    <!-- Login Form -->
    <form method="post" action="opracao.jsp">
      <input type="text" id="login" class="fadeIn second" name="email" placeholder="Login">
      <input type="password" id="password" class="fadeIn third" name="pass" placeholder="Senha">
      <input type="submit" class="fadeIn fourth" value="Entrar">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="cadcliente.jsp">Não tem conta? Cadastre-se</a>
    </div>

  </div>
</div>

	
		
	  
	</body>
</html>