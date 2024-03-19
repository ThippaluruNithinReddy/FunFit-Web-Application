package com.GymApplication.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GymApplication.dmlOperations.ParticipantOperations;

@WebServlet("/update-participant-handler")
public class UpdateParticipantHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int updatedId = Integer.parseInt(request.getParameter("updateId"));
        String updatedName = request.getParameter("updateName");
        int updatedAge = Integer.parseInt(request.getParameter("updateAge"));
        String updatedGender = request.getParameter("updateGender");
        int updatedBatchId = Integer.parseInt(request.getParameter("updateBatchId"));

        // Assuming you have a method in ParticipantOperations to update a participant
        ParticipantOperations participantOperations = null;
		try {
			participantOperations = new ParticipantOperations();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
            // Implement the update logic
            String result = participantOperations.updateParticipant(updatedId, updatedName, updatedAge, updatedGender, updatedBatchId);

            // Check the result and handle accordingly
            if ("Success".equals(result)) {
                // Redirect to the update-participants page after the update
                response.sendRedirect(request.getContextPath() + "/update-participant");
            } else {
                // Redirect to an error page or handle accordingly
                response.sendRedirect("error.html");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect to an error page or handle accordingly
            response.sendRedirect("error.html");
        }
    }
}

