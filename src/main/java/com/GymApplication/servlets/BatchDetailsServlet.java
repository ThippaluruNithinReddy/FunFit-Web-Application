package com.GymApplication.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GymApplication.dmlOperations.BatchOperations;
import com.GymApplication.models.Batch;
import com.GymApplication.models.Participant;

@WebServlet("/batchDetails")
public class BatchDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String batchIdString = request.getParameter("batchId");

        if (batchIdString != null && !batchIdString.isEmpty()) {
            try {
                int batchId = Integer.parseInt(batchIdString);

                // Call the methods to get batch and participants
                BatchOperations batchOperations = null;
				try {
					batchOperations = new BatchOperations();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                Batch batch = batchOperations.getBatchById(batchId);

                if (batch != null) {
                    List<Participant> participants = batchOperations.getParticipantsForBatch(batchId);

                    // Set attributes in the request
                    request.setAttribute("batch", batch);
                    request.setAttribute("participants", participants);

                    // Forward the request to the batchDetails.jsp page
                    request.getRequestDispatcher("/batchDetails.jsp").forward(request, response);
                } else {
                    // Handle case when batch is not found
                    response.getWriter().println("Batch not found for ID: " + batchId);
                }
            } catch (NumberFormatException e) {
                // Handle invalid batchId parameter (not a number)
                response.getWriter().println("Invalid batchId parameter. Please provide a valid number.");
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle SQLException, e.g., show an error message
                response.getWriter().println("Error fetching batch details.");
            } finally {
                // Close resources (if necessary)
                
            }
        } else {
            // Handle missing batchId parameter
            response.getWriter().println("Missing batchId parameter. Please provide a batchId.");
        }
    }
}
