import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Acb extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        String nombreP = req.getParameter("txtNombre");
        String nombre = req.getParameter("R1");
        if (nombre != null && "Otros".equals(nombre)) {
            nombre = req.getParameter("txtOtros");
        }
        if (nombre != null) {
            if (bd.existeJugador(nombre)) {
                bd.actualizarJugador(nombre);
            } else {
                bd.insertarJugador(nombre);
            }
        }
        session.setAttribute("nombreCliente", nombreP);
        res.sendRedirect("TablaVotos.jsp");
    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
