/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import backend.DataMapper;
import backend.Search;
import cake.CakeBottom;
import cake.CakeTopping;
import cake.CupCake;
import entyties.OrderLine;
import entyties.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import myexceptions.TransactionFailureException;

/**
 *
 * @author Bloch
 */
@WebServlet(name = "Controller1", urlPatterns =
{
    "/Controller1"
})
public class Controller1 extends HttpServlet {

    DataMapper dao = new DataMapper();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        String testorigin = request.getParameter("testorigin");
        HttpSession session = request.getSession();
        List<CakeTopping> topList = (List<CakeTopping>) request.getSession().getAttribute("topList");
        List<CakeBottom> botList = (List<CakeBottom>) request.getSession().getAttribute("botList");
        List<OrderLine> cartList = (List<OrderLine>) request.getSession().getAttribute("cartList");

        if (cartList == null)
        {
            cartList = new ArrayList<>();
            session.setAttribute("cartList", cartList);
        }
        if (topList == null)
        {
            topList = dao.getAllCakeToppings();
            session.setAttribute("topList", topList);
        } else
        {
            session.setAttribute("topList", topList);
        }

        if (botList == null)
        {
            botList = dao.getAllCakeBottoms();
            session.setAttribute("botList", botList);
        } else
        {
            session.setAttribute("botList", botList);
        }
        User user = (User) session.getAttribute("user");
        String name, password;
        if (user == null || testorigin != null)
        {
            switch (testorigin)
            {
                case "login":

                    session = request.getSession();
                    name = request.getParameter("name");
                    password = request.getParameter("password");
                    user = dao.validateUser(name, password);

                    if (user == null)
                    {
                        RequestDispatcher rd = request.getRequestDispatcher("login.html");
                        rd.forward(request, response);
                        return;

                    } else
                    {
                        RequestDispatcher rd = request.getRequestDispatcher("loggedin.jsp");
                        session.setAttribute("balance", user.getBalance());
                        session.setAttribute("user", user);
                        rd.forward(request, response);
                        return;
                    }
                case "seeorders":

                    return;
                case "logout":
                    if (session.getAttribute("user") != null)
                    {
                        session.setAttribute("user", null);
                        session.invalidate();
                        RequestDispatcher rd = request.getRequestDispatcher("index.html");
                        rd.forward(request, response);
                        return;
                    }
                default:
                    session.invalidate();
                    RequestDispatcher rd = request.getRequestDispatcher("index.html");
                    rd.forward(request, response);
                    return;

            }

        }

        String addToCart = request.getParameter("addtocart");
        if ("addtocart".equals(addToCart))
        {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String topping = request.getParameter("toppings");
            String bottom = request.getParameter("bottoms");
            Search search = new Search();
            CakeTopping cakeTopping = search.findCakeTopping(topping, topList);
            CakeBottom cakeBottom = search.findCakeBottom(bottom, botList);
            CupCake cupCake = new CupCake(cakeTopping, cakeBottom);
            OrderLine orderLine = new OrderLine(cupCake, quantity);
            search.addToCart(cartList, orderLine);
            RequestDispatcher rd = request.getRequestDispatcher("loggedin.jsp");
            rd.forward(request, response);
        }

        String removeFromCart = request.getParameter("removeOrderLine");
        if (removeFromCart != null)
        {
            Search search = new Search();
            search.removeOrderLine(cartList, removeFromCart);
            RequestDispatcher rd = request.getRequestDispatcher("loggedin.jsp");
            rd.forward(request, response);
        }

        String submitOrder = request.getParameter("submitOrder");
        if (submitOrder != null)
        {
            if (!cartList.isEmpty())
            {
                try
                {
                    dao.addOrderToDatabase(cartList, user);
                } catch (TransactionFailureException ex)
                {
                    session.invalidate();
                    RequestDispatcher rd = request.getRequestDispatcher("index.html");
                    rd.forward(request, response);
                    return;
                }
                cartList.clear();
                RequestDispatcher rd = request.getRequestDispatcher("loggedin.jsp");
                rd.forward(request, response);
            } else
            {
                RequestDispatcher rd = request.getRequestDispatcher("loggedin.jsp");
                rd.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
