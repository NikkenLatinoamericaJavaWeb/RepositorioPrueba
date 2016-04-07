<%
List<Report> ds = new ArrayList<Report>();
ds=(List<Report>)session.getAttribute("ExcelGanadores");

if(ds!=null){
	String fechas ="";
	fechas=(String)session.getAttribute("FechasReport");
	response.setContentType ("application/vnd.ms-excel"); //Tipo de fichero.
	response.setHeader ("Content-Disposition", "attachment;filename=\"Reporte_GanadoresISO_.xls\"");
	String pathInfo =(request.getRequestURL()).toString();
	String[] pat = pathInfo.split("/");
	String reqst=pat[0]+"//"+pat[2]+"/"+pat[3]+"/images/NIKKEN3.png";
	%>
<%@include file="importacion.jsp"%>
<table>
	<tr>
		<td><img src="<%=reqst%>" style="width:5%"/><br></td><td></td><td></td>
		<td style="font-weight: bolder;"><p>Informe de Ganadores ISO </p></td>
	</tr>
</table>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<div id="mayDiferenceDate" class='exito mensajes'> <%=fechas %> </div>
<br></br>
<br></br>
<br></br>
<br></br><%
	%>
			<table border="1">
		   	<tr>
				 <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Código AB</td>
			  	 <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Nombre AB</td>
			     <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Rango AB</td>
			     <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Pais AB</td>
			     <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Estado AB</td>
			     <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Nombre Prospecto</td>
			     <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Pais Prospecto</td>
			     <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Estado Prospecto</td>
			     <td style="background:#e5f1f4; font-weight: bold; text-align: center;">Fecha Asignacion</td>
		 	</tr>
				<%
				try{
					for(Report obj : ds){
					 %>
					 <tr>
					 	<td><%=obj.getCodigoAB()%></td>
					 	<td><%=obj.getNombreAB() %></td>
					 	<td><%=obj.getRangoAB()%></td>
					 	<td><%=obj.getPaisAB()%></td>
					 	<td><%=obj.getEstadoAB()%></td>
					 	<td><%=obj.getNombreProspecto() %></td>
					 	<td><%=obj.getPaisProspecto() %></td>
					 	<td><%=obj.getEstadoProspecto() %></td>
					 	<td><%=obj.getFechaAsignacion() %></td>
					 </tr>
					 <%	
					}
				}catch(Exception ex){
					System.out.println(ex.toString());
				}
				%>
			</tbody>
		</table>
					
<% }%>
</body>
