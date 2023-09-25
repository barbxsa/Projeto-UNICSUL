package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DAO;

public class Agenda {
	// metodo para inserir no banco //
	public void inserir(int id_veiculo_visita, String horario_visita, int id_cliente, int status_visita) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO visita (id_veiculo_visita, horario_visita, id_cliente_atrelado, status_visita) values (?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setInt(1, id_veiculo_visita);
			comando.setString(2, horario_visita);
			comando.setInt(3, id_cliente);
			comando.setInt(4, status_visita);
			// executando sql //
			comando.executeUpdate();

			// fechando
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}
	}
	
	public void inserir(int id_visita) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "update visita set status_visita = 0 where id_visita="+id_visita;
			PreparedStatement comando = con.prepareStatement(sql);
			// executando sql //
			comando.executeUpdate();

			// fechando
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}
	}
}

