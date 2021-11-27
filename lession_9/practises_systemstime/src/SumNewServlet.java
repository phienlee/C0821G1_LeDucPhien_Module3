import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SumNewServlet", urlPatterns = {"/sumNew", "/sumN"})
public class SumNewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // C3
        int a = Integer.parseInt(request.getParameter("num1"));
        int b = Integer.parseInt(request.getParameter("num2"));
        int result = a + b;

        request.setAttribute("resultFinal", result);
//        request.setAttribute("abc", ...);
//        request.getRequestDispatcher("result.jsp").forward(request, response);
        response.sendRedirect("result.jsp");
    }
}
