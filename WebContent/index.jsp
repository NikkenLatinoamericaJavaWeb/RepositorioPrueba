<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page contentType="text/html; charset=iso-8859-1" session="true" language="java" import="java.util.*" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name='author' content='Christian Camilo Callejas Charry' />
<%!String slider;%>

<head>
    <title>Intranet Corporativo</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="SHORTCUT ICON" href="images/Icono_Nikken.ico"></link><!-- Icono de la Pagina -->
    <link rel="stylesheet" type="text/css" href="css/cuerpo/default_1.css" media="screen" /><!-- Estilo de la Pagina -->
    <!--[if IE 6]>
    <link rel="stylesheet" href="css/menu_despegable/ie6.css" type="text/css" media="all" />
    <![endif]-->
    <link rel="stylesheet" href="css/menu_despegable/stencil.menu.css" type="text/css" media="screen" title="no title" charset="utf-8"/><!-- Menu despegable -->
    <link rel="stylesheet" href="css/menu_despegable/stencil.menu.colors.css" type="text/css" media="screen" title="no title" charset="utf-8"/><!-- Menu despegable -->
    <link rel="stylesheet" type="text/css" href="css/menu_lateral/styles.css" /><!-- Menu Lateral -->
    <link href="css/tablecloth/tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="css/tablecloth/tablecloth/tablecloth.js"></script>
    <script type="text/javascript" src="js/cuadrev.js"></script>
   
    <!-- Estilo de Burbuja -->
    <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
    
   <link href="css/datatable/jquery-ui-1.8.22.custom.css" rel="stylesheet"/>
   <link href="css/datatable/jquery.dataTables.css" rel="stylesheet" />
   <link href="css/datatable/demo_table.css" rel="stylesheet" />
   <link href="css/datatable/demo_table_jui.css" rel="stylesheet" />
   <link href="css/tablecloth/view.css" rel="stylesheet" type="text/css" media="screen" ></link>
   <link  href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"></link>
   <link rel="stylesheet" href="/resources/demos/style.css"/>
   
    <script src="js/jquery-1.8.2.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Calendarw.js"></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	
		   <script>
		 $(function() {
			    $( "#accordion" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100
			    });
			  });
		  </script> <script>
		 $(function() {
			    $( "#accordionOrden" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100
			    });
			  });
		  </script><script>
		 $(function() {
			    $( "#accordionRecaudos" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100 
			    });
			  });
		  </script><script>
		 $(function() {
			    $( "#accordionDiferencia" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100
			    });
			  });
		  </script>
		   <script> 
		function pulsar(e) { 
		  tecla = (document.all) ? e.keyCode :e.which; 
		  return (tecla!=13); 
		} 
	</script> 
    
</head>
    

<body>
<%@include file="importacion.jsp"%>
    <!-- Ubicacion del menu despegable -->
    <style type="text/css">
    .navigation { position: absolute; z-index: 4;  width: 1095px; top: 95px; margin-left: -75px;}
    .page { z-index: 4;}
