package mainPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ServletAccesoDA
 */
public class ServletAccesoDA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAccesoDA() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String formato;
		if(request.getParameter("formato")!=null) {
			formato = request.getParameter("formato");
			switch (formato) {
				case "XLS": {
					request.getRequestDispatcher("DatosAbiertosXLS.jsp").forward(request, response);
					break;
				}
				case "CSV":{
					request.getRequestDispatcher("DatosAbiertosCSV.jsp").forward(request, response);
					break;
				}
				case "JSON":{
					request.getRequestDispatcher("DatosAbiertosJSON.jsp").forward(request, response);
					break;
				}
				case "XML":{
					request.getRequestDispatcher("DatosAbiertosXML.jsp").forward(request, response);
					break;
				}
			default:
				throw new IllegalArgumentException("Unexpected value: " + formato);
			}
		}
	}

}
