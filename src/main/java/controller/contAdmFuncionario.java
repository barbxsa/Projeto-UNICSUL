package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.admFuncionario;


@WebServlet({"/alteruser", "/cancelarvisita"})
public class contAdmFuncionario extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		//String endereco_adm = request.getParameter("endereco_adm");
		
		// mostrar os dados no log //
		// System.out.println(marca);
		// System.out.println(modelo);
		// System.out.println(status_veiculo);
		
		// cadastrar no banco de dados //
		if("altcliente".equals(request.getParameter("type"))){
			int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
			int status_cliente = Integer.parseInt(request.getParameter("status_cliente"));
		
			admFuncionario dao = new admFuncionario();
			dao.alterar(status_cliente, id_cliente);
			
			RequestDispatcher rd = request.getRequestDispatcher("/cadcliente.jsp");
			rd.forward(request,response);
		}
		else if("cancelarvisita".equals(request.getParameter("type"))){
			int id_visita = Integer.parseInt(request.getParameter("id_visita"));
			
			admFuncionario dao = new admFuncionario();
			dao.cancelar(id_visita);
			
			RequestDispatcher rd = request.getRequestDispatcher("/listaagenda.jsp");
			rd.forward(request,response);
		}
		// redirecionando para o jsp tratar 

	}
}