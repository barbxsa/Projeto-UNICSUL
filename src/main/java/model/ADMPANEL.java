package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.DAO;

public class ADMPANEL {

	public void editCli_adm(int id_cliente, int status_cliente) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");
			int id_cliente_get = id_cliente;
			// preparando a sql //
			String sql = "Update cliente set status_cliente = ?  where id_cliente="+id_cliente_get;
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setInt(1, status_cliente);


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

	public void vender(int id_veiculo, String cpf_cliente) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/alpis_base";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");
			// preparando a sql //
			String sql = "insert into compra (id_veiculo_compra, id_cliente_compra, status_compra) values (?, (select id_cliente from cliente where cpf_cliente = ? ), 0)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setInt(1, id_veiculo);
			comando.setString(2,cpf_cliente);


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

