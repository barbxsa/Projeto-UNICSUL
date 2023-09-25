package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAO;
import model.Javabeans;


@WebServlet({"/cadveiculo", "/editaveiculo", "/apagaveiculo"})
public class Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		
		
		// cadastrar no banco de dados //
		if("cadastrar".equals(request.getParameter("type"))){
			// obtendo dados //
			String marca = request.getParameter("marca_veiculo");
			String modelo = request.getParameter("modelo_veiculo");
			String fotoveiculo = request.getParameter("fotoveiculo");
			String cor_veiculo = request.getParameter("cor_veiculo");
			String portas_veiculo = request.getParameter("portas_veiculo");
			String km_veiculo = request.getParameter("km_veiculo");
			String cilindradas_veiculo = request.getParameter("cilindradas_veiculo");
			int status_veiculo = Integer.parseInt(request.getParameter("status_veiculo"));
			Javabeans dao = new Javabeans();
			dao.inserir(marca, modelo, fotoveiculo, cor_veiculo, portas_veiculo, km_veiculo, cilindradas_veiculo, status_veiculo);
		}
		else if("editar".equals(request.getParameter("type"))){
			// obtendo dados //
			String marca = request.getParameter("marca_veiculo");
			String modelo = request.getParameter("modelo_veiculo");
			String fotoveiculo = request.getParameter("fotoveiculo");
			String cor_veiculo = request.getParameter("cor_veiculo");
			String portas_veiculo = request.getParameter("portas_veiculo");
			String km_veiculo = request.getParameter("km_veiculo");
			String cilindradas_veiculo = request.getParameter("cilindradas_veiculo");
			int status_veiculo = Integer.parseInt(request.getParameter("status_veiculo"));
			int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
			Javabeans dao = new Javabeans();
			dao.editar(marca, modelo, fotoveiculo, cor_veiculo, portas_veiculo, km_veiculo, cilindradas_veiculo, status_veiculo, id_veiculo);
		}
		else if("excluir".equals(request.getParameter("type"))){
			int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
			Javabeans dao = new Javabeans();
			dao.excluir(id_veiculo);
		}
		// redirecionando para o jsp tratar 
		RequestDispatcher rd = request.getRequestDispatcher("/veiculos.jsp");
		rd.forward(request,response);
	}
}