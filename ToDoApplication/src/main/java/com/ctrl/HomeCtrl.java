package com.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.TodoDao;
import com.entities.Todo;

@Controller
public class HomeCtrl {

    @Autowired
    private ServletContext context;

    @Autowired
    private TodoDao todoDao;

    // Show home page with all todos
    @RequestMapping("/home")
    public String home(Model m) {
        m.addAttribute("page", "home");
        List<Todo> todos = todoDao.getAll();
        m.addAttribute("todos", todos);
        return "home";
    }

    // Show add todo page
    @RequestMapping("/add")
    public String addTodo(Model m) {
        Todo t = new Todo();
        m.addAttribute("page", "add");
        m.addAttribute("todo", t);
        return "home";
    }

    // Save new todo
    @RequestMapping(value = "/saveTodo", method = RequestMethod.POST)
    public String saveTodo(@ModelAttribute("todo") Todo t, Model m) {
        t.setTodoDate(new Date());
        todoDao.save(t);
        m.addAttribute("msg", "Successfully added!");
        return "home";
    }

    // Delete todo
    @Transactional
    @RequestMapping("/delete/{id}")
    public String deleteTodo(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        todoDao.delete(id);
        redirectAttributes.addFlashAttribute("msg", "Todo deleted successfully!");
        return "redirect:/home";
    }

    // Show edit form
    @Transactional
    @RequestMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model m) {
        Todo todo = todoDao.getById(id);
        m.addAttribute("todo", todo);
        return "edit"; // resolved by InternalResourceViewResolver
    }

    // Update todo
    @Transactional
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateTodo(@ModelAttribute("todo") Todo todo, RedirectAttributes redirectAttributes) {
        todo.setTodoDate(new Date()); // Update timestamp
        todoDao.update(todo);
        redirectAttributes.addFlashAttribute("msg", "Todo updated successfully!");
        return "redirect:/home";
    }
}
