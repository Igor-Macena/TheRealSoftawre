<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>

<head>
	<!-- Fonts -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">

	<!-- Caracteres especias em jsp -->
	<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<title>TRS - Consulta</title>

	<!-- CSS Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width" />
	<!-- JS Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			$("#pesquisa").on("keyup", function() { 
    	var value = $(this).val().toLowerCase(); // pega o valor do input
    	$("#tabela tr").filter(function() { // filtra o valor
    		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    	});
    });
		});
	</script>

	<style type="text/css">
		.navbar-dark{
			background-color: black;
		};
		#menos{
		}
		@media only screen and (max-width: 600px) {
			#menos{
				font-size: 10pt;
			}
		};
		</style>

	</head>
	<body class="bg-dark text-light">
		<%

	// cria as variaveis para acesso ao banco de dados
		//String banco = "nome do banco de dados" ;
		//String url = "minha url" + banco ;
		//String usuario = "usuario" ;
		//String senha   = "senha" ;
		String driver  =  "com.mysql.jdbc.Driver" ; // driver

	// carregar o driver na memoria
		Class.forName( driver ) ;

	// variavel de conexao 
		Connection conexao ;

	// abre a conexao com o banco de dados
		conexao = DriverManager.getConnection( url, usuario , senha ) ;

		String sql = "select * from pedido";

		Statement stm = conexao.createStatement() ;

	//variavel para armazenar as informações
	//que vem do banco de dados 
		ResultSet dadosPedido = stm.executeQuery( sql ) ;
		%>
		<!-- Menu -->
		<nav class="form-row navbar navbar-expand-lg navbar-dark text-center">
			<a class="navbar-brand">
				<img src="img/TRS.png" alt="imagem do logo da empresa" 
				style="width: 8em; border-radius: 0.5em;"
				class="img-fluid" /></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<!-- Links -->
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item content-center">
							<a class="nav-link h1 text-center" style="color: blue;">
								<i class="fas fa-search"></i> Consulta</a>
							</li>
						</ul>
						<ul class="navbar-nav ml-auto">
							<li class="nav-item">
								<a class="nav-link h1 text-center" style="color: red;" href="home.html">
									Sair <i class="fas fa-sign-out-alt"></i></a>
								</li>
							</ul>
						</div>
					</nav>

	<input class="form-control" id="pesquisa" type="text" placeholder="Pesquisar...">
	<div class="table-responsive-md">
		<table class="table table-bordered table-striped">
			<thead style="background-color: rgba(0,0,0,0.6);">
				<tr>
				<td>Codigo</td>
				<td>Nome</td>
				<td>Email</td>
				<td>Assunto</td>
				<td>Descrição</td>
				</tr>
				<thead>
			<tbody id="tabela">
				<%
				while( dadosPedido.next() )
					{
				%><tr>
					<td><%
					out.print( dadosPedido.getString("codped") ) ;
				%></td><%

				%><td id="menos"><%
					out.print( dadosPedido.getString("nome") ) ;
					%></td><%

				%><td id="menos"><%
					out.print( dadosPedido.getString("email") ) ;
					%></td><%

				%><td id="menos"><%
					out.print( dadosPedido.getString("assunto") ) ;
					%></td><%

				%><td id="menos"><%
					out.print( dadosPedido.getString("descricao") ) ;
					%></td>
					</tr><%
						}
					%></tbody>
				</table>
			</div>
					<%

			stm.close();
			conexao.close();

			%>
	</body>
</html>