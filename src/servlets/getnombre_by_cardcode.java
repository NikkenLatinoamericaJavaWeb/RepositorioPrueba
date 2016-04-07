package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nikken.asignacion.impl.AsignacionImpl;
import com.nikken.asignacion.model.Estados;
import com.nikken.asignacion.util.Constantes;

/**
 * Servlet implementation class getnombre_by_cardcode
 */
public class getnombre_by_cardcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getnombre_by_cardcode() {
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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
        String codigo=request.getParameter(Constantes.numCi);
        String nombre="";
        nombre=AsignacionImpl.TraerNombre_By_Ci(codigo);
        try{
        String val[] = nombre.split("_");
        String a=val[0].toString();
        String b=val[1].toString();
        
		out.printf("<textarea disabled='disabled' style='width: 284px;margin: 0px;height: 50px;resize: none;'>"+b+" - "+a+"</textarea><input type='hidden' name='"+Constantes.nombreCi+"' id='hidden_Nombre'  id='nombreid_from' value='"+nombre+"'/>");
		out.close();
        }catch(Exception ex){
        	out.printf("<textarea disabled='disabled' style='width: 284px;margin: 0px;height: 50px;resize: none;'>No existe el CI</textarea><input type='hidden' name='"+Constantes.nombreCi+"' id='hidden_Nombre'  id='nombreid_from' value='No existe el CI'/>");
        }
	}

}
