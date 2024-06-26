package com.test.todo.test;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.jupiter.api.*;

import com.test.todo.model.TodoDAO;
import com.test.todo.model.TodoDTO;

class DAOTest {

	@Disabled
	@Test
	void testAddTodo() {
		
		TodoDAO dao = new TodoDAO();
		int result = dao.add("또 할일입니다.");
		
		System.out.println("add");
		assertEquals(2, result);
		
	}
	
	@Test
	void testListTodo() {
		
		TodoDAO dao = new TodoDAO();
		
		ArrayList<TodoDTO> list = dao.list(null);
		
		System.out.println(list == null);
		
		assertNotNull(list);
		
	}
	
	
	@Test
	void testCheckState() {
		
		TodoDAO dao = new TodoDAO();
		
		int result = dao.checkTodo("1");
		
		assertEquals(1, result);
		
	}

}











