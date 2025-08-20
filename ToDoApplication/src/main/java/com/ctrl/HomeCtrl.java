package com.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.TodoDao;
import com.entities.Todo;

@Controller 
public class HomeCtrl {
	
	@Autowired
	ServletContext context; //fetching Context object with the help of Autowired.
	
	@Autowired
	TodoDao todoDao;
	
	@RequestMapping("/home")
	public String home(Model m)
	{
		String str = "home";
		m.addAttribute("page",str);
		
		//for showing list of Todo's in context obj
		//List<Todo> list = (List<Todo>)context.getAttribute("list");
		
		List<Todo> list = this.todoDao.getAll();
		m.addAttribute("todos",list);
		
		return "home";
	}
	
	
	@RequestMapping("/add")
	public String addTodo(Model m)
	{
		Todo t = new Todo();   //blank obj
		
		m.addAttribute("page","add");
		m.addAttribute("todo",t);
		return "home";
	}
	
	@RequestMapping(value="/saveTodo", method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t,Model m)
	{
		System.out.println(t);     //use database to store this todo-t.
		t.setTodoDate(new Date());
		
		this.todoDao.save(t);
		
		//getting the todo list from context;
		//List <Todo> list = (List<Todo>)context.getAttribute("list");
		//list.add(t);
		m.addAttribute("msg","successfully added!!");
		
		return "home";
	}
	
}
