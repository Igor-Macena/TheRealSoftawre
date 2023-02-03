<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String 	varnome 	= request.getParameter("nome")	;
	String 	varsenha 	= request.getParameter("senha")	;

	// cria as variaveis para acesso ao banco de dados
	//String banco = "Nome do BD" ;
	//String url = "url do BD"+banco ;
	//String usuario = "Usuario" ;
	//String senha   = "Senha" ;
	String driver  =  "com.mysql.jdbc.Driver" ; // Driver

	// carregar o driver na memoria
	Class.forName( driver ) ;

	// variavel de conexao 
	Connection conexao ;

	// abre a conexao com o banco de dados
	conexao = DriverManager.getConnection( url, usuario , senha );

	String sql = "SELECT nome, senha FROM logar where nome = '" + varnome + "'";

	Statement stm = conexao.createStatement() ;

	//variavel para armazenar as informações
	//que vem do banco de dados 
	ResultSet dadosLogin = stm.executeQuery( sql );

	while (dadosLogin.next()){
		String vnome = dadosLogin.getString("nome")		;
		String vsenha = dadosLogin.getString("senha")	;

		if(varsenha.equals(vsenha) && varnome.equals(vnome)){
			// response.sendRedirect("-- url -- /( -- banco de dados -- /consulta.jsp");
		}
		else{
		%><script type="text/javascript">
		alert("Nome ou senha invalido");
		</script>
		<%
		}

	};
	stm.close();
	conexao.close();
%>
<!-- <meta http-equiv="refresh" content="0; -- url -- / -- Nome -- /login.html"></meta> -->