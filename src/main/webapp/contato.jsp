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
    <link rel="shortcut icon" href="assets/svg/icon-car.svg" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="style-site.css">
    <title>ALPIS - Contato</title>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="nav flex">
                        <div class="logo">
                            <img src="assets/svg/icon-car.svg" alt="">
                        </div>
                        <nav class="pages">
                            <ul class="flex">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="automoveis.jsp">Veículos</a></li>
                                <li><a href="sobre.jsp">Sobre</a></li>
                                <li><a href="contato.jsp">Contato</a></li>
                            </ul>
                        </nav>
                        <div class="login flex btn-default">
                            <a href="login.jsp" class="">Cadastre-se</a>
                            <a href="login.jsp" class="yellow">Login</a>
                        </div>
                        <div class="menu-mobile">
                            <a href="javascript:void(0);" class="menu flex">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-animation">
            <nav class="pages-opened">
                <ul class="flex">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="automoveis.jsp">Veículos</a></li>
                    <li><a href="sobre.jsp">Sobre</a></li>
                    <li><a href="contato.jsp">Contato</a></li>
                </ul>
            </nav>
            <div class="pages-policy flex">
                <a href="javascript:void(0);">Instagram</a>
                <a href="javascript:void(0);">Facebook</a>
                <a href="javascript:void(0);">Whatsapp</a>
            </div>
        </div>
    </header>
    
    <main class="webbanner flex" style="background: url(assets/img/car6.jpg) no-repeat left; background-size: cover;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="banner font">
                        <div class="head-desc ">
                            <span>Toda ajuda que precisar.</span>
                            <h1>Fale com <br>a gente<e>!</e></h1>
                        </div>
                        <div class="content-desc flex">
                            <div class="desc">
                                <p>
                                    A Alpis é 100% transparente com os compradores <br>
                                    e vendedores de automóveis, passando como informações <br>
                                    pertinentes a compra e sobre os veículos.
                                </p>
                            </div>
                        </div>
                        <!-- <div class="btn-default agendar">
                            <a href="automoveis.jsp">Visite já!</a>
                            <i></i>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </main>

    <section class="aba2" id="contato">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="flex font">
                        <div class="aside-70">
                            <div class="head-desc">
                                <h2>Formulário de contato</h2>
                            </div>
                        </div>
                    </div>
                    <div class="contact flex font">
                        <div class="aside-70">
                            <div class="head-desc">
                                <form action="" class="contact-form">
                                    <input type="text" placeholder="Nome">
                                    <input type="email" placeholder="E-mail">
                                    <input type="text" placeholder="Telefone">
                                    <input type="text" placeholder="Assunto">
                                    <textarea name="" id="" cols="30" rows="10" placeholder="Descrição"></textarea>
                                    <div class="btn-default">
                                        <a href="mailto:cristovom123@gmail.com">Enviar</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="aside-30 quote">
                            <img src="assets/svg/contact.svg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="nav-foot flex font">
                        <div class="logo-foot aside-30">
                            <img src="assets/svg/icon-car.svg" alt="">
                            <div class="content-desc">
                                <p>
	                                A Alpis é 100% transparente com os compradores
									e vendedores de automóveis, passando como informações
									pertinentes a compra e sobre os veículos.
								</p>
                            </div>
                        </div>
                        <nav class="page-link flex aside-70">
                            <ul>
                                <h4>Navegação</h4>
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="automoveis.jsp">Veículos</a></li>
                                <li><a href="sobre.jsp">Sobre</a></li>
                                <li><a href="contato.jsp">Contato</a></li>
                            </ul>
                            <ul>
                                <h4>Suporte</h4>
                                <li><a href="sobre.jsp">Sobre</a></li>
                                <li><a href="contato.jsp">Contato</a></li>
                            </ul>
                            <ul>
                                <h4>Políticas</h4>
                                <li><a href="javacript:void(0);">Privacidade</a></li>
                                <li><a href="javacript:void(0);">Termos de uso</a></li>
                                <li><a href="javacript:void(0);">FAQ</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="footer-end flex font">
                        <div class="rights">
                            <p>
                                Todos os direitos reservados ©
                            </p>
                        </div>
                        <div class="pages-policy flex">
                            <a href="javascript:void(0);">Política de Privacidade</a>
                            <a href="javascript:void(0);">Termos de uso</a>
                            <a href="javascript:void(0);">FAQ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="https://code.jquery.com/jquery-3.6.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>