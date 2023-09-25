package dao;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import bean.LoginBean;
import model.DBConnection;
 
class Customer {
    public Customer() {};
    private int id_cliente;
    private String nome_cliente;
    private String email_cliente;
    private int senha;
    private int role;
}

public class LoginDao {
 
public String authenticateUser(LoginBean loginBean){
    String userName = loginBean.getUserName();
    String password = loginBean.getPassword();
 
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
 
    String idclientDB = "";
    String userNameDB = "";
    String passwordDB = "";
    String roleDB = "";
    String nomeDB = "";
    
    try 
    {
        con = DBConnection.createConnection();
        statement = con.createStatement();
        resultSet = statement.executeQuery("select id_cliente, nome_cliente, email_cliente, senha,role from cliente");
 
        while(resultSet.next())
        {
        	idclientDB = resultSet.getString("id_cliente");
            userNameDB = resultSet.getString("email_cliente");
            passwordDB = resultSet.getString("senha");
            roleDB = resultSet.getString("role");
            nomeDB = resultSet.getString("nome_cliente");
                     
            if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Admin")) {
                  return idclientDB+","+roleDB+","+nomeDB+","+userNameDB;
            }
            else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Funcionario")) {
                return idclientDB+","+roleDB+","+nomeDB+","+userNameDB;

            }
            else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Cliente")) {
                return idclientDB+","+roleDB+","+nomeDB+","+userNameDB;

            }
        }
    }
    catch(SQLException e)
    {
        e.printStackTrace();
    }
    return "Credenciais inválidas, tente novamente";
}


}


