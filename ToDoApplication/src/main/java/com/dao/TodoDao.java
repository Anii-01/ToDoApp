package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Todo;

@Component
public class TodoDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Autowired
    private SessionFactory sessionFactory;
	
	@Transactional
	public int save(Todo t)
	{
		Integer i = (Integer)this.hibernateTemplate.save(t);
		return i;
	}
	
	public List<Todo> getAll()
	{
		List<Todo> todos = this.hibernateTemplate.loadAll(Todo.class);
		return todos;
	}
	
	
	//For Delete ToDo:
	@Transactional
	public void delete(int id) {
	    Todo task = sessionFactory.getCurrentSession().get(Todo.class, id);
	    if (task != null) {
	        sessionFactory.getCurrentSession().delete(task);
	    }
	}

}
