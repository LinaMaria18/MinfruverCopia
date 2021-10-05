package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import modelo.ClientesDAO;
import modelo.ClientesDTO;
import modelo.ProductosDAO;
import modelo.ProductosDTO;


/**
 * Servlet implementation class VentasController
 */
@WebServlet("/VentasController")
public class VentasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VentasController() {
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
		
		
		int ced, cons, val1, cant1, tot1;
		String name, prod;
			
		
		ClientesDTO clidto;
		ClientesDAO clidao;
		ClientesDTO cliguard;	
		ProductosDTO prodto;
		ProductosDAO prodao;
		ProductosDTO proguard;
			
		if(request.getParameter("btn_cedula")!=null)
		{
			int cedu;
			
			ced=Integer.parseInt(request.getParameter("cedula"));
			clidto= new ClientesDTO(ced);
			clidao= new ClientesDAO();
			cliguard=clidao.consultarunCliente(clidto);
			
			if(cliguard!=null)
			{
				cedu=cliguard.getCedula_clien();
				name=cliguard.getNombre_clien();
								
				response.sendRedirect("Menu_Ventas.jsp?cedula="+cedu+"&cliente="+name);
				//JOptionPane.showMessageDialog(null, "Cliente consultado y encontrado");
				
			}
			else
			{
				JOptionPane.showMessageDialog(null, "El cliente no existe en la base de datos");
				response.sendRedirect("Menu_Ventas.jsp");
			}
		}
		
		if(request.getParameter("cons1")!= null) {
			int cons1;
			
			cons=Integer.parseInt(request.getParameter("cod1"));
			prodto= new ProductosDTO(cons);
			prodao= new ProductosDAO();
			proguard=prodao.ConsultarProducto(prodto);
			
			if(proguard!=null) {
				
				cons1=proguard.getCod_pro();
				prod=proguard.getNom_prod();
				val1=proguard.getPre_ven();
				cant1=Integer.parseInt(request.getParameter("cant1"));
				tot1= cant1*val1;
				
				response.sendRedirect("Menu_Ventas.jsp?cod1="+cons1+"&nomp1="+prod+"&vu1="+val1+"&cant1"+cant1+"&vlr1="+tot1);
				// response.sendRedirect("Menu_Ventas.jsp?cod1="+cons1+"&nomp1="+ URLEncoder.encode(prod,"UTF-8")+"&vu1="+val1+"&cant1"+cant1+"&vlr1="+tot1);
				// JOptionPane.showMessageDialog(null, "Producto consultado y encontrado");
			} else {
				response.sendRedirect("Menu_Ventas.jsp");
			}
			
						
		}
	}

}
