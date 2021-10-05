<%@page import="controller.Conexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es"> 
<head>
<meta charset="utf-8"/>
<meta charset="ISO-8859-1">
<title>Gestión de ventas</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/Menu_Nav.css">
<link rel="stylesheet" href="css/venta.css">
</head>

<%
	Conexion con=new Conexion();
	con.conexiondb();
%>

<body>

	<div class="venta">

		<header class="navbar">    
	   		<div class="titulo-logo"> 
	   			<a href="home.jsp"><img alt="Logo minfruver" src="imgs/logo-02.png" class="logo"></a>
	   		</div>
	   		
        	<ul class="main-nav">
                <li class="main-nav__item"><a class="tooltip" href="Menu_Usuario.jsp"><img alt="Usuarios" src="imgs/items_Mesa de trabajo 1.png">
	               <span class="tooltip_box">Usuarios</span>
	               </a></li>
	               <li class="main-nav__item"><a class="tooltip" href="Menu_Cliente.jsp"><img alt="Clientes" src="imgs/items-02.png">
	               <span class="tooltip_box">Clientes</span>
	               </a></li>
	               <li class="main-nav__item"><a class="tooltip" href="Menu_Proveedores.jsp"><img alt="Proveedores" src="imgs/items-03.png">
	               <span class="tooltip_box">Proveedores</span>
	               </a></li>
	               <li class="main-nav__item"><a class="tooltip" href="Menu_Productos.jsp"><img alt="Productos" src="imgs/items-04.png">
	               <span class="tooltip_box">Productos</span>
	               </a></li>
	               <li class="main-nav__item"><a class="tooltip" href="Menu_Ventas.jsp"><img alt="Ventas" src="imgs/items-11.png">
	               <span class="tooltip_box">Ventas</span>
	               </a></li>
	               <li class="main-nav__item"><a class="tooltip" href="Menu_Reportes.jsp"><img alt="Reportes" src="imgs/items-06.png">
	               <span class="tooltip_box">Reportes</span>
	               </a></li>
	               <%
	               String da = request.getSession().getAttribute("user").toString();
				   %>
                <li class="main-nav__itemU"><a href="index.jsp" class="exit_session"><%=da%></a></li>
            </ul>
	   	</header>
	   	
	   	<div class="formulario">

	   		<h2>Menú de Ventas</h2>

	   	</div>
	<% String cedula= "", cliente="";
	
	if(request.getParameter("cedula")!=null){
		cedula=request.getParameter("cedula");
		cliente=request.getParameter("cliente");
	}
		
	String cod1="", nomp1="", vlr1="", vu1="", cant1="";
	
	if(request.getParameter("cod1")!=null){
		cod1=request.getParameter("cod1");
		nomp1=request.getParameter("nomp1");
		
		//nomp1=(new String(request.getParameter("nomp1").getBytes("UTF-8")));
				
		vu1=request.getParameter("vu1");
		cant1=request.getParameter("cant1");
		vlr1=request.getParameter("vlr1");
	}
	
	%>
			
	   		<form action="VentasController" method="post" >
	   		
		    	
		    	<label>Cédula</label>
		    	<input type="text" name="cedula" value="<%=cedula%>" >
			  
			    <input type="submit" name="btn_cedula" value="Consultar">
			    <label>Cliente</label>
			    <input type="text" name="cliente" value="<%=cliente %>" >
			    
			    <table>
				  <tr>
				    <th>Cod. Producto</th>
				    <th></th>
				    <th>Nombre Producto</th>
				    <th>Valor Unidad</th>
				    <th>Cant.</th>
				    <th>Vlr. Total</th>
				  </tr>
				  <tr>
				    <td><input type="text" name="cod1" value="<%=cod1 %>"></td>
				    <td><input type="submit" name="cons1" value="Consultar"></td>
				    <td><input type="text" name="nomp1" value="<%=nomp1 %>"></td>
				    <td><input type="text" name="vu1" value="<%=vu1%>"></td>
				    <td><input type="number" name="cant1" value="<%=cant1%>"></td>
				    <td><input type="text" name="vlr1" value="<%=vlr1%>"></td>				    				   
				  </tr>
				  <tr>
				    <td><input type="text" name="cod2" value=""></td>
				    <td><input type="submit" name="cons2" value="Consultar"></td>
				    <td><input type="text" name="nomp2" value=""></td>
				    <td><input type="text" name="vu2" value=""></td>
				    <td><input type="number" name="cant2" value=""></td>
				    <td><input type="text" name="vlr2" value=""></td>				    				   
				  </tr>
				  <tr>
				    <td><input type="text" name="cod3" value=""></td>
				    <td><input type="submit" name="cons3" value="Consultar"></td>
				    <td><input type="text" name="nomp3" value=""></td>
				    <td><input type="text" name="vu3" value=""></td>
				    <td><input type="number" name="cant3" value=""></td>
				    <td><input type="text" name="vlr3" value=""></td>				    				   
				  </tr>
		
				</table>
			    <label>Total Venta </label>
			    <input type="text" name="tventa">
			    <label>Total IVA </label>
			    <input type="text" name="tiva">
			    <label>Total con IVA </label>
			    <input type="text" name="tconiva">
			    <input type="button" name="confirmar" value="Confirmar">
			    	
			</form> 
			    
		 
	   	<div class="footer">
	    	<div class="logoFooter">
	    		<img alt="logo" src="imgs/logo-misiontic.png" width="100px">
	    	</div>
	    	
	    	<div class="logo-universidad"> 
	    		<img alt="Logo minfruver" src="imgs/logo-universidad.png" width="100px"></a>
	    	</div>
	    
	    	<div class="description">
	    		<p style="text-align: center; border-bottom: 1px solid #ffffff;"><b>MisionTic - Universidad del Bosque 2021</b></p> 
	    		<p style="padding: 5px 0 0 0"><b>Nuestra meta: </b>Enfrentar los desafíos de la cuarta Revolución Industrial.</p>
	    		<p><b>Autores: </b>Lina María Pérez, Evelyn Perozo, Diego Ramírez, Diana Rodríguez</p>
	    			    		
	    	</div>
	    
	    	<div class="InfoGeneral">
		    	<p>Siguenos en nuestras redes sociales</p>
		    	<div class="redesSociales">
			    	<a><img alt="Facebook" src="imgs/facebook.svg"></a>
			    	<a><img alt="Instagram" src="imgs/instagram.svg"></a>
			    	<a><img alt="Twitter" src="imgs/twitter.svg"></a>
		    	</div>
		    	<div class="copyright">
		    		<p><small>Copyright &copy 2021. All Rights Reserved</small></p>
		    	</div>
	    	</div>
	    </div>
	   	

</body>
</html>