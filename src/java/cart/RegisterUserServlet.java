package cart;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterUserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");

        ValidUser newUser = (ValidUser) new ValidUser(firstName, lastName, email, password);
        Customers.loadCustomer(newUser);
        System.out.println("User information: " + email + password + lastName + firstName);
        ServletConfig config = getServletConfig();
        String SUMMARY = config.getInitParameter("Summary");
        System.out.println("Values retrieved for the init parameters from the "
                + "servlet configuration are: ");
        System.out.println("Summary: " + SUMMARY);

        RequestDispatcher dispatcher = request.getRequestDispatcher(SUMMARY);
        dispatcher.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}