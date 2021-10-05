<%@page import="controller.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gesti�n de usuarios</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/Menu_Nav.css">
<link rel="stylesheet" href="css/usuario.css">
</head>

<%
	Conexion con=new Conexion();
	con.conexiondb();
%>

<body>
	<div class="usuario">

		<header class="navbar">    
	   		<div class="titulo-logo"> 
	   			<a href="home.jsp"><img alt="Logo minfruver" src="imgs/logo-02.png" class="logo"></a>
	   		</div>
	   		
	           <ul class="main-nav">
	               <li class="main-nav__item"><a class="tooltip" href="Menu_Usuario.jsp"><img alt="Usuarios" src="imgs/items_Mesa de trabajo 1 copia.png">
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
	               <li class="main-nav__item"><a class="tooltip" href="Menu_Ventas.jsp"><img alt="Ventas" src="imgs/items-05.png">
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
		    <h2>Gesti�n de usuarios</h2>
    	
			<%
				String ced="",corr="",name="",pass="",usu="";
				
				if(request.getParameter("ce")!=null)
				{
					
				ced=request.getParameter("ce");
				corr=request.getParameter("co");
				name=request.getParameter("no");
				pass=request.getParameter("cl");
				usu=request.getParameter("us");
				}
			%>
	    	
			<form action="StoreController" method="post" class="userForm">
				<label for="user-cc" >C�dula</label>
				<input type="text" name="cedula" value="<%=ced%>" placeholder="Digita tu C�dula" required>
				<label for="user-cc" >Correo Electr�nico</label>
				<input type="email" name="correo" value="<%=corr%>" placeholder="Digita tu Correo" >
				<label for="user-cc" >Nombre Completo</label>
				<input type="text" name="nombre" value="<%=name%>" placeholder="Digita tu Nombre" >
				<label for="user-cc" >Contrase�a</label>
				<input type="password" name="clave" value="<%=pass%>" placeholder="Digita tu Contrase�a" >
				<label for="user-cc" >Usuario</label>
				<input type="text" name="usuario" value="<%=usu%>" placeholder="Digita tu Usuario" >
				
				<div class="send_data">
			
					<input type="submit" name="btning" value="Crear">
					<input type="submit" name="btnconsu" value="Consultar">
					<input type="submit" name="btnactua" value="Actualizar">
					<input type="submit" name="btnelimi" value="Eliminar"> 
				</div>
			</form>
		</div>
		
		<div class="footer">
	    	<div class="logoFooter">
	    		<img alt="logo" src="imgs/logo-misiontic.png" width="100px">
	    	</div>
	    	
	    	<div class="logo-universidad"> 
	    		<img alt="Logo minfruver" src="imgs/logo-universidad.png" width="100px"></a>
	    	</div>
	    
	    	<div class="description">
	    		<p style="text-align: center; border-bottom: 1px solid #ffffff;"><b>MisionTic - Universidad del Bosque 2021</b></p> 
	    		<p style="padding: 5px 0 0 0"><b>Nuestra meta: </b>Enfrentar los desaf�os de la cuarta Revoluci�n Industrial.</p>
	    		<p><b>Autores: </b>Lina Mar�a P�rez, Evelyn Perozo, Diego Ram�rez, Diana Rodr�guez</p>
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
	</div>
</body>
</html>