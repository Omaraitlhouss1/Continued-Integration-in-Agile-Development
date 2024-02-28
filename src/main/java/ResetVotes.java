import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
 
public class ResetVotes extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        
        // Reset votes for all players in the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/baloncesto";
            String username = "usuario";
            String password = "clave";

            try (Connection conn = DriverManager.getConnection(url, username, password);
                 Statement stmt = conn.createStatement()) {

                String query = "UPDATE Jugadores SET votos = 0";
                stmt.executeUpdate(query);

                out.println("<h2>Votos reiniciados a cero.</h2>");
            }
        } catch (Exception e) {
            out.println("<h2>Error al reiniciar los votos: " + e.getMessage() + "</h2>");
        }
    }
}
