package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.Visita;


@WebServlet("/altvisita")
public class contVisita extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id_visita = Integer.parseInt(request.getParameter("id_visita"));
		int status_visita = Integer.parseInt(request.getParameter("status_visita"));


		
		// mostrar os dados no log //
		// System.out.println(marca);
		// System.out.println(modelo);
		// System.out.println(status_veiculo);
		
		// cadastrar no banco de dados //
		Visita dao = new Visita();
		dao.inserir(id_visita, status_visita);
				
		// redirecionando para o jsp tratar 
		RequestDispatcher rd = request.getRequestDispatcher("scsVisita.jsp");
		rd.forward(request,response);
	}
}