package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.cadcliente;


@WebServlet({"/cadcliente", "/editafuncionario", "/deleta"})
public class cadastrocliente extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String nome_cliente = request.getParameter("nome_cliente");
		String cpf_cliente = request.getParameter("cpf_cliente");
		String email_cliente = request.getParameter("email_cliente");
		String senha = request.getParameter("senha");
		String telefone_cliente = request.getParameter("telefone_cliente");
	    String nascimento_cliente = request.getParameter("nascimento_cliente");
		int status_cliente = Integer.parseInt(request.getParameter("status_cliente"));
		String role = request.getParameter("role");
		String redirection = request.getParameter("redirection");
		String type = request.getParameter("type");
		
		// mostrar os dados no log //
		// System.out.println(marca);
		// System.out.println(modelo);
		// System.out.println(status_veiculo);
		
		// cadastrar no banco de dados //
		cadcliente dao = new cadcliente();
		
		if("cadastrar".equals(request.getParameter("type"))){
			dao.inserir(nome_cliente, cpf_cliente, email_cliente, senha, telefone_cliente, nascimento_cliente, status_cliente, role);
		}
		else if("editar".equals(request.getParameter("type"))){
			int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
			dao.editar(nome_cliente, cpf_cliente, email_cliente, senha, telefone_cliente, nascimento_cliente, status_cliente, id_cliente);
		}
		else if("excluir".equals(request.getParameter("type"))){
			int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
			dao.excluir(id_cliente);
		}
		
		// redirecionando para o jsp tratar 
		if("admin".equals(request.getParameter("redirection"))){
			RequestDispatcher rd = request.getRequestDispatcher("/cadfuncionario.jsp");
			rd.forward(request,response);
		}
		else if("cliente".equals(request.getParameter("redirection"))){
			RequestDispatcher rd = request.getRequestDispatcher("/login2.jsp");
			rd.forward(request,response);
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("/clientesucesso.jsp");
			rd.forward(request,response);
		}
	}
}