package com.GymApplication.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GymApplication.dmlOperations.BatchOperations;
import com.GymApplication.dmlOperations.ParticipantOperations;
import com.GymApplication.models.Batch;
import com.GymApplication.models.Participant;

@WebServlet("/participant")
public class AddParticipant extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetching participant details from the request
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String gender = request.getParameter("gender");
            String batchId = request.getParameter("batchId");

            // Creating a Participant object
            Participant par = new Participant();
            par.setParticipantName(name);
            par.setParticipantAge(Integer.parseInt(age));
            par.setParticipantGender(gender);
            par.setBatchId(Integer.parseInt(batchId));

            // Adding the new participant
            ParticipantOperations parOpr = new ParticipantOperations();
            parOpr.addNewParticipant(par);

            // Fetching all batches for the dropdown
            BatchOperations batchOpr = new BatchOperations();
            List<Batch> batches = batchOpr.getAllBatches();

            // Set the list of batches as an attribute in the request
            request.setAttribute("batches", batches);

            // Forward the request to participant.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("participant.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            // You may want to redirect to an error page or handle the exception differently
        }
    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // Logic to handle GET requests
//        response.setContentType("text/html");
//        response.getWriter().println("<html><body><h1>GET Requests are not supported for this URL</h1></body></html>");
//    }
}
