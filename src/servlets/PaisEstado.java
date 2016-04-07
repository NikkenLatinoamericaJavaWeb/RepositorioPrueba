package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nikken.asignacion.impl.AsignacionImpl;
import com.nikken.asignacion.model.Estados;

/**
 * Servlet implementation class PaisEstado
 */
public class PaisEstado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaisEstado() {
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
		List<Estados> listResult= new ArrayList<Estados>();
        PrintWriter out = response.getWriter();
        String pais = request.getParameter("pais");
        if(pais.equals("0")){
        	out.printf("<option value='0'></option>");
        }else{
	        try{
		        listResult =  AsignacionImpl.TraerEstados(pais);
		       
		        for(Estados ibj: listResult){
		        	if(!ibj.getName().equals("EL DATO ES NULO EN SAP")){
		        		out.printf("<option value='"+ibj.getName()+"'>"+ibj.getName()+"</option>");
		        	}
		        }
	        }catch(Exception ex){
	        	System.out.println(ex.toString());
	        }
        }
        out.close();
	}
        

}
