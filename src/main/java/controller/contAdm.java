package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.Adm;


@WebServlet("/cadadm")
public class contAdm extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String nome_adm = request.getParameter("nome_adm");
		String cpf_adm = request.getParameter("cpf_adm");
		String email_adm = request.getParameter("email_adm");
		String telefone_adm = request.getParameter("telefone_adm");
		String endereco_adm = request.getParameter("endereco_adm");
		int status_adm = Integer.parseInt(request.getParameter("status_adm"));
		
		// mostrar os dados no log //
		// System.out.println(marca);
		// System.out.println(modelo);
		// System.out.println(status_veiculo);
		
		// cadastrar no banco de dados //
		Adm dao = new Adm();
		dao.inserir(nome_adm, cpf_adm, email_adm, telefone_adm, endereco_adm, status_adm);
				
		// redirecionando para o jsp tratar 
		RequestDispatcher rd = request.getRequestDispatcher("/fornecedorsucesso.jsp");
		rd.forward(request,response);
	}
}