package com.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.TodoDao;

public class ToDoService {

	@Autowired
	private TodoDao tododao;
	
	public void delete(int id){
		tododao.delete(id);
	}
}
