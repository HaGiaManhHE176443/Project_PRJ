/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if(request.getSession().getAttribute("acc") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        HashMap<Product, Integer> listCart;
        if(request.getSession().getAttribute("listCart") == null) {
            listCart = new HashMap<>();
        }
        else listCart = (HashMap<Product, Integer>) request.getSession().getAttribute("listCart");
        DAO dao = new DAO();
        
        String id = request.getParameter("pid");
        Product p = dao.getProductbyID(id);
        
        double total = 0;
        
        //check exist product in cart
        boolean checkExist = false;
        for (Map.Entry<Product, Integer> entry : listCart.entrySet()) {
            Product product = entry.getKey();
            Integer quantity = entry.getValue();
            if(product.getId() == p.getId()) {
                checkExist = true;
            }
            total += product.getPrice() * quantity;
        }
        if(!checkExist) {
            listCart.put(p, Integer.parseInt(request.getParameter("quantity")));
            total += p.getPrice() * Integer.parseInt(request.getParameter("quantity"));
        }
        request.setAttribute("amount", request.getParameter("quantity"));
        request.getSession().setAttribute("listCart", listCart);
        request.setAttribute("listP", listCart);
        request.setAttribute("total", total);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
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
            throws ServletException, IOException {
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
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
