package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DAO;

public class Funcionario {
	// metodo para inserir no banco //
	public void inserir(String nome_funcionario, String cpf_funcionario,  String email_funcionario,String telefone_funcionario,  String nascimento_funcionario, int status_funcionario, int id_adm_funcionario) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO funcionarios (nome_funcionario,  cpf_funcionario,   email_funcionario, telefone_funcionario,   nascimento_funcionario,  status_funcionario,  id_adm_funcionario) values (?,?,?,?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome_funcionario);
			comando.setString(2, cpf_funcionario);
			comando.setString(3, email_funcionario);
			comando.setString(4, telefone_funcionario);
			comando.setString(5, nascimento_funcionario);
			comando.setInt(6, status_funcionario);
			comando.setInt(7, id_adm_funcionario);

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
	public void editar (String nome_funcionario, String cpf_funcionario,  String email_funcionario,String telefone_funcionario,  String nascimento_funcionario, int status_funcionario, int id_funcionario) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");
			int consutId_funionario = id_funcionario;
			// preparando a sql //
			String sql = "Update funcionarios set nome_funcionario=?,cpf_funcionario=?,email_funcionario=?, telefone_funcionario=?, nascimento_funcionario=?, status_funcionario=? where id_funcionario="+consutId_funionario;
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome_funcionario);
			comando.setString(2, cpf_funcionario);
			comando.setString(3, email_funcionario);
			comando.setString(4, telefone_funcionario);
			comando.setString(5, nascimento_funcionario);
			comando.setInt(6, status_funcionario);

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
	
	public void excluir (int id_funcionario) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");
			int consutId_funionario = id_funcionario;
			// preparando a sql //
			String sql = "delete from funcionarios where id_funcionario="+consutId_funionario;
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

