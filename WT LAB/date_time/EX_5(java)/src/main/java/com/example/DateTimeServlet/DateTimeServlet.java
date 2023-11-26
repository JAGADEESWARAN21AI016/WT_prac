import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DateTimeServlet")
public class DateTimeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Date and Time Servlet</title>");
        out.println("<style>");
        out.println("body {font-family: Arial, sans-serif;}");
        out.println("h2 {color: #3366cc;}");
        out.println("p {color: #333333;}");
        out.println("</style>");
        out.println("</head><body>");
        out.println("<h2>Current Date and Time</h2>");

        // Get current date and time
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime = sdf.format(new Date());

        // Display the result
        out.println("<p style='font-size: 18px;'>Current Date and Time: <strong>" + dateTime + "</strong></p>");

        out.println("</body></html>");
    }
}
