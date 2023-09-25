package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.DAO;

public class Javabeans {
	// metodo para inserir no banco //
	public void inserir(String marca,String modelo,String fotoveiculo,String cor_veiculo,String portas_veiculo,String km_veiculo,String cilindradas_veiculo,int status_veiculo) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO veiculos (marca_veiculo,modelo_veiculo,fotoveiculo, cor_veiculo, portas_veiculo, cilindradas_veiculo, km_veiculo, status_veiculo) values (?,?,?,?,?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, marca);
			comando.setString(2, modelo);
			comando.setString(3, fotoveiculo);
			comando.setString(4, cor_veiculo);
			comando.setString(5, portas_veiculo);
			comando.setString(6, km_veiculo);
			comando.setString(7, cilindradas_veiculo);
			comando.setInt(8, status_veiculo);

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
	
	public void editar(String marca,String modelo,String fotoveiculo,String cor_veiculo,String portas_veiculo,String km_veiculo,String cilindradas_veiculo,int status_veiculo, int id_veiculo) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "update veiculos set marca_veiculo=?, modelo_veiculo=?, fotoveiculo=?,cor_veiculo=?,portas_veiculo=?,km_veiculo=?,cilindradas_veiculo=?,status_veiculo=? where id_veiculo="+id_veiculo;
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, marca);
			comando.setString(2, modelo);
			comando.setString(3, fotoveiculo);
			comando.setString(4, cor_veiculo);
			comando.setString(5, portas_veiculo);
			comando.setString(6, km_veiculo);
			comando.setString(7, cilindradas_veiculo);
			comando.setInt(8, status_veiculo);

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
	
	
	public void excluir(int id_veiculo) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "delete from veiculos where id_veiculo="+id_veiculo;
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

