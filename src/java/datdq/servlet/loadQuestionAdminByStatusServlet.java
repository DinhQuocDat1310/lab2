/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datdq.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import datdq.question.QuestionDAO;
import datdq.question.QuestionDTO;

/**
 *
 * @author Asus
 */
@WebServlet(name = "loadQuestionAdminByStatusServlet", urlPatterns = {"/loadQuestionAdminByStatusServlet"})
public class loadQuestionAdminByStatusServlet extends HttpServlet {

    private final String LOAD_ANSWER_ADMIN = "loadAnswerAdmin";

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
        PrintWriter out = response.getWriter();
        
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        
        String page = request.getParameter("pageIndex");
        int pageIndex = 1;

        if (page != null) {
            pageIndex = Integer.parseInt(page);
        }
        try {
            QuestionDAO dao = new QuestionDAO();
            dao.loadQuestionByStatus(pageIndex, status);
            List<QuestionDTO> listQuestion = dao.getListQuestion();
            request.setAttribute("LISTQUESTION", listQuestion);
            request.setAttribute("ACTIONLOAD", "loadQuestionAdminByStatus");
            request.setAttribute("TOTALPAGE", dao.countTotalPageByStatus(status));
            request.setAttribute("PAGEINDEX", pageIndex);
        } catch (NamingException ex) {
            log("loadQuestionAdminServlet_NamingEx: " + ex.getMessage());
        } catch (SQLException ex) {
            log("loadQuestionAdminServlet_SQLEx: " + ex.getMessage());
        } finally {
            ServletContext context = request.getServletContext();
            Map<String, String> listFilter = (Map<String, String>) context.getAttribute("FILTER");
            RequestDispatcher rd = request.getRequestDispatcher(listFilter.get(LOAD_ANSWER_ADMIN));
            rd.forward(request, response);
            out.close();
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
