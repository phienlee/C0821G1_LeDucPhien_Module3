package controller;

import models.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList;

    @Override
    public void init() throws ServletException {
        customerList =new ArrayList<>();
        customerList.add(new Customer("Joan", "11/03/2000", "Barcalona","dekhi.png"));
        customerList.add(new Customer("Take", "19/03/1990", "Real Marid","doraemon.png"));
        customerList.add(new Customer("Ty Collin", "04/03/1999", "London","nobita.png"));
        customerList.add(new Customer("Abi", "02/03/1971", "Washinton","xuka.png"));
        customerList.add(new Customer("Amanue", "31/03/1971", "Sai gon","dekhi.png"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();
        session.setAttribute("customerList", customerList);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}