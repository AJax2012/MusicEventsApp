package com.ajax2012.musicevents.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ajax2012.musicevents.dao.EventDAO;
import com.ajax2012.musicevents.event.Event;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private EventDAO eventDAO;

	@GetMapping("/")
	public String showHome(Model theModel) {

		// pull from EventDAOImple -> getEvents method. Lists all events
		List<Event> theEvents = eventDAO.getEvents();
		
		
		// adds result of previous queries to the Model
		theModel.addAttribute("events", theEvents);

		return "home";
	}

}
