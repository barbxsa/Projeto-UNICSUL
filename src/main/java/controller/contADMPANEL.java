package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.ADMPANEL;


@WebServlet({"/altcliente", "/vender"})
public class contADMPANEL extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		

		
		// mostrar os dados no log //
		// System.out.println(marca);
		// System.out.println(modelo);
		
		// cadastrar no banco de dados //
		ADMPANEL dao = new ADMPANEL();
		if("altcliente".equals(request.getParameter("type"))){
			int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
			int status_cliente = Integer.parseInt(request.getParameter("status_cliente"));
			dao.editCli_adm(id_cliente, status_cliente);
			RequestDispatcher rd = request.getRequestDispatcher("/clientes.jsp");
			rd.forward(request,response);
		}
				
		else if("vender".equals(request.getParameter("type"))){
			int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
			String cpf_cliente = request.getParameter("cpf_cliente");
			dao.vender(id_veiculo, cpf_cliente);
			RequestDispatcher rd = request.getRequestDispatcher("/vendas.jsp");
			rd.forward(request,response);
		}
		
		// redirecionando para o jsp tratar 
		
	}
}