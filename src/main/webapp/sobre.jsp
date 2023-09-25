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
    <title>ALPIS - Sobre</title>
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

    <main class="webbanner flex" style="background: url(assets/img/car7.jpg) no-repeat right; background-size: cover;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="banner font">
                        <div class="head-desc ">
                            <span>ALPIS é diferente<e>!</e></span>
                            <h1>Sobre a<br>ALPIS<e>.</e></h1>
                        </div>
                        <div class="content-desc flex">
                            <div class="desc">
                                <p>
                                    A Alpis se trata de um projeto desenvolvido para ser diferente <br>
                                    aos seus concorrentes de mercado, tendo seus diferenciais <br>
                                    adicionais como fácil acesso, facilidade na procura dos veículos, <br>
                                    ambiente familiar, entre outros.
                                </p>
                            </div>
                        </div>
                        <div class="btn-default agendar">
                            <a href="sobre.jsp#localiza">Localização</a>
                            <i></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <section class="aba1">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="about font center">
                        <div class="head-desc">
                            <h2>Nossa História</h2>
                            <p>Um pouco da nossa mentalidade.</p>
                        </div>
                        <div class="cards flex">
                            <div class="item">
                                <i></i>
                                <h4>Missão</h4>
                                <p>Nossa missão é ser diferente, realizar a conexão entre o cliente e a empresa de forma orgânica e harmônica, com uma experiência facilitada e rápida.</p>
                            </div>
                            <div class="item">
                                <i></i>
                                <h4>Visão</h4>
                                <p>Nossa visão se baseia na relação entre o cliente e empresa, trazendo a familiaridade e conexão ao mercado de imóveis.</p>
                            </div>
                            <div class="item">
                                <i></i>
                                <h4>Valores</h4>
                                <p>Nossos valores são baseados na ética, na facilidade e na integridade social e profissional, esses resumem nossa forma de trabalho e de atendimento.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="aba2" id="localiza">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="flex font">
                        <div class="aside-70">
                            <div class="head-desc">
                                <h2>Nós conheça<br>presencialmente<e>.</e></h2>
                            </div>
                        </div>
                        <div class="aside-30">
                            <div class="content-desc">
								<!-- <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti, labore ipsa libero doloremque officia ea quod.</p> -->
                            </div>
                        </div>
                    </div>
                    <div class="flex font">
                        <div class="aside-70">
                            <div class="head-desc">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3659.885691538707!2d-46.532131785023964!3d-23.464587384731075!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cef55aec246217%3A0xecfcfda0d70c8c9a!2sUniversidade%20Cruzeiro%20do%20Sul!5e0!3m2!1spt-BR!2sbr!4v1667783939993!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                        <div class="aside-30 quote">
                            <div class="content-desc">
                                <h3>Agende sua visita<e>.</e></h3>
                                <p>Temos um tempo reservado para você.</p>
                            </div>
                            <div class="features flex">
                                <div class="feature">
                                    <span>RG</span>
                                    <p><b>Necessário.</b></p>
                                </div>
                                <div class="feature">
                                    <span>CNH</span>
                                    <p><b>Necessário.</b></p>
                                </div>
                                <div class="feature">
                                    <span>BANCO</span>
                                    <p><b>Necessário.</b></p>
                                </div>
                                <div class="feature">
                                    <span>PROFISSÃO</span>
                                    <p><b>Necessário.</b></p>
                                </div>
                            </div>
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