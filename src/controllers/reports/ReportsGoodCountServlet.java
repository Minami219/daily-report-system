package controllers.reports;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DBUtil;

/**
 * Servlet implementation class ReportsGoodCountServlet
 */
@WebServlet("reports/goodCount")
public class ReportsGoodCountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportsGoodCountServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();


        int good_count = 0;
        good_count = Integer.parseInt(request.getParameter("good_count"));
        good_count = good_count++;

        em.getTransaction().begin();
        em.getTransaction().commit();
        request.getSession().setAttribute("flush", "いいねしました");
        em.close();



        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reports/index.jsp");
        rd.forward(request, response);
    }

}
