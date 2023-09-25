package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DAO;

public class Visita {
	// metodo para inserir no banco //
	public void inserir(int status_visita, int id_visita) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "update visita set status_visita = ? where id_visita = ?";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setInt(1, status_visita);
			comando.setInt(2, id_visita);

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

