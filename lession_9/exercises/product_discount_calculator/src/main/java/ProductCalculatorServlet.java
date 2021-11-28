import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/calculate"})
public class ProductCalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product = req.getParameter("product");
        int price = Integer.parseInt(req.getParameter("price"));
        float discount = Float.parseFloat(req.getParameter("discount"));

        float discountAmount = price * discount / 100;
        float discountPrice = price - discountAmount;

        HttpSession session = req.getSession();
        session.setAttribute("product", product);
        session.setAttribute("price", price);
        session.setAttribute("discount", discount);
        session.setAttribute("discountAmount", discountAmount);
        session.setAttribute("discountPrice", discountPrice);

        req.getRequestDispatcher("show_discount.jsp").forward(req, resp);
    }
}
