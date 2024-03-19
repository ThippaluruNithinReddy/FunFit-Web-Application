// BatchParticipantsServlet.java
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

@WebServlet("/batch-participants")
public class BatchParticipantsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Inside doGet method of BatchParticipantsServlet");

        BatchOperations batchOperations = null;
        List<Batch> batchesWithParticipants = null;

        try {
            batchOperations = new BatchOperations();
            batchesWithParticipants = batchOperations.getBatchesWithParticipants();
        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect or handle the exception
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions
        } finally {
            if (batchOperations != null) {
                batchOperations.closeConnection();
            }
        }

        request.setAttribute("batchesWithParticipants", batchesWithParticipants);
        request.getRequestDispatcher("/batch-participants.jsp").forward(request, response);
    }
}
