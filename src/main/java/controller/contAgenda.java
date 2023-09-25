package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.Agenda;


@WebServlet({"/cadvisita", "/altervisita"})
public class contAgenda extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// obtendo dados //
		int id_veiculo_visita = Integer.parseInt(request.getParameter("id_veiculo_visita"));
		String horario_visita = request.getParameter("horario_visita");
		int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
		int status_visita = Integer.parseInt(request.getParameter("status_visita"));
		
		// cadastrar no banco de dados //
		if("agendar".equals(request.getParameter("type"))){
			Agenda dao = new Agenda();
			dao.inserir(id_veiculo_visita, horario_visita, id_cliente, status_visita);
		}
		else if("cancelarvisita".equals(request.getParameter("type"))){
			int id_visita = Integer.parseInt(request.getParameter("id_visita"));
			Agenda dao = new Agenda();
			dao.inserir(id_visita);
		}
		// redirecionando para o jsp tratar 
		RequestDispatcher rd = request.getRequestDispatcher("/clientehome.jsp");
		rd.forward(request,response);
	}
}