.exito {
        color: #4F8A10;
		font-size: 12px;
		background-color: #DFF2BF;
		background-image: url('exito.png');
		width: 61%;
		text-align: left;
		margin-left: 0%;
}
.error {
   		color: #D8000C;
		font-size: 12px;
		background-color: #FFBABA;
		background-image: url('error.png');
		width: 47%;
		margin-left: 18%;
		text-align: left;
}
.info{
	color: #00529B;
	background-color: #BDE5F8;
	background-image: url('infor.png');
	height: 17px;
	width: 56%;
	margin-left: 11%;
	font-size: 12px;
}
    
    .dataTables_wrapper {
			position: relative !important;
	clear: both !important;
	font-size: 95% !important;
	}
   
   .centerText{
   	text-align: center !important;
   }
    </style>
    <div id="view" style="z-index: 3;">
    <div id="head" style="z-index: 3;">
    <div id="main" style="z-index: 3;">
        <img src="images/Logo_Intra2.png"/>
    </div>
    <hr class="hidden" />
    <hr class="hidden" />
    <div id="logo"></div>
    <%
    try{
    	Utilitario obj = new Utilitario();
        ResultSet ds=obj.ObtenerSlider();
         while (ds.next())
         {
              slider = ds.getString("menu_horizontal");  
         }
         %>
         <%=slider %><%
   	 }catch(Exception e){
   		 System.out.println("Ha ocurrido un error al invocar"+
   				 "el menu horizontal a causa de: "+e.toString());
   	 }
    %>
    
    <hr class="hidden"/>
  </div>
  <div id="content" style="width: 100%;margin-top: -1%; margin-left: 0%;">
      <div class="Letra_Intra">
        <div id="contentBlock">
          <div class="item itemOdd">
         	 <span class="date">Nikken Latinoamérica</span>
         	 <%String name = "", pais= "", area ="";  %>
         	 <%
         		 pais=request.getParameter("pais");
         	     name=request.getParameter("nombre");
         	     area=request.getParameter("area");
         	 %>
         	 
         	 <h3>"Asignación a Comerciantes Independientes de Clientes Finales".</h3>
         	 <%try{
				int tamaño = 0;
				
				tamaño = AsignacionImpl.traerTotalDatos();
				
				if(tamaño==0){
					%>
					<div id="errors" class='info mensajes' style="width: 111%;" >Ups! No hay datos, por favor verificar que se haya realizado la actualizacion del Archivo "Ganadores ISO" del trimestre correspondiente !!. <a href="http://intranet.nikkenlatam.com:8080/Intranetlat/">  Volver</a></div>
					<%
				}else{
				
				
				%>
         	 
         	 <table style="width: 39%; margin-left:-3%">
         	 	<tr>
         	 		<td rowspan="3" style="background-color: white;">
         	 			 <%if(pais.equals("COL")){
			         		 %><img src="images/Citys/Colombia.png" style="width: 40%;margin-left: 46%;" /> 
			         	 <%} %>
			         	  <%if(pais.equals("CRI")){
			         		 %><img src="images/Citys/Costa_Rica.png" style="width: 40%;margin-left: 46%;" /> 
			         	 <%} %>
			         	  <%if(pais.equals("ECU")){
			         		 %><img src="images/Citys/Ecuador.png" style="width: 40%;margin-left: 46%;" />
			         	 <%} %>
			         	  <%if(pais.equals("SLV")){
			         		 %><img src="images/Citys/El_Salvador.png" style="width: 40%;margin-left: 46%;" /> 
			         	 <%} %>
			         	  <%if(pais.equals("GTM")){
			         		 %><img src="images/Citys/Guatemala.png" style="width: 40%;margin-left: 46%;" />
			         	 <%} %>
			         	  <%if(pais.equals("MEX")){
			         		 %><img src="images/Citys/_Mexico.png" style="width: 40%;margin-left: 46%;" />
			         	 <%} %>
			         	  <%if(pais.equals("PAN")){
			         		 %><img src="images/Citys/Panama.png" style="width: 40%;margin-left: 46%;" />
			         	 <%} %>
			         	  <%if(pais.equals("PER")){
			         		 %><img src="images/Citys/Peru.png" style="width: 40%;margin-left: 46%;"/>
			         	 <%} %>
         	 		</td>
         	 		<td style="background-color: white;">
         	 			<%if(pais.equals("COL")){
			         		 %><a>Colombia</a> 
			         	 <%} %>
			         	  <%if(pais.equals("CRI")){
			         		 %><a>Costa Rica</a> 
			         	 <%} %>
			         	  <%if(pais.equals("ECU")){
			         		 %><a>Ecuador</a> 
			         	 <%} %>
			         	  <%if(pais.equals("SLV")){
			         		 %><a>El Salvador</a> 
			         	 <%} %>
			         	  <%if(pais.equals("GTM")){
			         		 %><a>Guatemala</a> 
			         	 <%} %>
			         	  <%if(pais.equals("MEX")){
			         		 %><a>México</a> 
			         	 <%} %>
			         	  <%if(pais.equals("PAN")){
			         		 %><a>Panama</a> 
			         	 <%} %>
			         	  <%if(pais.equals("PER")){
			         		 %><a>Perú</a> 
			         	 <%} %>
         	 		</td>
         	 	</tr>
         	 	<tr>
         	 		<td style="background-color: white;"><a>Bienvenido  <%=name %></a></td>
         	 	</tr>
         	 	<tr>
         	 		<td style="background-color: white;"><a><%=area %></a></td>
         	 	</tr>
         	 </table>
         
         	 <fieldset style="margin-left: 0%;width:100%;">
         	 <legend>Por favor responda o seleccione las opciones de las Siguientes Preguntas :</legend>
         	 <form action="assignProspecto" name="fromn1 "method="post" onsubmit="return pulsar(event)">
         	 	
	         	 <table border="1">
	         	 		<tr>
	         	 			<td colspan="2" style="background-color:white;">
	         	 				<div id="error_formulario" class='error mensajes' style="display:none"></div>
	         	 				<div id="info_formulario" class='info mensajes' style="display:none"></div>
							</td>
	         	 		</tr>
	         	 		<tr>
	    					<td style="background-color: white;border-bottom: 1px solid black;width: 40%;">
	    						<img id="buffer" src="images/ProgressBar.gif" style="margin-left: 23%;height: 364px;position: absolute;margin-top: -6%;width: 53%;opacity: .3;display:none"/>
	    						<input type="hidden" name="<%=Constantes.operador %>" value="<%=name%>_<%=pais%>_<%=area%>"/>
	    						<label> Nombre Completo del Prospecto</label>
			 				</td>
			 				<td style="background-color: white;border-bottom: 1px solid black;">
			 					<input type="text" id="nombre_idForm" name="<%=Constantes.nombre%>" style="width:70%" onkeypress="return pulsar(event)" />
			 				</td>
			 			</tr>
			 			<tr>
	    					<td style="background-color: white;border-bottom: 1px solid black;">
			 					<label> País y Estado / Providencia </label>	
	    					</td>
	    					<td style="background-color: white;border-bottom: 1px solid black;">
	    						<label>Elija el País </label>
	    						<select  id="pais_id" name="<%=Constantes.pais%>" style="margin-left: 96px;width: 31%;margin-bottom: 15px;" onchange="traerEstados(this)">
	    							<option value="0">Elija un país</option>
	    							<option value="<%=Constantes.col %>">Colombia</option>
	    							<option value="<%=Constantes.cri %>">Costa Rica</option>
	    							<option value="<%=Constantes.ecu %>">Ecuador</option>
	    							<option value="<%=Constantes.slv %>">El Salvador</option>
	    							<option value="<%=Constantes.gtm %>">Guatemala</option>
	    							<option value="<%=Constantes.mex %>">Mexico</option>
	    							<option value="<%=Constantes.pan %>">Panama</option>
	    							<option value="<%=Constantes.per %>">Perú</option>
	    						</select><br/>
	    						<label for="estado_id">Elija el Estado / Providencia </label>
	    						<select  id="estado_id" name="<%=Constantes.estado%>" style="margin-left: 2%;width: 31%;">
	    						
	    						</select>
	    					</td>
	         	 		</tr>
	         	 		<tr>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
	         	 				<label> Correo Electronico </label>
	         	 			</td>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
		         	 			<input type="text" id="mail_idForm" name="<%=Constantes.mail%>" style="width:70%" onkeypress="return pulsar(event)"/>
		         	 		</td>
         	 			</tr>
         	 			<tr>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
	         	 				<label> Teléfono Celular </label>
	         	 			</td>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
		         	 			<input type="text" id="tel_idfrom" name="<%=Constantes.telefono%>" style="width:70%" onkeypress="return pulsar(event)"/>
		         	 		</td>
         	 			</tr>
         	 			<tr>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
	         	 				<label> ¿Conoce al Comerciante Independiente <br/> que le vendió el producto? </label>
	         	 			</td>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
		         	 			<select name="<%=Constantes.conoceCi%>" onchange ="validarconoceCi(this)" id="know_id">
		         	 				<option value="SI">SI</option>
		         	 				<option value="NO">NO</option>
		         	 			</select>
		         	 		</td>
         	 			</tr>
         	 			<tr>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
	         	 				<label> Escriba el número del CI si ya lo conoce: </label>
	         	 			</td>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
	         	 				<input type="text" name="<%=Constantes.numCi %>" id="id_codigoci" style="width:70%" id="numci_idform" onchange="getNombreCi(this)" onkeypress="return pulsar(event)" class="textCi"/>
		         	 		</td>
         	 			</tr>
         	 			<tr>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
	         	 				<label> Nombre del CI :  </label>
	         	 			</td>
	         	 			<td style="background-color: white;border-bottom: 1px solid black;">
	         	 				<div id="textNombre">
	         	 					<textarea disabled="disabled" style="width: 284px;margin: 0px;height: 50px;resize: none;" onkeypress="return pulsar(event)"></textarea>
	         	 				</div>
	         	 				
	         	 				
		         	 		</td>
         	 			</tr>
	         	 	</table>
	         	 	<input type="button" value="Enviar Información" style="margin-left: 46%; color:blue" onclick="validarDatos()"/> <input type="button" value="Borrar información" onclick="borrarInformacion()"></input>
	         	 	<div style="display:none">
	         	 		<input type="submit" id="enviar_info" />
	         	 	</div>
         	 	</form>
         	 	</fieldset>
         	 	
 		</div>
         </div>
    </div>
  <hr class="hidden" />
  <div id="foot">
    <p class="fl">Nikken Latinoamérica 2016&copy; </p>
        <p class="fr">Desarrollado por: Tecnologias de la Información. - Felipe Cordoba</p>
  </div>
  <%
  %>
</div>
</body>
<%

				}
	}catch(Exception ex){
		%>
			<div id="errors" class='error mensajes' style="width: 278%;" >Ups! Ingreso no valido por favor  intentalo mas tarde <a href="http://intranet.nikkenlatam.com:8080/Intranetlat/">Volver</a></div>
		<%
		System.out.println("error de usuario " + ex.toString());
}%>
</html>