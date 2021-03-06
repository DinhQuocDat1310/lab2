/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datdq.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
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
import datdq.answer.AnswerDAO;
import datdq.answer.AnswerDTO;
import datdq.question.QuestionDTO;

/**
 *
 * @author Asus
 */
@WebServlet(name = "loadAnswerAdminServlet", urlPatterns = {"/loadAnswerAdminServlet"})
public class loadAnswerAdminServlet extends HttpServlet {

    private final String HOME_PAGE_ADMIN = "homePageAdmin";

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

        try {
            List<QuestionDTO> listQuesion = (List<QuestionDTO>) request.getAttribute("LISTQUESTION");
            Map<Integer, List<AnswerDTO>> mapQuiz = new HashMap<>();
            if (listQuesion != null) {
                for (QuestionDTO questionDTO : listQuesion) {
                    AnswerDAO dao = new AnswerDAO();
                    dao.loadAnswerDefault(questionDTO.getQuestionID());
                    mapQuiz.put(questionDTO.getQuestionID(), dao.getListAnswer());
                }
                request.setAttribute("MAPQUIZ", mapQuiz);
            }
        } catch (NamingException ex) {
            log("loadAnswerAdminServlet_NamingEx: " + ex.getMessage());
        } catch (SQLException ex) {
            log("loadAnswerAdminServlet_SQLEx: " + ex.getMessage());
        } finally {
            ServletContext context = request.getServletContext();
            Map<String, String> listFilter = (Map<String, String>) context.getAttribute("FILTER");
            RequestDispatcher rd = request.getRequestDispatcher(listFilter.get(HOME_PAGE_ADMIN));
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
