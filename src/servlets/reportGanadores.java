package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nikken.asignacion.model.Report;

/**
 * Servlet implementation class reportGanadores
 */
public class reportGanadores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportGanadores() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				HttpSession session = request.getSession(true);
				List<Report> ds = new ArrayList<Report>();
				String fechas ="";
				try{
					fechas = (String) session.getAttribute("Fechas");
					ds = (List<Report>) session.getAttribute("DatosExportar");
					if(ds!=null){
						session.setAttribute("FechasReport", fechas);
						session.setAttribute("ExcelGanadores",ds);
						response.sendRedirect("Excelreport.jsp");
					}
				}catch(Exception ex){
					System.out.println("Ex "+ex.toString());
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
