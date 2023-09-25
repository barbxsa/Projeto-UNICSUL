package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DAO;

public class Fornecedores {
	// metodo para inserir no banco //
	public void inserir(String nome_fornecedor, String cnpj_fornecedor,  String endereco_fornecedor, int status_fornecedor) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO fornecedores (nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, status_fornecedor) values (?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome_fornecedor);
			comando.setString(2, cnpj_fornecedor);
			comando.setString(3, endereco_fornecedor);
			comando.setInt(4, status_fornecedor);

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
	
	public void alterar(String nome_fornecedor, String cnpj_fornecedor,  String endereco_fornecedor, int status_fornecedor, int id_fornecedor) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "Update fornecedores set nome_fornecedor=?, cnpj_fornecedor=?, endereco_fornecedor = ?, status_fornecedor=? where id_fornecedor="+id_fornecedor;
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome_fornecedor);
			comando.setString(2, cnpj_fornecedor);
			comando.setString(3, endereco_fornecedor);
			comando.setInt(4, status_fornecedor);

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
	
	public void excluir(String nome_fornecedor, String cnpj_fornecedor,  String endereco_fornecedor, int status_fornecedor, int id_fornecedor) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "delete from fornecedores where id_fornecedor="+id_fornecedor;
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

