import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class MainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final Map<String, String> users = new HashMap<>();

    static {
        users.put("username", "password");
        users.put("jaga", "1234");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("username")) {
                    String username = cookie.getValue();
                    response.getWriter().println("Hello, " + username + "! <a href=\"/logout\">Logout</a>");
                    return;
                }
            }
        }
        response.getWriter().println("Welcome! <a href=\"/login\">Login</a>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (users.containsKey(username) && users.get(username).equals(password)) {
            Cookie cookie = new Cookie("username", username);
            response.addCookie(cookie);
            response.sendRedirect("/");
        } else {
            response.getWriter().println("Invalid username or password. <a href=\"/login\">Try Again</a>");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("username")) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    response.sendRedirect("/");
                    return;
                }
            }
        }
        response.sendRedirect("/");
    }
}
