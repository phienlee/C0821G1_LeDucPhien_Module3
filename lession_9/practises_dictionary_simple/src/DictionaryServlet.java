import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/translate"})
public class DictionaryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> dictionary= new HashMap<>();
        dictionary.put("hello", "Xin Chao");
        dictionary.put("how", "Nhu the nao");
        dictionary.put("book", "Sach");
        dictionary.put("pen", "but pi");
        dictionary.put("both", "binh nuoc");
        dictionary.put("computer", "may tinh");

        String search=req.getParameter("txtSearch");
        String result= dictionary.get(search);

        HttpSession session=req.getSession();
        session.setAttribute("result", result );
        req.getRequestDispatcher("ShowWord.jsp").forward(req, resp);
    }
}
