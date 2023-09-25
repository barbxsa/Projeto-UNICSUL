package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.Funcionario;


@WebServlet({"/cadfuncionario"})
public class contFuncionario extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		
		String nome_funcionario = request.getParameter("nome_funcionario");
		String cpf_funcionario = request.getParameter("cpf_funcionario");
		String email_funcionario = request.getParameter("email_funcionario");
		String telefone_funcionario = request.getParameter("telefone_funcionario");
		String nascimento_funcionario = request.getParameter("nascimento_funcionario");
		int status_funcionario = Integer.parseInt(request.getParameter("status_funcionario"));
		int id_adm_funcionario = Integer.parseInt(request.getParameter("id_adm_funcionario"));
		
		// mostrar os dados no log //
		// System.out.println(marca);
		// System.out.println(modelo);
		
		// cadastrar no banco de dados //
		Funcionario dao = new Funcionario();
		if("editar".equals(request.getParameter("val_action"))){
			int id_funcionario = Integer.parseInt(request.getParameter("id_funcionario"));
			dao.editar(nome_funcionario, cpf_funcionario, email_funcionario, telefone_funcionario, nascimento_funcionario, status_funcionario, id_funcionario);
		}
		else if("cadastrar".equals(request.getParameter("val_action"))){
		    dao.inserir(nome_funcionario, cpf_funcionario, email_funcionario, telefone_funcionario, nascimento_funcionario, status_funcionario, id_adm_funcionario);
		}
		else if("excluir".equals(request.getParameter("val_action"))){
			int id_funcionario = Integer.parseInt(request.getParameter("id_funcionario"));
		    dao.excluir(id_funcionario);
		}
				
		// redirecionando para o jsp tratar 
		RequestDispatcher rd = request.getRequestDispatcher("/cadfuncionario.jsp");
		rd.forward(request,response);
	}
}