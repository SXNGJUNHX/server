package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex04Data extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//btn1
		String txt1 = req.getParameter("txt1");

		
		int length = txt1.length();
		
//		try {
//			Thread.sleep(10000);
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(length);
	
		writer.close();
	
	/*
		//btn2
		String txt2 = req.getParameter("txt2");
		
		//DB저장
		System.out.println(txt2);
	*/
	/*	
		//btn3
		PrintWriter writer = resp.getWriter();
		
		writer.print(123);
	
		writer.close();
		
	*/
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		String txt4 = req.getParameter("txt4");
		
		System.out.println(txt4);
		
		txt4 = "[" + txt4 + "]";
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(txt4);
		
		writer.close();
	}
}






















