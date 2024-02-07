<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ver Votos</title>
</head>
<body>
    <h1>Votos de los jugadores</h1>
    <table border="1">
        <tr>
            <th>Nombre del jugador</th>
            <th>Votos</th>
        </tr>
        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/baloncesto";
                String username = "usuario";
                String password = "clave";

                try (Connection conn = DriverManager.getConnection(url, username, password);
                     Statement stmt = conn.createStatement()) {

                    String query = "SELECT * FROM Jugadores";
                    ResultSet rs = stmt.executeQuery(query);

                    while(rs.next()) {
                        String nombre = rs.getString("nombre");
                        int votos = rs.getInt("votos");
        %>
                        <tr>
                            <td><%= nombre %></td>
                            <td><%= votos %></td>
                        </tr>
        <% 
                    }
                }
            } catch (Exception e) {
                out.println("<h2>Error al obtener los votos: " + e.getMessage() + "</h2>");
            }
        %>
    </table>
    <a href="index.html">Volver a la página principal</a>
</body>
</html>
