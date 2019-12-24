package com.bigdata2019.mysite.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigdata2019.mysite.repository.GuestbookDao;
import com.bigdata2019.mysite.vo.GuestBookVo;
import com.bigdata2019.mysite.web.util.WebUtil;

public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String action = request.getParameter("a");
		
		if("insert".equals(action)) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String contents = request.getParameter("contents");

			GuestBookVo vo = new GuestBookVo(name, password, contents);
			new GuestbookDao().insert(vo);
			
			//WebUtil.forward(request, response, "/WEB-INF/views/guestbook/list.jsp");
			//WebUtil.redirect(request, response, "/WEB-INF/views/guestbook/list.jsp");
			
		}else {
			GuestbookDao dao = new GuestbookDao();
			List<GuestBookVo> list = dao.findAll();
	
			request.setAttribute("list", list);
			WebUtil.forward(request, response, "/WEB-INF/views/guestbook/list.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

