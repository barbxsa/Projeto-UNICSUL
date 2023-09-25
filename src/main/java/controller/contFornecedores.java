package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.Fornecedores;


@WebServlet({"/cadfornecedor", "/editarfornecedor", "/deleta_fornecedor"})
public class contFornecedores extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nome_fornecedor = request.getParameter("nome_fornecedor");
		String cnpj_fornecedor = request.getParameter("cnpj_fornecedor");
		String endereco_fornecedor = request.getParameter("endereco_fornecedor");
		int status_fornecedor = Integer.parseInt(request.getParameter("status_fornecedor"));
		
		// mostrar os dados no log //
		// System.out.println(marca);
		// System.out.println(modelo);
		// System.out.println(status_veiculo);
		
		// cadastrar no banco de dados //
		Fornecedores dao = new Fornecedores();
		if("cadastrar".equals(request.getParameter("val_action"))){
			dao.inserir(nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, status_fornecedor);
		}		
		else if("editar".equals(request.getParameter("val_action"))){
			int id_fornecedor = Integer.parseInt(request.getParameter("id_fornecedor"));
			dao.alterar(nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, status_fornecedor, id_fornecedor);
		}
		else if("excluir".equals(request.getParameter("val_action"))){
			int id_fornecedor = Integer.parseInt(request.getParameter("id_fornecedor"));
			dao.excluir(nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, status_fornecedor, id_fornecedor);
		}
		// redirecionando para o jsp tratar 
		RequestDispatcher rd = request.getRequestDispatcher("/fornecedorsucesso.jsp");
		rd.forward(request,response);
	}
}