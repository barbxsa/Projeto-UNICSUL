package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DAO;

public class Adm {
	// metodo para inserir no banco //
	public void inserir(String nome_adm, String cpf_adm,  String email_adm, String telefone_adm, String endereco_adm, int status_adm) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO adm (nome_adm, cpf_adm, email_adm, telefone_adm, endereco_adm, status_adm) values (?,?,?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome_adm);
			comando.setString(2, cpf_adm);
			comando.setString(3, email_adm);
			comando.setString(4, telefone_adm);
			comando.setString(5, endereco_adm);
			comando.setInt(6, status_adm);

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

