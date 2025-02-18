package com.bankingsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bankingsystem.daoimpl.MSDefinitionDAOImpl;
import com.bankingsystem.entity.MSDefinitionEntity;


/**
 * Servlet implementation class MSDefinitionController
 */
@WebServlet("/MSDefinitionController")
public class MSDefinitionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MSDefinitionController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String docmd = request.getParameter("docmd");
		String nextPage = "index.jsp";
		if(docmd.equalsIgnoreCase("getDefDetailsForUpdate")) {
			String defId = request.getParameter("defId");
			try {
				MSDefinitionEntity defEntity = MSDefinitionDAOImpl.getInstance().findByDefId(Integer.parseInt(defId));
				request.setAttribute("defEntity", defEntity);
				nextPage = "addUpdateDefinition.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (docmd.equalsIgnoreCase("addNewDefinition")) {
			
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String Description = request.getParameter("Description");
			
			try {
				
				int maxDefId = MSDefinitionDAOImpl.getInstance().getMaxDefIdByCategory(category);
				
				MSDefinitionEntity msEntity = new MSDefinitionEntity();
				msEntity.setName(name);
				msEntity.setCategory(category);
				msEntity.setStatus(Integer.parseInt(status));
				msEntity.setDescription(Description);	
				msEntity.setDefId(maxDefId+1);
				
				String result = MSDefinitionDAOImpl.getInstance().createDefinition(msEntity);
				if(result.equals("success")) {
					request.setAttribute("success", "Definition Added Successfully into system.!!");
					nextPage="addUpdateDefinition.jsp";
				}else {
					request.setAttribute("error", "Error occured While adding Definition into system.!!");
					nextPage="addUpdateDefinition.jsp";
				}							
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(docmd.equalsIgnoreCase("updateDefinition")) {
			String defId = request.getParameter("defId");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String Description = request.getParameter("Description");
			try {
				MSDefinitionEntity defEntity = MSDefinitionDAOImpl.getInstance().findByDefId(Integer.parseInt(defId));
				defEntity.setName(name);
				defEntity.setCategory(category);
				defEntity.setDescription(Description);
				defEntity.setStatus(Integer.parseInt(status));
				
				String result = MSDefinitionDAOImpl.getInstance().updateDefinition(defEntity);
				if(result.equals("success")) {
					request.setAttribute("success", "MSDefinition Updated Successfully into system.!!");
					nextPage = "addUpdateDefinition.jsp";
				}else {
					request.setAttribute("error", "Error Occurred while updating MSDefinition into system.!!");
					nextPage = "addUpdateDefinition.jsp";
				}			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

}
