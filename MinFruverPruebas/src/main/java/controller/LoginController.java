package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import modelo.UsuariosDAO;
import modelo.UsuariosDTO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//LOGIN
		
		String u, p;
		UsuariosDTO usdto;
		UsuariosDAO usdao;
		boolean res;
		
		if(request.getParameter("btnlogin")!=null);{
			u=request.getParameter("user");
			p=request.getParameter("pass");
			
			usdto = new UsuariosDTO(p, u);
			usdao = new UsuariosDAO();
			res = usdao.Ingresosistema(usdto);
			if(res) {
				//JOptionPane.showMessageDialog(null, "Bienvenido al sistema");
				request.getSession().setAttribute("user", u);
				response.sendRedirect("home.jsp");
			}
			else {
				JOptionPane.showMessageDialog(null, "Datos incorrectos\nIntente de nuevo","ERROR_MESSAGE", JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("index.jsp");
			}
		}
		
		
		
	}

}
