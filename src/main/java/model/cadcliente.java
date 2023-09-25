package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DAO;

public class cadcliente {
	// metodo para inserir no banco //
	public void inserir(String nome_cliente, String cpf_cliente,  String email_cliente, String senha, String telefone_cliente,  String nascimento_cliente, int status_cliente, String role) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO cliente (nome_cliente, cpf_cliente, email_cliente, senha, telefone_cliente, nascimento_cliente, status_cliente, role) values (?,?,?,?,?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome_cliente);
			comando.setString(2, cpf_cliente);
			comando.setString(3, email_cliente);
			comando.setString(4, senha);
			comando.setString(5, telefone_cliente);
			comando.setString(6, nascimento_cliente);
			comando.setInt(7, status_cliente);
			comando.setString(8, role);

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
	
	
	public void editar (String nome_cliente, String cpf_cliente,  String email_cliente, String senha, String telefone_cliente,  String nascimento_cliente, int status_cliente, int id_cliente) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");
			int consutId_funionario = id_cliente;
			// preparando a sql //
			String sql = "Update cliente set nome_cliente=?,cpf_cliente=?,email_cliente=?, telefone_cliente=?, nascimento_cliente=?, status_cliente =? where id_cliente="+consutId_funionario;
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome_cliente);
			comando.setString(2, cpf_cliente);
			comando.setString(3, email_cliente);
			comando.setString(4, telefone_cliente);
			comando.setString(5, nascimento_cliente);
			comando.setInt(6, status_cliente);

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
	
	public void excluir (int id_cliente) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");
			int consutId_funionario = id_cliente;
			// preparando a sql //
			String sql = "delete from cliente where id_cliente="+consutId_funionario;
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

