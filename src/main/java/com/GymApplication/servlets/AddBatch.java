package com.GymApplication.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GymApplication.dmlOperations.BatchOperations;
import com.GymApplication.models.Batch;

@WebServlet("/AddBatch")
public class AddBatch extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String batchName = request.getParameter("batchName");
		String batchTime = request.getParameter("batchTime");

		
		
		Batch btc = new Batch();
		
		btc.setBatchName(batchName);
		btc.setBatchTime(batchTime);
		
		try {
			BatchOperations btcOpr = new BatchOperations();
			btcOpr.addNewBatch(btc);
			RequestDispatcher dispatcher = request.getRequestDispatcher("batch.html");
            dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	

}
