<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						
							
					<section class="dashboard fonts">
                        <div class="flex">
                            <div class="desc">
                                <h1>Preencha com seus dados</h1>
                            </div>
                            <!-- <div class="search-base">
                                <input class="search" type="text" placeholder="Pesquise" />
                                <i></i>
                            </div> -->
                        </div>
                        <div class="form fonts">
							<form action="cadcliente">
								<input type="hidden" name="val_action" value="cadastrar">
								<input type="hidden" name="redirection" value="cliente">
								<input type="hidden" name="role" value="Cliente">
								<input type="hidden" name="type" value="cadastrar">
								
								
								<input required type="text" name="nome_cliente" placeholder="Nome">
								<input required type="text" name="cpf_cliente" placeholder="CPF">
								<input required type="email" name="email_cliente" placeholder="E-mail">
								<input required type="text" name="senha" placeholder="Senha">
								<input required type="tel" name="telefone_cliente" placeholder="Telefone">
								<input required type="date" name="nascimento_cliente" placeholder="Data">
								<select style="display:none" name="status_cliente">
									<option value="0">Ativo</option>
									<option value="1">Inativo</option>
								</select>
																
								<div class="btn-crud flex">
	                                <input type="submit" value="Cadastrar" name="btn" class="btn-success" id="btnCadastrar">
	                            </div>
							</form>
						</div>
					</section>
					
						
						</div>
				</div>
			</div>
		</div>
	</main>

        
    </body>
</html>