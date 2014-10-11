package cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckUserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String message = "";
        String url = "";
        boolean valid = false;

        if (email.length() == 0 || password.length() == 0) {
            message = "Please enter both email address and password text boxes.";
        } else if (!isValidEmail(email)) {
            message = "Please enter a valid email address.";
        } else {
            valid = true;
        }
        request.setAttribute("message", message);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        if (valid) {
            ArrayList<ValidUser> users = (ArrayList<ValidUser>) getServletContext().getAttribute("customers");
            ValidUser user = null;
            boolean found = false;
            int i = 0;
            while (!found && i < users.size()) {
                if (users.get(i).getEmail().equals(email) && users.get(i).getPassword().equals(password)) {
                    found = true;
                    user = users.get(i);
                }
                i++;
            }
            if (found) {
                url = "/myShoppingCart/summary.jsp";
            } else {
                user = new ValidUser("", "", email, password);
                users.add(user);
                getServletContext().setAttribute("customers", users);
                url = "/myShoppingCart/displayCustomerData.jsp";
            }
            session.setAttribute("user", user);
        } else {
            url = "/myShoppingCart/checkOut.jsp";
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    private boolean isValidEmail(String email) {
        String expression = "^[\\w\\-]([\\.\\w])+[\\w]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
        CharSequence inputStr = email;
        Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(inputStr);
        return matcher.matches();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}