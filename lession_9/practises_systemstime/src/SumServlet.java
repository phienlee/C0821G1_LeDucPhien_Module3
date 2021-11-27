import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet", urlPatterns = "/sumS")
public class SumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        C1: index.jsp -> SumServlet -> display to Client
        int a = Integer.parseInt(request.getParameter("num1"));
        int b = Integer.parseInt(request.getParameter("num2"));
        int result = a + b;

        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<body>");
        printWriter.println("<h2 style='color: red'>" + result + "</h2>");
        printWriter.println("</body>");
        printWriter.println("</html>");
    }
}
