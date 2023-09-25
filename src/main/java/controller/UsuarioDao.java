package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {

	public List<Usuario> obtenerUsuarios(){
		List<Usuario> lista = new ArrayList<Usuario>();
		try {
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(URL, "root", "root");

		
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM cliente");
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setEmail(rs.getString("email_cliente"));
				usuario.setPass(rs.getString("senha"));
				lista.add(usuario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return lista;
	}

	public Usuario obtenerUsuario(String email){
		Usuario usuario = null;
		try {
			
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(URL, "root", "root");

			
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM cliente WHERE email_cliente = ? ");
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				usuario = new Usuario();
				usuario.setEmail(rs.getString("email_cliente"));
				usuario.setPass(rs.getString("senha"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return usuario;
	}
}
