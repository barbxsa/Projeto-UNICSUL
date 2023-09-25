package controller;
import java.io.IOException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
 
import bean.LoginBean;
import dao.LoginDao;
 
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
 
public LoginServlet() {
}
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    String userName = request.getParameter("username");
    String password = request.getParameter("password");
    String nomeCliente = request.getParameter("nomeCliente");
 
    LoginBean loginBean = new LoginBean();
 
    loginBean.setUserName(userName);
    loginBean.setPassword(password);
 
    LoginDao loginDao = new LoginDao();
 
    try
    {
        String userValidate = loginDao.authenticateUser(loginBean);
        String[] split = userValidate.split(",");
        StringBuilder sb = new StringBuilder();
        
        if(split[1].equals("Admin"))
        {
            System.out.println("Admin's Home");
 
            HttpSession session = request.getSession(); //Creating a session
            session.setAttribute("Admin", userName); //setting session attribute
            session.setAttribute("userName", userName);
            session.setAttribute("idcliente", split[0]);
            session.setAttribute("nomecliente", split[2]);
            
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        }
        else if(split[1].equals("Funcionario"))
        {
            System.out.println("Editor's Home");
 
            HttpSession session = request.getSession();
            session.setAttribute("Editor", userName);
            session.setAttribute("userName", userName);
            session.setAttribute("idcliente", split[0]);
            session.setAttribute("nomecliente", split[2]);
 
            request.getRequestDispatcher("funcionariohome.jsp").forward(request, response);
        }
        else if(split[1].equals("Cliente"))
        {
            System.out.println("User's Home");
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("User", userName);
            session.setAttribute("userName", userName);
            session.setAttribute("idcliente", split[0]);
            session.setAttribute("nomecliente", split[2]);
            
            request.getRequestDispatcher("clientehome.jsp").forward(request, response);
        }
        else
        {
            System.out.println("Error message = "+userValidate);
            request.setAttribute("errMessage", userValidate);
 
            request.getRequestDispatcher("login2.jsp").forward(request, response);
        }
    }
    catch (IOException e1)
    {
        e1.printStackTrace();
    }
    catch (Exception e2)
    {
        e2.printStackTrace();
    }
} //End of doPost()
}