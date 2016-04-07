package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nikken.asignacion.impl.AsignacionImpl;
import com.nikken.asignacion.model.Ganador;
import com.nikken.asignacion.model.Prospecto;
import com.nikken.asignacion.util.Constantes;
import com.nikken.asignacion.util.Utilitario;

/**
 * Servlet implementation class assignProspecto
 */
public class assignProspecto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public assignProspecto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		String nombre=request.getParameter(Constantes.nombre);
		String pais=request.getParameter(Constantes.pais);
		String estado=request.getParameter(Constantes.estado);
		String email=request.getParameter(Constantes.mail);
		String telefono=request.getParameter(Constantes.telefono);
		String conoceCi=request.getParameter(Constantes.conoceCi);
		String nombre_y_ci=request.getParameter(Constantes.nombreCi);
		String operadores=request.getParameter(Constantes.operador);
		String v[]=operadores.split("_");
		String opName=v[0].toString();
		
		Calendar date = GregorianCalendar.getInstance();
		int año = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH)+1;
		int day= date.get(Calendar.DAY_OF_MONTH);
		
		String mes=""+month;
		if(mes.length()==1){
			mes = "0"+month;
		}
		
		String days=""+day;
		if(days.length()==1){
			days = "0"+day;
		}
		
		String trimestre="";
		
		if(month==1||month==2||month==3){
			trimestre=año+" Primer Trimestre";
		}if(month==4||month==5||month==6){
			trimestre=año+" Segundo Trimestre";
		}if(month==7||month==8||month==9){
			trimestre=año+" Tercer Trimestre";
		}if(month==10||month==11||month==12){
			trimestre=año+" Cuarto Trimestre";
		}
		
		
		
		
		List<Ganador> listGanador = new ArrayList<Ganador>();
		listGanador=AsignacionImpl.traerGanadoresPorPais(pais);
		
		Ganador  objectGanador = new Ganador();
		Prospecto  objectoProspecto = new Prospecto();
		
		if(conoceCi.equals("SI")){
			
			String nombres_y_ci [] =nombre_y_ci.split("_");
			String nombreci = nombres_y_ci[0].toString();
			String codigoci = nombres_y_ci[1].toString();
			
			
			
			
			String fecha=año+""+mes+""+days;				
			//Asignar Ganador
			boolean asginar = AsignacionImpl.asignarProspecto(nombre, email, pais, estado, telefono, nombreci, codigoci, opName, fecha);
			objectGanador = AsignacionImpl.obtenerGanadorPorCodigo(codigoci);
			
			objectoProspecto.setNombre(nombre);
			objectoProspecto.setMail(email);
			objectoProspecto.setPais(pais);
			objectoProspecto.setEstado(estado);
			objectoProspecto.setTelefono(telefono);
			
			session.setAttribute("asignarIngreso", asginar+"_");
			session.setAttribute("objectoProspecto", objectoProspecto);
			session.setAttribute("objectGanador", objectGanador);
			session.setAttribute("DatosOperadores",operadores);
			response.sendRedirect("informacion_asignacion.jsp");
			
			//Devolver Object ganadorISO y mostrarmensaje de lo que se realizo en pagina de Confirmacion de registro guardado
			
		}else{
			
			//Validacion por estado 
			listGanador=AsignacionImpl.validarGanadoresEstado(listGanador, Utilitario.limpiarCadena(estado));
			long cantidadGanadores=listGanador.size();
			
			
			if(cantidadGanadores > 0){
				List<Ganador> seleccionado = new ArrayList<Ganador>();
				//Validar por C/U prospectos asignados y se agrega nueva lista con el valor de Cantidad asignados
				for(Ganador objec: listGanador){
					long cAb = AsignacionImpl.cantidadASignadosPorciAB(objec.getCodigoci(),trimestre);
					objec.setCantidadAsignado(Long.toString(cAb));
					seleccionado.add(objec);
				}
				// Se obtiene el de menor asignados
				objectGanador = AsignacionImpl.validarGanadoresMenorCantidad(seleccionado);
				
				
				String fecha=año+""+mes+""+days;				
				//Asignar Prospecto a GandorISO
				
				boolean asginar = AsignacionImpl.asignarProspecto(nombre, email, pais, estado, telefono, objectGanador.getNombreci(), objectGanador.getCodigoci(), opName, fecha);
				
				objectoProspecto.setNombre(nombre);
				objectoProspecto.setMail(email);
				objectoProspecto.setPais(pais);
				objectoProspecto.setEstado(estado);
				objectoProspecto.setTelefono(telefono);
				
				session.setAttribute("asignarIngreso", asginar+"_");
				session.setAttribute("objectoProspecto", objectoProspecto);
				session.setAttribute("objectGanador", objectGanador);
				session.setAttribute("DatosOperadores",operadores);
				response.sendRedirect("informacion_asignacion.jsp");
				
			}else{
				listGanador=AsignacionImpl.traerGanadoresPorPais(pais);
				List<Ganador> seleccionado = new ArrayList<Ganador>();
				//Validar por C/U prospectos asignados y se agrega nueva lista con el valor de Cantidad asignados
				for(Ganador objec: listGanador){
					long cAb = AsignacionImpl.cantidadASignadosPorciAB(objec.getCodigoci(),trimestre);
					objec.setCantidadAsignado(Long.toString(cAb));
					seleccionado.add(objec);
				}
				// Se obtiene el de menor asignados
				objectGanador = AsignacionImpl.validarGanadoresMenorCantidad(seleccionado);
				
				
				String fecha=año+""+mes+""+days;				
				//Asignar Prospecto a GandorISO
				
				boolean asginar = AsignacionImpl.asignarProspecto(nombre, email, pais, estado, telefono, objectGanador.getNombreci(), objectGanador.getCodigoci(), opName, fecha);
				
				objectoProspecto.setNombre(nombre);
				objectoProspecto.setMail(email);
				objectoProspecto.setPais(pais);
				objectoProspecto.setEstado(estado);
				objectoProspecto.setTelefono(telefono);
				
				session.setAttribute("asignarIngreso", asginar+"_");
				session.setAttribute("objectoProspecto", objectoProspecto);
				session.setAttribute("objectGanador", objectGanador);
				session.setAttribute("DatosOperadores",operadores);
				response.sendRedirect("informacion_asignacion.jsp");
			}
			
			
		}
		
		
		
	}

}
