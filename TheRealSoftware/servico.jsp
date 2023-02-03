<%@page language="java" import="java.sql.*" 
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>" %>
<%
	// variaveis que armazena o conteudo inserido pelo usuario
 	request.setCharacterEncoding("UTF-8");
	String 	vnome 	= request.getParameter("txtnome");
	String 	vemail 	= request.getParameter("txtemail");
	String 	vassunto 	= request.getParameter("txtassunto");
	String 	vdescricao 	= request.getParameter("txtdescricao");

	// variaveis de acesso ao db
	//String banco = "Nome do BD" ;
	//String url = "url do BD"+banco ;
	//String usuario = "Usuario" ;
	//String senha   = "Senha" ;
	String driver  =  "com.mysql.jdbc.Driver" ; // Driver

	// carrega o driver na memoria
	Class.forName(driver);

	// variavel de conexao
	Connection conexao;

	// abre a conexao com o db
	conexao = DriverManager.getConnection( url, usuario , senha ) ;

	String sql = "insert into pedido (nome,email,assunto,descricao) values('" + vnome + "','" + vemail + "','" + vassunto + "','" + vdescricao + "')";

	Statement stm = conexao.createStatement(); // cria mecanismo que dispara comandos sql

	stm.executeUpdate(sql); // comando a ser salvo

	stm.close();// fechando
	conexao.close();

	// response.sendRedirect("-- url -- /( -- banco de dados -- /consulta.jsp");
	
%>